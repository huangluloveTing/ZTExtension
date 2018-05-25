//
//  ZTToastManager.m
//  ZTExtension
//
//  Created by 黄露 on 2018/5/24.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTToastManager.h"
#import "ZTToast.h"


static UIImage* bundleImage(NSString *imageName) {
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @"ZTExtension" ofType :@"bundle"];
    NSString *imgPath= [bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png" , imageName]];
    UIImage *image=[UIImage imageWithContentsOfFile:imgPath];
    return image;
}

@implementation ZTToastManager

+ (void) toastWithTitle:(NSString *)title icon:(UIImage *)icon position:(ZTToastPosition)position duration:(NSTimeInterval)duration {
    ZTToast *toast = [ZTToast toast];
    [toast showToastTitle:title icon:icon position:position];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [toast hiddenByOpacity];
    });
}


+ (void) successToastWithTitle:(NSString *)title duration:(NSTimeInterval)duration position:(ZTToastPosition)position {
    [self toastWithTitle:title icon:bundleImage(@"ZTToastSuccess") position:position duration:duration];
}
+ (void) successToastAtMiddleWithTitle:(NSString *)title duration:(NSTimeInterval)duration {
    [self successToastWithTitle:title duration:duration position:ZTToastPosition_Middle];
}
+ (void) successToastAtBottomWithTitle:(NSString *)title duration:(NSTimeInterval)duration {
    [self successToastWithTitle:title duration:duration position:ZTToastPosition_Bottom];
}

#pragma mark - 显示失败的toast
+ (void) errorToastWithTitle:(NSString *)title duration:(NSTimeInterval)duration position:(ZTToastPosition)position {
    [self toastWithTitle:title icon:bundleImage(@"ZTToastError") position:position duration:duration];
}
+ (void) errorToastAtMiddleWithTitle:(NSString *)title duration:(NSTimeInterval)duration {
    [self errorToastWithTitle:title duration:duration position:ZTToastPosition_Middle];
}
+ (void) errorToastAtBottomWithTitle:(NSString *)title duration:(NSTimeInterval)duration {
    [self errorToastWithTitle:title duration:duration position:ZTToastPosition_Bottom];
}


#pragma mark - 显示提示的toast
+ (void) warningToastWithTitle:(NSString *)title duration:(NSTimeInterval)duration position:(ZTToastPosition)position {
    [self toastWithTitle:title icon:bundleImage(@"ZTToastWarn") position:position duration:duration];
}
+ (void) warningToastAtMiddleWithTitle:(NSString *)title duration:(NSTimeInterval)duration {
    [self warningToastWithTitle:title duration:duration position:ZTToastPosition_Middle];
}
+ (void) warningToastAtBottomWithTitle:(NSString *)title duration:(NSTimeInterval)duration{
    [self warningToastWithTitle:title duration:duration position:ZTToastPosition_Bottom];
}

@end
