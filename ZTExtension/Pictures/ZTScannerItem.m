//
//  ZTScannerItemView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTScannerItem.h"
#import <FLAnimatedImage/FLAnimatedImage.h>
#import "ZTImageItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ZTCircleView.h"
#import "ZTCircleView.h"
#import "UIView+ZTExtension.h"

#define PROGRESS_RADIUS (50)
#define ZOOMSCALE_MAX (3)
#define ZOOMSCALE_MIN (0.5)

@interface ZTScannerItem()<UIScrollViewDelegate>

@property (strong, nonatomic) UILabel *pageLabel;
@property (strong, nonatomic) FLAnimatedImageView *pic_imageView;
@property (strong, nonatomic) UILabel *desLabel;
@property (strong, nonatomic) FLAnimatedImageView *thumbImageView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (nonatomic , strong) ZTCircleView *circleView;

@end

@implementation ZTScannerItem

- (void) addSubViews {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.thumbImageView = [[FLAnimatedImageView alloc] init];
    self.scrollView.backgroundColor = [UIColor blackColor];
    self.thumbImageView.contentMode = UIViewContentModeScaleAspectFit;

    self.scrollView.scrollEnabled = YES;
    self.scrollView.minimumZoomScale = ZOOMSCALE_MIN;
    self.scrollView.maximumZoomScale = ZOOMSCALE_MAX;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    [self.contentView addSubview:self.scrollView];
    
    
    [self.scrollView addSubview:self.thumbImageView];
    self.thumbImageView.equal_verti_baseLine(self.scrollView, 0).equal_hori_baseLine(self.scrollView, 0).equal_height(self.scrollView, 0).equal_width(self.scrollView, 0);
    
    self.pic_imageView = [[FLAnimatedImageView alloc] initWithFrame:self.scrollView.bounds];
    self.pic_imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView addSubview:self.pic_imageView];
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self addGestures];
    }
    return self;
}

- (void) setNetImageItem:(ZTNetImageItem *)netImageItem {
    _netImageItem = netImageItem;
    if (netImageItem) {
        self.circleView = [ZTCircleView showInView:self.contentView];
        self.circleView.radius = PROGRESS_RADIUS;
        self.circleView.bgColor = [UIColor whiteColor];
        self.pageLabel.text = netImageItem.currentPageFormate;
        self.desLabel.text = netImageItem.des;
        
        [self.pic_imageView sd_setImageWithURL:[NSURL URLWithString:netImageItem.imgUrl]
                              placeholderImage:nil
                                       options:SDWebImageHighPriority
                                      progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
                                          CGFloat progress = [@(receivedSize) floatValue] / expectedSize;
                                          if (progress <= 1) {
                                              NSLog(@"progress = %f" ,progress);
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                self.circleView.progress = progress;
                                              });
                                          }
                                      } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                          [self.circleView hidden];
                                          self.thumbImageView.hidden = YES;
                                      }];
        [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:netImageItem.thumbImageUrl]
                               placeholderImage:self.placeholderImage];
    }
}

- (void) scrollViewDidZoom:(UIScrollView *)scrollView {
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ?(scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) *0.5 : 0.0;
    CGPoint center = CGPointMake(scrollView.contentSize.width *0.5 + offsetX,scrollView.contentSize.height *0.5 + offsetY);
    self.pic_imageView.center = center;
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.pic_imageView;
}

//停止拖动时的回调
- (void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self changeVisibleRectForScrollView];
}

//将要减速时的回调
- (void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self changeVisibleRectForScrollView];
}

- (void) changeVisibleRectForScrollView {
    CGSize contentSize = _scrollView.contentSize;
    CGPoint offset = _scrollView.contentOffset;
    CGFloat centery = contentSize.height / 2.0;
    CGFloat offsety = offset.y - centery;
    CGFloat alter = offsety - centery;
    CGFloat y = offsety - alter - _scrollView.bounds.size.height / 2.0;
    CGRect visibleRect = CGRectMake(offset.x, y, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    if (offset.x < 0) {
        visibleRect.origin.x = 0;
    }
    if (offset.x > contentSize.width -  CGRectGetWidth(_scrollView.frame)) {
        visibleRect.origin.x = contentSize.width - CGRectGetWidth(_scrollView.frame);
    }
    [_scrollView scrollRectToVisible:visibleRect animated:YES];
}

#pragma mark - gesture
- (void) addGestures {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPictureAction:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapPictureAction:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    
    [self.pic_imageView addGestureRecognizer:tap];
    self.pic_imageView.userInteractionEnabled = YES;
    [self.pic_imageView addGestureRecognizer:doubleTap];
    [tap requireGestureRecognizerToFail:doubleTap];
}
- (void)tapPictureAction:(UITapGestureRecognizer *)gesture {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapScannerItem:)]) {
        [self.delegate didTapScannerItem:self];
    }
}

- (void)doubleTapPictureAction:(UITapGestureRecognizer *)gesture {
    if (self.scrollView.zoomScale != 1) {
        [self.scrollView setZoomScale:1 animated:YES];
    } else {
        [self.scrollView setZoomScale:ZOOMSCALE_MAX animated:YES];
    }
    
}

@end
