//
//  UCOtherMacro.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef UCOtherMacro_h
#define UCOtherMacro_h

#pragma mark - 数据存储与读取
// 获取沙盒下的路径
#define UC_GET_DOCUMENTS_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define UC_FILE_PATH(s) [UC_MY_DOC_PATH stringByAppendingPathComponent:s]
#define UC_MY_DOC_PATH NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

// 读取plist文件到字典
#define UC_READ_PLIST_TO_MDICT(plist) [[[NSMutableDictionary alloc] initWithContentsOfFile:UC_FILE_PATH(plist)] mutableCopy]


#pragma mark - 读取时分秒
#define UC_CURRENT_SEC [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define UC_CURRENT_MIN [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define UC_CURRENT_HOUR [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
#define UC_CURRENT_DAY [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]]
#define UC_CURRENT_MONTH [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]]
#define UC_CURRENT_YEAR [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]]

#pragma mark - UUID
//UUID
#define UC_UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

#pragma mark - weak-strong
// 方便弱引用类型的声明与赋值
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define UC_weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define UC_weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define UC_weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define UC_weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

// 方便强引用类型的声明与赋值
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define UC_strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define UC_strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define UC_strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define UC_strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* UCOtherMacro_h */
