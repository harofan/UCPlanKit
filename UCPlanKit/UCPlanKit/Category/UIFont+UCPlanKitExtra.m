//
//  UIFont+UCPlanKitExtra.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UIFont+UCPlanKitExtra.h"

@implementation UIFont (UCPlanKitExtra)
+ (UIFont *)uc_defaltMaxFont;
{
    return [UIFont systemFontOfSize:18.f];
}

+ (UIFont *)uc_defaultBigFont;
{
    return [UIFont systemFontOfSize:17.f];
}

+ (UIFont *)uc_defaultNormalFont;
{
    return [UIFont systemFontOfSize:15.f];
}

+ (UIFont *)uc_defaultMediumFont;
{
    return [UIFont systemFontOfSize:13.f];
}

+ (UIFont *)uc_defaultSmallFont;
{
    return [UIFont systemFontOfSize:11.f];
}

+ (UIFont *)uc_defaultMinFont;
{
    return [UIFont systemFontOfSize:10.f];
}
@end
