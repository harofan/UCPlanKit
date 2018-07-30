//
//  UIView+UCPlanKitExtra.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UIView+UCPlanKitExtra.h"

@implementation UIView (UCPlanKitExtra)

- (void)uc_removeAllSubViews{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
