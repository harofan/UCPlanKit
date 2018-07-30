//
//  UIView+UCPlanKitGesture.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^UCTouchGestureBlock)(UIGestureRecognizer *gestureRecoginzer);
@interface UIView (UCPlanKitGesture)<UIGestureRecognizerDelegate>
/**
 手势
 */
- (void)uc_addTapGestureWithBlock:(UCTouchGestureBlock)block;
- (void)uc_addLongPressGestureWithBlock:(UCTouchGestureBlock)block;
- (void)uc_addDoubleClickGestureWithBlock:(UCTouchGestureBlock)block;
- (void)uc_addTwoFingerTappedGestureWithBlock:(UCTouchGestureBlock)block;

@end
