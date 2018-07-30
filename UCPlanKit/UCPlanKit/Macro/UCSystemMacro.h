//
//  UCSystemMacro.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef UCSystemMacro_h
#define UCSystemMacro_h

#pragma mark - LOG
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define UCLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define UCLog(...)
#endif

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define UCAlertLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define UCAlertLog(...)
#endif

#pragma mark - 系统和设备
//获取系统版本
#define UC_IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define UC_CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define UC_CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//检查系统版本
#define UC_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define UC_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define UC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define UC_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define UC_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// 版本是否 == v
#define UC_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
// 版本是否 > v
#define UC_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
// 版本是否 >= v
#define UC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
// 版本是否 < v
#define UC_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
// 版本是否 <= v
#define UC_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// iOS系统版本
#define UC_IOS6_OR_LATER  ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define UC_IOS7_OR_LATER [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define UC_IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define UC_IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define UC_IOS7_OR_Before ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)

#define UC_IOS8_TO_10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 10.0)
#define UC_IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#pragma mark - 内存
//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#pragma mark - APP 版本

// APP版本的判断
#define UC_CURRENT_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// bunld版本号
#define UC_KBUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define UC_Application_Server_Language NSLocalizedString(@"TKN_SERVER_LANGUAGE_ID", @"")
#define UC_Landing_Processing NSLocalizedString(@"TKN_LANDING_PROCESSING", @"NO_Contacts")
#define UC_Landing_Processing2 NSLocalizedString(@"TKN_LANDING_PROCESSING2", @"NO_Contacts")
#define UC_Landing_Hint NSLocalizedString(@"TKN_LANDING_HINT", @"NO_Contacts")

#define UC_KUserAgent @"iPhone/%@.%@ /IOSVersion:%f /Platform:%@"
#define UC_PublishTime [[[NSBundle mainBundle] infoDictionary] objectForKey:@"PublishTime"]

#define UC_appDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)
#define UC_AlertTitle [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define UC_AppName [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey]
#define UC_appActive ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive)


#endif /* UCSystemMacro_h */
