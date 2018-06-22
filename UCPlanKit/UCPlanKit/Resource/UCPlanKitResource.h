//
//  UCPlanKitResource.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/21.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UCPlanKitResource : NSObject
+ (UIImage *)imageNamed:(NSString *)name;
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString*)bundleName;
@end
