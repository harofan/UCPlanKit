//
//  UCPlanKitMediator+TargetAModule.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/21.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UCPlanKitMediator+TargetAModule.h"

#pragma mark - TargetA
static NSString * const kTargetA = @"TargetA";

static NSString * const kActionFetchVC = @"Action_fetchViewControllerWithArgument:";

@implementation UCPlanKitMediator (TargetAModule)

- (UIViewController *)fetchVC{
    
    UIViewController *vc = [self nativePerformTarget:kTargetA
                                              action:kActionFetchVC
                                              params:@{@"haha":@"doubi"}
                                          completion:nil
                                             failure:nil];
    return vc;
}

@end
