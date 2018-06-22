//
//  TargetA.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/21.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UCPlanKitBaseTargetProtocol.h"

@interface TargetA : NSObject<UCPlanKitBaseTargetProtocol>
- (UIViewController *)Action_fetchViewControllerWithArgument:(UCPlanKitBaseTargetNormalArgument *)argumentObj;
@end

