//
//  NSString+UCPlanKitExtra.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "NSString+UCPlanKitExtra.h"
#import <CommonCrypto/CommonCrypto.h>
#import "UCSystemMacro.h"

@implementation NSString (UCPlanKitExtra)
+ (BOOL)isNum:(NSString *)checkedNumString{
    checkedNumString = [checkedNumString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(checkedNumString.length > 0) {
        return NO;
    }
    return YES;
}

+ (NSString *)getNumberWithString:(NSString *)string{
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z.-]" options:0 error:NULL];
    NSString *result = [regular stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
    return result;
}

+ (BOOL)validateIdentityCard:(NSString *)identityCard{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate  predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber{
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (phoneNumber.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:phoneNumber];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:phoneNumber];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:phoneNumber];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}

+ (NSString *)MD5_32Bit:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    NSString* str_format = [NSString stringWithFormat:
                            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                            result[0], result[1], result[2], result[3],
                            result[4], result[5], result[6], result[7],
                            result[8], result[9], result[10], result[11],
                            result[12], result[13], result[14], result[15]
                            ];
    return  str_format.uppercaseString;
}

+ (NSString *)md5_16Bit:(NSString *)srcString{
    //提取32位MD5散列的中间16位
    NSString *md5_32Bit_String=[self MD5_32Bit:srcString];
    
    NSLog(@"===========s=sssss===%@",md5_32Bit_String);
    NSString *result = [[md5_32Bit_String substringToIndex:24] substringFromIndex:8];//即9～25位
    
    return result;
}

+ (NSString *)URLEncodedString:(NSString *)str{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)str,
                                                              (CFStringRef)@"!$'()*+,-.:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}

+ (NSString *)getChaneseWithBankCode:(NSString*)bankCode{
    NSDictionary * bankDict = @{@"CCB":@"中国建设银行",
                                @"ICBC":@"中国工商银行",
                                @"ABCB":@"中国农业银行",
                                @"BOC":@"中国银行",
                                @"CEB":@"中国光大银行",
                                @"CMB":@"招商银行",
                                @"CMBC":@"中国民生银行",
                                @"ECTIC":@"中信银行",
                                @"CGB":@"广东发展银行",
                                @"SPDB":@"浦东发展银行",
                                @"PINGAN":@"平安银行股份有限公司",
                                @"CIB":@"兴业银行",
                                @"YOUZHENG":@"中国邮政储蓄银行",};
    
    NSString * bankStr = [bankDict objectForKey:bankCode];
    
    if ([bankStr isEqualToString:@""] || [bankStr isEqual:[NSNull null]] || bankStr.length == 0) {
        //字典没取到返回卡号
        return bankCode;
    }else{
        return bankStr;
    }
}

+ (BOOL)isBankCard:(NSString *)cardNumber{
    if(cardNumber.length==0)
    {
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++)
    {
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
    {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo)
        {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

+ (CGSize)sizeWithString:(NSString *)string
                    font:(UIFont *)font
             ParagrapGap:(CGFloat)gap
             withMaxSize:(CGSize)Size{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = gap;
    CGRect rect = [string boundingRectWithSize:Size//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: font,NSParagraphStyleAttributeName:style}//传入的字体字典
                                       context:nil];
    return rect.size;
}

+ (BOOL)stringContainsEmoji:(NSString *)string{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

+ (CGFloat)getLineNum:(NSString*)str  labelWidth:(CGFloat)width{
    if (str.length<1)
    {
        return 0;
    }
    UIFont * font = [UIFont systemFontOfSize:16];
    CGFloat oneRowHeight = [@"占位" sizeWithAttributes:@{NSFontAttributeName:font}].height;
    CGSize textSize = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    CGFloat rows = textSize.height / oneRowHeight;
    
    return rows;
}

+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText{
    
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    
    if (findText == nil && [findText isEqualToString:@""]){
        return nil;
    }
    
    NSRange rang = [text rangeOfString:findText]; //获取第一次出现的range
    if (rang.location != NSNotFound && rang.length != 0)
    {
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];//将第一次的加入到数组中
        NSRange rang1 = {0,0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++){
            
            if (0 == i)
            {//去掉这个xxx
                
                location = rang.location + rang.length;
                length = text.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            }else{
                
                location = rang1.location + rang1.length;
                length = text.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            
            //在一个range范围内查找另一个字符串的range
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0){
                break;
            }else//添加符合条件的location进数组
                [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
            
        }
        return arrayRanges;
    }
    return nil;
}

+ (void)callWithWithOutRemindAndNumber:(NSString *)number{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",number]];
    if (UC_IOS_VERSION < 10.0) {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            NSLog(@"打电话");
        }];
    }
}

+ (NSString *)transfromStrToDatestring:(NSString *)string isHaveHour:(BOOL)isHaveHour{
    NSTimeInterval time = [string doubleValue]/1000;
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    if (isHaveHour) {
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    }else{
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    }
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

+ (NSString *)transfromStrToMonthDayDateString:(NSString *)string{
    NSTimeInterval time = [string doubleValue]/1000;
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

+ (BOOL)validateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email]; 
}

+ (NSString *)getChineseStringWithString:(NSString *)string{
    if (string == nil || [string isEqual:@""])
    {
        return nil;
    }
    NSMutableArray *chineseStrArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < string.length; i ++) {
        NSRange charRange = NSMakeRange(i, 1);
        NSString *charStr = [string substringWithRange:charRange];
        const char *c_str = [charStr UTF8String];
        //判断是中文
        if (strlen(c_str) == 3) {
            [chineseStrArray addObject:charStr];
        }
    }
    
    //过滤str拼接
    NSString *filterStr = @"";
    for (int i = 0; i <chineseStrArray.count; i++) {
        filterStr = [NSString stringWithFormat:@"%@%@",filterStr,chineseStrArray[i]];
    }
    return filterStr;
}

+ (BOOL)validateIsToday:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //    NSDate *startD =[date dateFromString:startTime];
    NSDate *startD = [NSDate date];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    
    int second = (int)value %60;//秒
    int minute = (int)value /60%60;
    int house = (int)value / (24 * 3600)%3600;
    int day = (int)value / (24 * 3600);
    
    NSString *str;
    if (day != 0) {
        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
        return NO;
    }else
    {
        return YES;
    }
    return NO;
}

+ (BOOL)beyondToday:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //    NSDate *startD =[date dateFromString:startTime];
    NSDate *startD = [NSDate date];
    NSDate *endD = [date dateFromString:endTime];
    
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    
    int second = (int)value %60;//秒
    int minute = (int)value /60%60;
    int house = (int)value / (24 * 3600)%3600;
    int day = (int)value / (24 * 3600);
    
    NSString *str;
    if (day < 0) {
        return NO;
    }else{
        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
        return YES;
    }
    
    return NO;
}

+ (BOOL)isNullWithString:(NSString *)string{
    if (string == nil || string == NULL || string.length == 0) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
}

+ (NSAttributedString *)html5StrToAttributedStringWithH5String:(NSString *)h5String{
    NSString *content = @"";
    if (h5String.length > 0) {
        content = h5String;
    }
    NSData *data = [content dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSAttributedString *html = [[NSAttributedString alloc]initWithData:data
                                                               options:options
                                                    documentAttributes:nil
                                                                 error:nil];
    return html;
}

+ (BOOL)isSequentialNum:(NSString *)str{
    if (str.length < 2) {//如果小于两位数直接返回
        return NO;
    }else{
        NSInteger firstNum = [str substringWithRange:NSMakeRange(0, 1)].integerValue;
        NSInteger secondNum = [str substringWithRange:NSMakeRange(1, 1)].integerValue;
        if (secondNum - firstNum == 1) {
            if (str.length == 2) {//一直到最后两位还是正确的
                return YES;
            }else{
                return [NSString isSequentialNum:[str substringFromIndex:1]];
            }
        }else{
            return NO;
        }
    }
}
@end
