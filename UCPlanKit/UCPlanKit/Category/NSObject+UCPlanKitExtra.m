//
//  NSObject+UCPlanKitExtra.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "NSObject+UCPlanKitExtra.h"

@implementation NSObject (UCPlanKitExtra)

//获取当前屏幕显示的viewcontroller
- (UIViewController *)uc_currentRootTopVC
{
    UIViewController *result = nil;
    
    // 获取默认的window
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    // 获取window的rootViewController
    result = window.rootViewController;
    
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        if ([((UITabBarController *)result).selectedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)[(UITabBarController *)result selectedViewController];
            return [nav visibleViewController];
        } else {
            return [(UITabBarController *)result selectedViewController];
        }
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result visibleViewController];
    }
    return result;
}

- (UINavigationController *)uc_currentNav
{
    UIViewController *result = [self uc_currentRootTopVC];
    if(result.navigationController==nil){
        NSLog(@"❗result.navigationController is nil,because result is %@❗",result);
        NSLog(@"❗so create a testNav❗");
        return [self uc_testNav:result];
    }
    return result.navigationController;
}

-(UINavigationController *)uc_testNav:(UIViewController*)rootVC{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UINavigationController *tempNav = [[UINavigationController alloc]initWithRootViewController:[UIViewController new]];
    [tempNav setNavigationBarHidden:YES animated:NO];
    tempNav.interactivePopGestureRecognizer.enabled = YES;
    window.rootViewController = tempNav;
    [window makeKeyAndVisible];
    [tempNav pushViewController:rootVC animated:NO];
    tempNav.interactivePopGestureRecognizer.delegate = rootVC;
    return tempNav;
}

@end
