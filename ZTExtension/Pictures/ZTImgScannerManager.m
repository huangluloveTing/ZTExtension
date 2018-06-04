//
//  ZTImgScannerManager.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTImgScannerManager.h"
#import "ZTImageItem.h"
#import "ZTImageScannerView.h"

@implementation ZTImgScannerManager

+ (void) showLocalImages:(NSArray<ZTLocalImageItem *> *)imgs currentIndex:(NSInteger)index {
    NSLog(@"暂未实现");
}

+ (void) showNetImages:(NSArray <ZTNetImageItem *> *)imgs currentIndex:(NSInteger)index{
    [self showPictureAtWindowWithImages:imgs currentIndex:index];
}


+ (void) showPictureAtWindowWithImages:(NSArray *)images currentIndex:(NSInteger)index {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ZTImageScannerView *scannerView = [[ZTImageScannerView alloc] initWithFrame:window.bounds];
    scannerView.center = window.center;
    scannerView.transform = CGAffineTransformMakeScale(0.2, 0.2);
    scannerView.alpha = 0.4;
    [window addSubview:scannerView];
    scannerView.items = images;
    scannerView.currentIndex = index;
    [UIView animateWithDuration:0.4 animations:^{
        scannerView.alpha = 1;
        scannerView.transform = CGAffineTransformIdentity;
        scannerView.center = window.center;
    } completion:^(BOOL finished) {
    }];
}

@end
