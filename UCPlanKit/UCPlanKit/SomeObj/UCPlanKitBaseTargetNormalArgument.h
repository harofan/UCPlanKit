//
//  UCPlanKitBaseTargetNormalArgument.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/21.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UCPlanKitBaseTargetNormalArgument : NSObject
@property (copy, nonatomic) NSDictionary *arguDict;
@property (copy, nonatomic) void (^completionCallBack)(NSDictionary *result) ;
@property (copy, nonatomic) void (^failureCallBack)(NSError *error);
@end
