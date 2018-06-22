//
//  UITableViewCell+UCPlanKitExtra.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UITableViewCell+UCPlanKitExtra.h"

@implementation UITableViewCell (UCPlanKitExtra)
+ (NSString *)getCellIDStr
{
    return NSStringFromClass([self class]);
}
@end
