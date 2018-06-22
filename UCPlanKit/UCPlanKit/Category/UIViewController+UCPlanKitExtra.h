//
//  UIViewController+UCPlanKitExtra.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UCPlanKitExtra)
/**
 设置状态栏颜色
 */
- (void)setStatusBarBackgroundColor:(UIColor *)color;

/**
 获取导航栏
 */
- (UINavigationController *)getNavigationViewController;

/**
 抖动效果
 */
- (void)startShakeAnimationWithView:(UIView *)view;
@end
