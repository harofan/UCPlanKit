//
//  UCPlanKitMacro.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef UCPlanKitMacro_h
#define UCPlanKitMacro_h

// 屏幕宽高
#define kScreenWidth      [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight     [[UIScreen mainScreen] bounds].size.height

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IS_IPHONE_4 (IS_IPHONE && ([[UIScreen mainScreen] bounds].size.height == 480.0) && ((IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale) || (!IS_OS_8_OR_LATER && ([[UIScreen mainScreen] bounds].size.height == 480.0)) ))
#define IS_IPHONE_5 (IS_IPHONE && ([[UIScreen mainScreen] bounds].size.height == 568.0) && ((IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale) || (!IS_OS_8_OR_LATER && ([[UIScreen mainScreen] bounds].size.height == 568.0)) ))
#define IS_STANDARD_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0  && IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale)
#define IS_STANDARD_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define IS_STANDARD_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0)

// 使用红绿蓝色值、透明度实例化UIClor
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// 在Debug下使用printf打印日志
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

// 方便弱引用类型的声明与赋值
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

// 方便强引用类型的声明与赋值
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* UCPlanKitMacro_h */
