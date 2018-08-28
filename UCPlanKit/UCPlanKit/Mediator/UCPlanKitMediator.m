//
//  UCPlanKitMediator.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UCPlanKitMediator.h"
#import <objc/runtime.h>
#import "UCPlanKitMediaorParser.h"
#import "UCSomeObj.h"

@interface UCPlanKitMediator()
@property (strong, nonatomic) UCPlanKitMediaorParser *mediaoParser;


@end
@implementation UCPlanKitMediator

+ (instancetype)sharedInstance
{
    static UCPlanKitMediator *_mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mediator = [[UCPlanKitMediator alloc] init];
    });
    return _mediator;
}

- (id)thirdPartyPerformActionWithUrl:(NSString *)urlStr completion:(void (^)(NSDictionary *result))completion{
    
    //这里做一些第三方的处理
    
    return [self nativePerformActionWithUrl:urlStr arg:nil completion:completion failure:nil];
}

- (id)nativePerformTarget:(NSString *)targetName
                   action:(NSString *)actionName
                   params:(NSDictionary *)params
               completion:(void (^)(NSDictionary *result))completionCallBack
                  failure:(void (^)(NSError *error))failureCallBack{
    Class classObj = NSClassFromString(targetName);
    SEL actionObj = NSSelectorFromString(actionName);
    NSString *errorStr;
    if (!classObj) {
        errorStr = [NSString stringWithFormat:@"*%@组件不存在, 请检查调用", targetName];
    } else if (!actionObj) {
        errorStr = [NSString stringWithFormat:@"*%@组件%@方法调用错误, 请检查调用", targetName, actionName];
    } else if (![[classObj new] respondsToSelector:actionObj]) {
        errorStr = [NSString stringWithFormat:@"*%@组件没有实现%@方法, 请检查调用", targetName, actionName];
    }else {
        //参数处理
        UCPlanKitBaseTargetNormalArgument *argObj = [self p_createArgsArrayWithArg:params completion:completionCallBack failure:failureCallBack];
        
        //没有错误发消息
        return [self p_safePerformAction:actionObj target:[classObj new] params:argObj];
    }
    //打印错误信息
    NSLog(@"%@",errorStr);
    return nil;
}

- (id)nativePerformActionWithUrl:(NSString *)urlStr arg:(NSDictionary *)arg completion:(void (^)(NSDictionary *result))completionCallBack failure:(void (^)(NSError *error))failureCallBack{
    
    NSMutableDictionary *afterParserMDict = [self.mediaoParser extractParametersFromURL:urlStr];

    NSString *scheme = afterParserMDict[kUCMediatorScheme];
    NSString *moduleName = afterParserMDict[kUCMediatorModule];
    NSString *action = afterParserMDict[kUCMediatorAction];
    NSString *symbol = afterParserMDict[kUCMediatorSymbol];
    
    // 提取出query中的参数,只要value 形成一个字典
    NSDictionary *queryParams = [self.mediaoParser extractParamsFromQuery: afterParserMDict[kUCMediatorQuery]];

    // 拼装query参数和手动传入参数
    NSMutableDictionary *finalArg = [self.mediaoParser composeParams:queryParams attachParams:arg];
    
    //参数处理
    UCPlanKitBaseTargetNormalArgument *argObj = [self p_createArgsArrayWithArg:(NSDictionary *)finalArg completion:completionCallBack failure:failureCallBack];
    
    //发消息
    Class classObj = NSClassFromString(moduleName);
    NSString *finalAction = [NSString stringWithFormat:@"%@_%@",moduleName,action];
    SEL selObj = NSSelectorFromString(finalAction);
    NSString *errorStr;
    if (!classObj) {
        errorStr = [NSString stringWithFormat:@"*%@组件不存在, 请检查调用的url:%@", moduleName, urlStr];
    } else if (!selObj) {
        errorStr = [NSString stringWithFormat:@"*%@组件%@方法调用错误, 请检查调用的url:%@", moduleName, action, urlStr];
    } else if (![[classObj new] respondsToSelector:selObj]) {
        errorStr = [NSString stringWithFormat:@"*%@组件没有实现%@方法, 请检查调用的url:%@", moduleName, action, urlStr];
    } else if (afterParserMDict[kUCMediatorErrorKey]){
        errorStr = [NSString stringWithFormat:@"url参数解析错误, url:%@",urlStr];
    }else {
        //没有错误发消息
        return [self p_safePerformAction:selObj target:[classObj new] params:argObj];
    }
    
    //打印错误信息
    NSLog(@"%@",errorStr);
    return nil;
}
#pragma mark - private
- (UCPlanKitBaseTargetNormalArgument *)p_createArgsArrayWithArg:(NSDictionary *)arg
                           completion:(void (^)(NSDictionary *result))completionCallBack
                              failure:(void (^)(NSError *error))failureCallBack{
    
    UCPlanKitBaseTargetNormalArgument *argObj = [[UCPlanKitBaseTargetNormalArgument alloc] init];
    if (arg) {
        argObj.arguDict = arg;
    }else{
        argObj.arguDict = nil;
    }
    
    if (completionCallBack) {
        argObj.completionCallBack = completionCallBack;
    }else{
        void(^tempBlock)(NSDictionary *) = ^(NSDictionary *result){};
        argObj.completionCallBack = tempBlock;
    }
    
    if (failureCallBack) {
        argObj.failureCallBack = failureCallBack;
    }else{
        void (^tempBlock)(NSError *error) = ^(NSError *error){};
        argObj.failureCallBack = tempBlock;
    }
    return argObj;
}

- (id)p_safePerformAction:(SEL)action target:(NSObject *)target params:(UCPlanKitBaseTargetNormalArgument *)parObj
{
    NSMethodSignature* methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) {
        return nil;
    }
    const char* retType = [methodSig methodReturnType];
    
    //返回值为void
    if (strcmp(retType, @encode(void)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&parObj atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        return nil;
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&parObj atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&parObj atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&parObj atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&parObj atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:parObj];
#pragma clang diagnostic pop
}

#pragma mark - set && get
- (UCPlanKitMediaorParser *)mediaoParser{
    if (!_mediaoParser) {
        _mediaoParser = [UCPlanKitMediaorParser new];
    }
    return _mediaoParser;
}
@end
