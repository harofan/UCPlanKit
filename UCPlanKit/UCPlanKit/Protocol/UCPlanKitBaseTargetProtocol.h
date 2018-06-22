//
//  UCPlanKitBaseTargetProtocol.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/21.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UCPlanKitBaseTargetNormalArgument.h"

@protocol UCPlanKitBaseTargetProtocol <NSObject>

@optional
- (UIViewController *)Action_fetchViewControllerWithArgument:(UCPlanKitBaseTargetNormalArgument *)argumentObj;
- (UIView *)Action_fetchViewWithArgument:(UCPlanKitBaseTargetNormalArgument *)argumentObj;

@end
