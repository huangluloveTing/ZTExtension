//
//  ZTHUDContentView.m
//  ZTExtension
//
//  Created by 黄露 on 2017/12/4.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "ZTHUDContentView.h"

@interface ZTHUDContentView()

@property (nonatomic , strong) UIImageView *contentImageView;

@end

@implementation ZTHUDContentView

- (CGSize) intrinsicContentSize {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width / 3, width / 3);
}

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFit|UIViewContentModeCenter;
    }
    
    return _contentImageView;
}

- (void) setContentImage:(UIImage *)contentImage {
    self.contentImageView.image = contentImage;
    [self addSubview:self.contentImageView];
    [self invalidateIntrinsicContentSize];
}

- (void) setContentGifImages:(NSArray<UIImage *> *)contentGifImages {
    self.contentImageView.animationImages = contentGifImages;
    self.contentImageView.animationDuration = 5;
    self.contentImageView.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.contentImageView];
    [self.contentImageView startAnimating];
}

- (void) dealloc {
    if (self.contentImageView.isAnimating) {
        [self.contentImageView stopAnimating];
    }
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    self.contentImageView.frame = self.bounds;
    self.contentImageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetHeight(self.frame) / 2.0);
}

@end
