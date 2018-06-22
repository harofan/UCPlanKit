//
//  TargetA.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/21.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "TargetA.h"
#import "VC1.h"

@implementation TargetA
- (UIViewController *)Action_fetchViewControllerWithArgument:(UCPlanKitBaseTargetNormalArgument *)argumentObj{
    return [VC1 new];
}
@end
