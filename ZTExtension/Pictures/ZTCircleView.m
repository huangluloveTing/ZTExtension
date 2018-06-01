//
//  ZTCircleView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTCircleView.h"

@implementation ZTCircleView

+ (instancetype) showInView:(UIView *)targetView {
    ZTCircleView *view = [[ZTCircleView alloc] initWithFrame:targetView.bounds];
    view.center = targetView.center;
    view.backgroundColor = [UIColor clearColor];
    view.bgColor = [UIColor whiteColor];
    [targetView addSubview:view];
    return view;
}


- (void) drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat angle = self.progress * 2 * M_PI;
    CGContextAddArc(ctx, self.center.x, self.center.y, self.radius, 0, angle, 0);
    CGContextAddLineToPoint(ctx, self.center.x, self.center.y);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, self.bgColor.CGColor);
    CGContextFillPath(ctx);
}

- (void) setProgress:(CGFloat)progress {
    if (progress >= 1 ) {
        progress = 1;
    }
    if (progress <= 0) {
        progress = 0;
    }
    _progress = progress;
    [self setNeedsDisplay];
}

- (void) setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    [self setNeedsDisplay];
}

- (void) setRadius:(CGFloat)radius {
    _radius = radius;
    [self setNeedsDisplay];
}


- (void) hidden {
    [self removeFromSuperview];
}


@end
