//
//  UIImageView+UCPlanKitExtra.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/6/20.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (UCPlanKitExtra)
/** 解析gif文件数据的方法 block中会将解析的数据传递出来 */
-(void)getGifImageWithUrl:(NSURL *)url returnData:(void(^)(NSArray<UIImage *> * imageArray,NSArray<NSNumber *>*timeArray,CGFloat totalTime, NSArray<NSNumber *>* widths, NSArray<NSNumber *>* heights))dataBlock;

/** 为UIImageView添加一个设置gif图内容的方法： */
-(void)sd_setImage:(NSURL *)imageUrl;

- (void)setCircleImageView;
@end
