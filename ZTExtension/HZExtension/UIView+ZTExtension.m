//
//  UIView+ZTExtension.m
//  IOS11
//
//  Created by 黄露 on 2017/10/26.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "UIView+ZTExtension.h"

#define UPDATE_ANIMATION_TIME (3)

@implementation UIView (ZTExtension)

- (void) setX:(CGFloat)x {
 
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void) setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat) y {
    return self.frame.origin.y;
}

- (void) setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat) width {
    return self.frame.size.width;
}

- (void) setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat) height {
    return self.frame.size.height;
}

- (void) setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize) size {
    return self.frame.size;
}

- (UIView *(^)(CGFloat right)) right {
    
    return ^UIView*(CGFloat right) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1.0
                                                                constant:-right];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView * (^) (CGFloat left))left {
    
    return ^UIView *(CGFloat left) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1.0
                                                                constant:left];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView * (^)(CGFloat top))top {
    return ^UIView *(CGFloat top) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:top];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(CGFloat bottom))bottom {
    return ^UIView *(CGFloat bottom) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:-bottom];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *toView))constrain_center {
    return ^UIView*(UIView *toView) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0];
        [self.superview addConstraint:con];
        NSLayoutConstraint *con2 = [NSLayoutConstraint constraintWithItem:self
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:toView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0];

        [self.superview addConstraint:con2];
        return self;
    };
}

-  (UIView *(^)(UIView *toView , CGFloat space)) top_space_to {
    return ^UIView *(UIView *toView , CGFloat space){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:space];
        [self.superview addConstraint:con];
        return self;
    };
}

-  (UIView *(^)(UIView *toView , CGFloat space)) bottom_space_to {
    return ^UIView *(UIView *toView , CGFloat space){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:space];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(CGFloat width)) constrain_Width {
    return ^UIView *(CGFloat width) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:width];
        [self addConstraint:con];
        return self;
    };
}

- (UIView *(^)(CGFloat width)) constrain_MaxWidth {
    return ^UIView *(CGFloat width) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationLessThanOrEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:width];
        [self addConstraint:con];
        return self;
    };
}

- (UIView *(^)(CGFloat height))constrain_Height {
    return ^UIView *(CGFloat height){
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:height];
        [self addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *toView))equal_top {
    return ^UIView *(UIView *toView) {
        return self.offsetTop(toView , 0);
    };
}

- (UIView *(^)(UIView *toView))equal_left {
    return ^UIView *(UIView *toView) {
        return self.offsetLeft(toView , 0);
    };
}

- (UIView *(^)(UIView *toView))equal_bottom {
    return ^UIView *(UIView *toView) {
        return self.offsetBottom(toView, 0);
    };
}

- (UIView *(^)(UIView *toView))equal_right {
    return ^UIView *(UIView *toView) {
        return self.offsetRight(toView , 0);
    };
}

- (UIView *(^)(UIView *toView , CGFloat offset))offsetLeft {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *toView , CGFloat))offsetTop {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *toView , CGFloat))left_space_to {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *toView , CGFloat))right_space_to {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1.0
                                                                constant:-offset];
        [self.superview addConstraint:con];
        return self;
    };
}


- (UIView *(^)(UIView * , CGFloat))offsetRight {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1.0
                                                                constant:-offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *,CGFloat))offsetBottom {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:-offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *,CGFloat))equal_width {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeWidth
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView *,CGFloat))equal_height {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeHeight
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView * , CGFloat ))equal_hori_baseLine {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (UIView *(^)(UIView * , CGFloat ))equal_verti_baseLine {
    return ^UIView *(UIView *toView , CGFloat offset) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:toView
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:offset];
        [self.superview addConstraint:con];
        return self;
    };
}

- (void) updateRightConstraint:(CGFloat)rightConstraint animation:(BOOL)animation {
    NSArray<NSLayoutConstraint *> *constraints = self.superview.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        if ((constraint.firstAttribute  == NSLayoutAttributeRight && constraint.firstItem == self) ||
            (constraint.secondAttribute == NSLayoutAttributeRight && constraint.secondItem == self)) {
            constraint.constant = rightConstraint;
            if (animation) {
                [UIView animateWithDuration:UPDATE_ANIMATION_TIME animations:^{
                    [self layoutIfNeeded];
                }];
            }
        }
    }
}

- (void) updateLeftConstraint:(CGFloat)leftConstraint animation:(BOOL)animation {
    NSArray<NSLayoutConstraint *> *constraints = self.superview.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute  == NSLayoutAttributeLeft && constraint.firstItem == self) {
            constraint.constant = leftConstraint;
            if (animation) {
                [UIView animateWithDuration:UPDATE_ANIMATION_TIME animations:^{
                    [self.superview layoutIfNeeded];
                }];
            }
        }
    }
}

- (void) updateTopConstraint:(CGFloat)topConstraint animation:(BOOL)animation{
    NSArray<NSLayoutConstraint *> *constraints = self.superview.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        if ((constraint.firstAttribute  == NSLayoutAttributeTop && constraint.firstItem == self) ||
            (constraint.secondAttribute == NSLayoutAttributeTop && constraint.secondItem == self)) {
            constraint.constant = topConstraint;
            if (animation) {
                [UIView animateWithDuration:UPDATE_ANIMATION_TIME animations:^{
                    [self layoutIfNeeded];
                }];
            }
        }
    }
}

- (void) updateBottomConstraint:(CGFloat)bottomConstraint animation:(BOOL)animation{
    NSArray<NSLayoutConstraint *> *constraints = self.superview.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        if ((constraint.firstAttribute  == NSLayoutAttributeBottom && constraint.firstItem == self) ||
            (constraint.secondAttribute == NSLayoutAttributeBottom && constraint.secondItem == self)) {
            constraint.constant = -bottomConstraint;
            if (animation) {
                [UIView animateWithDuration:UPDATE_ANIMATION_TIME animations:^{
                    [self.superview layoutIfNeeded];
                }];
            }
        }
    }
}

- (void) updateHeightConstraint:(CGFloat)height animation:(BOOL)animation {
    NSArray<NSLayoutConstraint *> *constraints = self.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight && constraint.firstItem == self) {
            constraint.constant = height;
            if (animation) {
                [UIView animateWithDuration:UPDATE_ANIMATION_TIME animations:^{
                    [self.superview layoutIfNeeded];
                }];
            }
        }
    }
}

- (void) updateWidthConstraint:(CGFloat)width animation:(BOOL)animation {
    NSArray<NSLayoutConstraint *> *constraints = self.constraints;
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth && constraint.firstItem == self) {
            constraint.constant = width;
            if (animation) {
                [UIView animateWithDuration:UPDATE_ANIMATION_TIME animations:^{
                    [self.superview layoutIfNeeded];
                }];
            }
        }
    }
}

@end
