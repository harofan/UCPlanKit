//
//  UIImage+UCPlanKitExtra.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UCPlanKitExtra)
/**
 缩放图片
 @param width 缩放后的宽度
 */
+(UIImage *)reduceScaleToWidth:(CGFloat)width andImage:(UIImage *)image;

/**
 缩放图片宽高4:3
 */
+(UIImage *)reducePhotoScaleToWidth:(CGFloat)width andImage:(UIImage *)image;

/**
 根据传入color返回相应颜色的图片
 */
+ (UIImage *)extraImageWithColor:(UIColor *)color;

/**
 改变图片方向
 */
+(UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

- (UIImage *)circleImage;
@end
