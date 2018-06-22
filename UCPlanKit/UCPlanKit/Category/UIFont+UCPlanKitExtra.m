//
//  UIFont+UCPlanKitExtra.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UIFont+UCPlanKitExtra.h"

@implementation UIFont (UCPlanKitExtra)
+ (UIFont *)defaltMaxFont;
{
    return [UIFont systemFontOfSize:18.f];
}

+ (UIFont *)defaultBigFont;
{
    return [UIFont systemFontOfSize:17.f];
}

+ (UIFont *)defaultNormalFont;
{
    return [UIFont systemFontOfSize:15.f];
}

+ (UIFont *)defaultMediumFont;
{
    return [UIFont systemFontOfSize:13.f];
}

+ (UIFont *)defaultSmallFont;
{
    return [UIFont systemFontOfSize:11.f];
}

+ (UIFont *)defaultMinFont;
{
    return [UIFont systemFontOfSize:10.f];
}
@end
