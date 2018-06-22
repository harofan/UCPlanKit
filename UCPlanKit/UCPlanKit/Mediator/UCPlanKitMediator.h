//
//  UCPlanKitMediator.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UCPlanKitMediator : NSObject

+ (instancetype)sharedInstance;

// 远程App调用入口
- (id)thirdPartyPerformActionWithUrl:(NSString *)urlStr
                          completion:(void (^)(NSDictionary *result))completion;
// 本地组件调用入口推荐
- (id)nativePerformActionWithUrl:(NSString *)urlStr
                             arg:(NSDictionary *)arg
                      completion:(void (^)(NSDictionary *result))completionCallBack
                         failure:(void (^)(NSError *error))failureCallBack;

//本地url调用组件,不推荐
- (id)nativePerformTarget:(NSString *)targetName
                   action:(NSString *)actionName
                   params:(NSDictionary *)params
               completion:(void (^)(NSDictionary *result))completionCallBack
                  failure:(void (^)(NSError *error))failureCallBack;
@end
