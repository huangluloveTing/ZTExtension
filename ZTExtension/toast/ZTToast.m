//
//  ZTToast.m
//  ZTExtension
//
//  Created by 黄露 on 2018/5/24.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTToast.h"
#import "ZTToastView.h"

static ZTToast *toast;

@interface ZTToast()

@property (nonatomic , strong) ZTToastView *toastView;

@end

@implementation ZTToast

+ (instancetype) toast {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (toast == nil) {
            toast = [[ZTToast alloc] init];
        }
    });
    return toast;
}

- (void) showToastTitle:(NSString *)title icon:(UIImage *)icon position:(ZTToastPosition)position {
    [self.toastView currentTitle:title];
    [self.toastView currentIcon:icon];
    self.toastView.position = position;
    self.toastView.alpha = 1;
    self.toastView.hidden = NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.toastView];
}

- (void) hidden {
    [UIView animateWithDuration:0.3 animations:^{
        self.toastView.alpha = 0.00;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.toastView removeFromSuperview];
        }
    }];
}

- (void) hiddenByOpacity {
    [UIView animateWithDuration:0.3 animations:^{
       self.toastView.alpha = 0.00;
    }];
}

#pragma mark - toastView
- (ZTToastView *)toastView {
    if (!_toastView) {
        _toastView = [ZTToastView sharedView];
    }
    return _toastView;
}

@end
