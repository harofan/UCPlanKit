//
//  NSString+UCPlanKitExtra.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (UCPlanKitExtra)

/**
 判断字符串是否为数字
 */
+ (BOOL)isNum:(NSString *)checkedNumString;

/**
 从字符串中提取数字
 */
+ (NSString *)getNumberWithString:(NSString *)string;

/**
 校验身份证号
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

/**
 校验手机号
 */
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber;

/**
 32位MD5加密方式
 */
+ (NSString *)MD5_32Bit:(NSString *)str;

/**
 16位md5加密方式
 */
+ (NSString *)md5_16Bit:(NSString *)srcString;

/**
 返回web地址编码
 */
+ (NSString *)URLEncodedString:(NSString *)str;

/**
 返回银行中文名称
 */
+ (NSString *)getChaneseWithBankCode:(NSString*)bankCode;

/**
 判断是否是银行卡
 */
+ (BOOL)isBankCard:(NSString *)cardNumber;

/**
 返回文本的size
 */
+ (CGSize)sizeWithString:(NSString *)string
                    font:(UIFont *)font
             ParagrapGap:(CGFloat)gap
             withMaxSize:(CGSize)Size;

/**
 若有emoji表情则返回为NO
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 计算laebl行数
 */
+ (CGFloat)getLineNum:(NSString*)str  labelWidth:(CGFloat)width;

/**
 获取这个字符串中的所有xxx的所在的index
 */
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText;

/**
 打电话
 */
+ (void)callWithWithOutRemindAndNumber:(NSString *)number;

/**
 将时间戳转换成日期string
 */
+ (NSString *)transfromStrToDatestring:(NSString *)string isHaveHour:(BOOL)isHaveHour;

/**
 转换为月/日
 */
+ (NSString *)transfromStrToMonthDayDateString:(NSString *)string;

/**
 判断是不是正确的邮箱
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 过滤从字符串中取出中文
 */
+ (NSString *)getChineseStringWithString:(NSString *)string;

/**
 判断时间是不是今天
 */
+ (BOOL)validateIsToday:(NSString *)endTime;

/**
 判断是不是大于等于今天
 */
+ (BOOL)beyondToday:(NSString *)endTime;

/**
 判断字符串是否为空
 */
+ (BOOL)isNullWithString:(NSString *)string;

/**
 h5转富文本
 */
+ (NSAttributedString *)html5StrToAttributedStringWithH5String:(NSString *)h5String;

/**
 是否为连续的数字
 */
+ (BOOL)isSequentialNum:(NSString *)str;
@end
