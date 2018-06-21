//
//  UCPlanKitMediaorParser.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>

extern  NSString *const __nonnull kUCMediatorENCodeURL;
extern  NSString *const __nonnull kUCMediatorScheme;
extern  NSString *const __nonnull kUCMediatorModule;
extern  NSString *const __nonnull kUCMediatorAction;
extern  NSString *const __nonnull kUCMediatorQuery;
extern  NSString *const __nonnull kUCMediatorSymbol;
extern  NSString *const __nonnull kUCMediatorErrorKey;

@interface UCPlanKitMediaorParser : NSObject

- (NSMutableDictionary *)extractParametersFromURL:(NSString *)url;
- (NSDictionary *)extractParamsFromQuery:(NSString *)query;
- (NSMutableDictionary *) composeParams:(NSDictionary *)queryParams attachParams:(id)attachParams;
@end
