//
//  ZTLoadMoreView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/8.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTLoadMoreView.h"
#import "UIColor+ZTHex.h"

@interface ZTLoadMoreView()

@property (nonatomic , strong) CADisplayLink *link;

@property (nonatomic , strong) UIView *circle_layer_one;

@property (nonatomic , strong) UIView *circle_layer_two;

@property (nonatomic , strong) UIView *circle_layer_three;

@property (nonatomic , assign) CGFloat wave;

@end




@implementation ZTLoadMoreView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(startDraw)];
        self.link.frameInterval = 2;
        [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.link.paused = YES;
        self.shakeRate = 0.2;
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    [self toDrawCircle];
}

- (CGFloat) jumpDistance {
    return CGRectGetHeight(self.frame) / 2.0;
}

- (CGFloat) shakeYAtX:(CGFloat)x wareLength:(CGFloat)length  {
    CGFloat y = ([self jumpDistance] - self.circleRadius * 2) * sin(x/length  * M_PI  + _wave)  + [self jumpDistance];
    return y;
}

- (void) toDrawCircle {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat unitWidth = (width - 6 * self.circleRadius) / 2.0;
    
    CGFloat y1 = [self shakeYAtX:self.circleRadius wareLength:width];
    CGFloat y2 = [self shakeYAtX:width / 2.0 wareLength:width];
    CGFloat y3 = [self shakeYAtX:width - self.circleRadius wareLength:width];
    
    CGPoint center_1 = CGPointMake(self.circleRadius, y1);
    CGPoint center_2 = CGPointMake(self.circleRadius * 3 + unitWidth, y2);
    CGPoint center_3 = CGPointMake(width - self.circleRadius, y3);
    
    self.circle_layer_one.center = center_1;
    self.circle_layer_two.center = center_2;
    self.circle_layer_three.center = center_3;
    
}

#pragma mark - lazy
- (UIView *) circle_layer_one {
    if (!_circle_layer_one) {
        _circle_layer_one = [[UIView alloc] initWithFrame:CGRectMake(self.circleRadius, CGRectGetHeight(self.frame) / 2.0, self.circleRadius * 2, self.circleRadius * 2)];
        _circle_layer_one.backgroundColor = [UIColor colorWithHex:0xff9500];
        _circle_layer_one.layer.masksToBounds = YES;
        _circle_layer_one.layer.cornerRadius = self.circleRadius;
        [self addSubview:_circle_layer_one];
    }
    return _circle_layer_one;
}

- (UIView *) circle_layer_two {
    if (!_circle_layer_two) {
        _circle_layer_two = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetHeight(self.frame) / 2.0, self.circleRadius * 2, self.circleRadius * 2)];
        _circle_layer_two.backgroundColor = [UIColor colorWithHex:0x7ed321];
        _circle_layer_two.layer.masksToBounds = YES;
        _circle_layer_two.layer.cornerRadius = self.circleRadius;
        [self addSubview:_circle_layer_two];
    }
    return _circle_layer_two;
}

- (UIView *) circle_layer_three{
    if (!_circle_layer_three) {
        _circle_layer_three = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - self.circleRadius, CGRectGetHeight(self.frame) / 2.0, self.circleRadius * 2, self.circleRadius * 2)];
        _circle_layer_three.backgroundColor = [UIColor colorWithHex:0xff604f];
        _circle_layer_three.layer.masksToBounds = YES;
        _circle_layer_three.layer.cornerRadius = self.circleRadius;
        [self addSubview:_circle_layer_three];
    }
    return _circle_layer_three;
}


- (void) setJump:(CGFloat)jump {
    _jump = jump;
}

- (void) setCircleCount:(NSInteger)circleCount {
    _circleCount = circleCount;
}

- (void) setCircleColors:(NSArray<UIColor *> *)circleColors {
    _circleColors = circleColors;
}

- (void) setShakeRate:(CGFloat)shakeRate {
    _shakeRate = shakeRate;
}

- (void) startShake {
    self.link.paused = NO;
}

- (void) startDraw {
    _wave += self.shakeRate;
    if ([self.link isPaused]) {
        [self.link setPaused:NO];
    }
    [self setNeedsDisplay];
}

- (void) stopShake {
    if (![self.link isPaused]) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.link setPaused:YES];
//        });
    }
}

- (void) dealloc {
    [self.link invalidate];
    self.link = nil;
}



@end
