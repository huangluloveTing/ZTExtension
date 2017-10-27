//
//  UIView+ZTExtension.h
//  IOS11
//
//  Created by 黄露 on 2017/10/26.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZTExtension)

#pragma mark - Frame 布局使用
//frame 布局， 对 x，y ， width ， height 的 方便操作
@property (nonatomic , assign) CGFloat x;
@property (nonatomic , assign) CGFloat y;
@property (nonatomic , assign) CGFloat width;
@property (nonatomic , assign) CGFloat height;
@property (nonatomic , assign) CGSize size;

#pragma mark - AutoLayout 使用
@property (nonatomic , copy , readonly) UIView*(^right)(CGFloat right);
@property (nonatomic , copy , readonly) UIView*(^left)(CGFloat left);
@property (nonatomic , copy , readonly) UIView*(^bottom)(CGFloat bottom);
@property (nonatomic , copy , readonly) UIView*(^top)(CGFloat top);
@property (nonatomic , copy , readonly) UIView*(^constrain_center)(UIView *toView);
@property (nonatomic , copy , readonly) UIView*(^constrain_Width)(CGFloat width);
@property (nonatomic , copy , readonly) UIView*(^constrain_Height)(CGFloat height);
@property (nonatomic , copy , readonly) UIView*(^equal_right)(UIView *toView);
@property (nonatomic , copy , readonly) UIView*(^equal_left)(UIView *toView);
@property (nonatomic , copy , readonly) UIView*(^equal_top)(UIView *toView);
@property (nonatomic , copy , readonly) UIView*(^equal_bottom)(UIView *toView);

//相对于参照试图 偏移量
@property (nonatomic , copy , readonly) UIView*(^offsetRight)(UIView *toView , CGFloat offset);
@property (nonatomic , copy , readonly) UIView*(^offsetLeft)(UIView *toView , CGFloat offset);
@property (nonatomic , copy , readonly) UIView*(^offsetTop)(UIView *toView , CGFloat offset);
@property (nonatomic , copy , readonly) UIView*(^offsetBottom)(UIView *toView , CGFloat offset);

//更新约束的方法
- (void) updateRightConstraint:(CGFloat)rightConstraint animation:(BOOL)animation;

- (void) updateLeftConstraint:(CGFloat)leftConstraint animation:(BOOL)animation;

- (void) updateTopConstraint:(CGFloat)topConstraint animation:(BOOL)animation;

- (void) updateBottomConstraint:(CGFloat)bottomConstraint animation:(BOOL)animation;

- (void) updateHeightConstraint:(CGFloat)height animation:(BOOL)animation;

- (void) updateWidthConstraint:(CGFloat)width animation:(BOOL)animation;


@end
