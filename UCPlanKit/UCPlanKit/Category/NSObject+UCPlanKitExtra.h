//
//  NSObject+UCPlanKitExtra.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (UCPlanKitExtra)

/**
 获取当前屏幕显示的viewcontroller
 */
- (UIViewController *)uc_currentRootTopVC;

/**
 获取导航栏
 */
- (UINavigationController *)uc_currentNav;
@end
