//
//  ZTLoadingView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/7.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTGifLoadingView.h"
#import "UIView+ZTExtension.h"
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <FLAnimatedImage/FLAnimatedImage.h>

static CGFloat IMG_SIZE_WIDTH = 90;

static CGFloat IMG_SIZE_HEIGHT = 90;

@interface ZTGifLoadingView()

@property (nonatomic , strong) FLAnimatedImageView *imageView;

@property (nonatomic , strong) UILabel *textLabel;

@property (nonatomic , strong) UIView *maskView;

@end

static ZTGifLoadingView *loadingView;

@implementation ZTGifLoadingView

+ (instancetype) shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!loadingView) {
            loadingView = [[ZTGifLoadingView alloc] init];
        }
    });
    return loadingView;
}

+ (instancetype) loadingAtView:(UIView *)view {
    ZTGifLoadingView *gifView = [[ZTGifLoadingView alloc] init];
    [view addSubview:gifView];
    return gifView;
}

- (instancetype) init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        [self configSubViews];
    }
    return self;
}

- (void) configSubViews {
    [self.maskView addSubview:self.imageView];
    self.imageView.top(0).left(0).right(0).bottom(0).constrain_Width(IMG_SIZE_WIDTH).constrain_Height(IMG_SIZE_HEIGHT);
    [self.maskView addSubview:self.textLabel];
    self.textLabel.bottom(10).equal_verti_baseLine(self.maskView, 0).equal_width(self.maskView, 0);
    [self addSubview:self.maskView];
    self.maskView.equal_verti_baseLine(self, 0).equal_hori_baseLine(self, 0);
}

- (FLAnimatedImageView *) imageView {
    if (!_imageView) {
        _imageView = [[FLAnimatedImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.layer.cornerRadius = 8;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UILabel *) textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor lightGrayColor];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.layer.shadowRadius = 8;
        _maskView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _maskView.layer.shadowOpacity = 0.5;
        _maskView.layer.shadowOffset = CGSizeMake(3, 3);
    }
    return _maskView;
}

- (void) setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    _textLabel.font = textFont;
}
-(void) setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textLabel.textColor = textColor;
}
- (void) setGifImageData:(NSData *)gifImageData {
    _gifImageData = gifImageData;
    FLAnimatedImage *gifImage = [FLAnimatedImage animatedImageWithGIFData:gifImageData];
    self.imageView.animatedImage = gifImage;
}

- (void) setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}


#pragma mark - moveToSuperView
- (void) didMoveToSuperview {
    if (self.superview) {
        self.equal_hori_baseLine(self.superview, 0).equal_verti_baseLine(self.superview, 0).equal_width(self.superview, 0).equal_height(self.superview, 0);
    }
}

#pragma mark - public
- (void) showOnView:(UIView *)view {
    [self hiddeAtView:view];
    [view addSubview:self];
}

- (void) hidden {
    [self removeFromSuperview];
}

- (void) hiddeAtView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            [subView removeFromSuperview];
        }
    }
}

#pragma mark -

- (void) layoutSubviews {
    [super layoutSubviews];
    if (self.superview) {
        [self.superview bringSubviewToFront:self];
    }
}


@end
