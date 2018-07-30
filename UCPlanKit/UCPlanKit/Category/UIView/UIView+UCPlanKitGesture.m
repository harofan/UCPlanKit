//
//  UIView+UCPlanKitGesture.m
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UIView+UCPlanKitGesture.h"
#import <objc/runtime.h>

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;

static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;

static char kActionHandlerDoubleTapBlockKey;
static char kActionHandlerDoubleTapGestureKey;

static char kActionHandlerTwoFingerBlockKey;
static char kActionHandlerTwoFingerGestureKey;


@implementation UIView (UCPlanKitGesture)

#pragma mark - public
- (void)uc_addTapGestureWithBlock:(UCTouchGestureBlock)block{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uc_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)uc_addLongPressGestureWithBlock:(UCTouchGestureBlock)block
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(uc_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)uc_addDoubleClickGestureWithBlock:(UCTouchGestureBlock)block{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerDoubleTapGestureKey);
    if (!gesture)
    {
        gesture = [self uc_addTapGestureRecognizerWithTaps:2
                                                   touches:1
                                                  selector:@selector(uc_handleActionForDoubleClickGesture:)];
        objc_setAssociatedObject(self, &kActionHandlerDoubleTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerDoubleTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)uc_addTwoFingerTappedGestureWithBlock:(UCTouchGestureBlock)block{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTwoFingerGestureKey);
    if (!gesture)
    {
        gesture = [self uc_addTapGestureRecognizerWithTaps:1
                                                   touches:2
                                                  selector:@selector(uc_handleActionForDoubleClickGesture:)];
        
        objc_setAssociatedObject(self, &kActionHandlerTwoFingerGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTwoFingerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

#pragma mark - create gesture
- (UITapGestureRecognizer*)uc_addTapGestureRecognizerWithTaps:(NSUInteger)taps
                                                   touches:(NSUInteger)touches
                                                  selector:(SEL)selector {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = taps;
    tapGesture.numberOfTouchesRequired = touches;
    [self addGestureRecognizer:tapGesture];
    
    return tapGesture;
}


#pragma mark - handle
- (void)callBackWithGesture:(UITapGestureRecognizer*)gesture
               blockCharKey:(char *)blockCharKey{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        UCTouchGestureBlock block = objc_getAssociatedObject(self, blockCharKey);
        if (block) block(gesture);
    }
}
- (void)uc_handleActionForTapGesture:(UITapGestureRecognizer*)gesture{
    [self callBackWithGesture:gesture blockCharKey:&kActionHandlerTapBlockKey];
}

- (void)uc_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture{
    [self callBackWithGesture:gesture blockCharKey:&kActionHandlerLongPressBlockKey];
}

- (void)uc_handleActionForDoubleClickGesture:(UITapGestureRecognizer*)gesture{
    [self callBackWithGesture:gesture blockCharKey:&kActionHandlerDoubleTapBlockKey];
}

- (void)uc_handleActionForTwoFingerGesture:(UITapGestureRecognizer*)gesture{
    [self callBackWithGesture:gesture blockCharKey:&kActionHandlerTwoFingerBlockKey];
}
@end
