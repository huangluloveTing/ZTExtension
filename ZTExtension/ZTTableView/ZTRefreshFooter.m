//
//  ZTRefreshFooter.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/8.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTRefreshFooter.h"
#import "ZTLoadMoreView.h"
#import "ZTRefresh.h"
#import "UIColor+ZTHex.h"

@interface ZTRefreshFooter()

@property (nonatomic , strong) ZTLoadMoreView *freshHeader;

@property (nonatomic , strong) UILabel *textLabel;

@end

@implementation ZTRefreshFooter

- (void) prepare {
    [super prepare];
    self.mj_h = MJRefreshHeaderHeight;
    self.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
    self.automaticallyRefresh = YES;
}

- (void)placeSubviews
{
    [super placeSubviews];
    [self addSubview:self.freshHeader];
    [self addSubview:self.textLabel];
    self.freshHeader.center = CGPointMake(self.mj_w / 2.0, self.mj_h / 2.0);
    self.textLabel.center = self.freshHeader.center;
}

- (void) setState:(MJRefreshState)state {
    [super setState:state];
    if (state == MJRefreshStateIdle) {
        self.textLabel.text = @"";
        [self.freshHeader stopShake];
        [self hiddenAnimate];
    }
    else if (state == MJRefreshStateNoMoreData) {
        [self.freshHeader stopShake];
        self.textLabel.text = noMoreDataTips;
        [self hiddenAnimate];
    }
    else {
        self.textLabel.text = @"";
        [self.freshHeader startShake];
        [self hiddenText];
    }
}

- (void) hiddenAnimate {
    self.freshHeader.hidden = YES;
    self.textLabel.hidden = NO;
}

- (void) hiddenText {
    self.freshHeader.hidden = NO;
    self.textLabel.hidden = YES;
}

#pragma mark - lazy
- (ZTLoadMoreView *) freshHeader {
    if (!_freshHeader) {
        CGPoint point = CGPointMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetHeight(self.frame) / 2.0);
        _freshHeader = [[ZTLoadMoreView alloc] initWithFrame:CGRectMake(point.x - LOADWIDTH / 2.0, point.y - self.mj_h / 2.0, LOADWIDTH, self.mj_h)];
        
        _freshHeader.circleRadius = 6;
        _freshHeader.shakeRate = 0.35;
    }
    return _freshHeader;
}

- (UILabel *) textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor lightGrayColor];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.hidden = NO;
        _textLabel.text = @"";
        [_textLabel sizeToFit];
    }
    return  _textLabel;
}

@end
