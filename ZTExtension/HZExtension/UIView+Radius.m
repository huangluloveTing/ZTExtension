//
//  UIView+Radius.m
//  ZTExtension
//
//  Created by 黄露 on 2017/12/8.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "UIView+Radius.h"

@implementation UIView (Radius)

- (void) radius_rectCorners:(UIRectCorner)rectCorners
                      radiu:(CGFloat)radius
                      color:(UIColor *)boraderColor {
    CGRect rect = self.bounds;
    CGSize radio = CGSizeMake(radius, radius);//圆角尺寸
    UIRectCorner corner = rectCorners;//这只圆角位置
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radio];
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
    masklayer.frame = self.bounds;
    masklayer.path = path.CGPath;//设置路径
    self.layer.mask = masklayer;
}

@end
