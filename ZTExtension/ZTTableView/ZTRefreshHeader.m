//
//  ZTRefreshHeader.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/8.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTRefreshHeader.h"
#import "ZTLoadMoreView.h"
#import "ZTRefresh.h"
#import "UIColor+ZTHex.h"

@interface ZTRefreshHeader()

@property (nonatomic , strong) ZTLoadMoreView *freshHeader;

@end

@implementation ZTRefreshHeader {
    NSMutableDictionary *_stateTitle;
}

#pragma mark - 覆盖父类的方法
- (void)prepare
{
    [super prepare];
    _stateTitle = [NSMutableDictionary dictionary];
    self.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
    // 初始化间距
}

- (void)placeSubviews
{
    [super placeSubviews];
    [self addSubview:self.freshHeader];
    self.freshHeader.center = CGPointMake(self.mj_w / 2.0, self.mj_h / 2.0);
}

- (void) setState:(MJRefreshState)state {
    [super setState:state];
    if (state == MJRefreshStateIdle) {
        self.freshHeader.loadTitle = [_stateTitle valueForKey:[NSString stringWithFormat:@"%ld" ,(long)state]] ?: @"";
        [self.freshHeader stopShake];
    } else {
        [self.freshHeader startShakeWithTitle:[_stateTitle valueForKey:[NSString stringWithFormat:@"%ld" ,(long)state]] ?: @""];
    }
}

- (void) setShakeTitle:(NSString *)title state:(MJRefreshState)state {
    [_stateTitle setObject:title ?:@"" forKey: [NSString stringWithFormat:@"%ld" ,(long)state]];
}

#pragma mark - lazy
- (ZTLoadMoreView *) freshHeader {
    if (!_freshHeader) {
        CGPoint point = CGPointMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetHeight(self.frame) / 2.0);
        _freshHeader = [[ZTLoadMoreView alloc] initWithFrame:CGRectMake(point.x - LOADWIDTH / 2.0, point.y - self.mj_h / 2.0, LOADWIDTH, self.mj_h)];
        
        _freshHeader.circleRadius = 6;
        _freshHeader.shakeRate = 0.35;
        _freshHeader.jump = 8;
    }
    return _freshHeader;
}

@end
