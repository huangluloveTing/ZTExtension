//
//  ZTLoopViewCell.m
//  ZTExtension
//
//  Created by 黄露 on 2018/7/20.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTLoopViewCell.h"

@implementation ZTLoopViewCell

- (void) setLoopView:(UIView *)loopView {
    _loopView = loopView;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    _loopView.frame = self.contentView.bounds;
    [self.contentView addSubview:_loopView];
}

@end
