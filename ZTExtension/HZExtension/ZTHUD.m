//
//  ZTHUD.m
//  ZTExtension
//
//  Created by 黄露 on 2017/12/4.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "ZTHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "ZTHUDContentView.h"

#define dSuccess_Image_ZT ([UIImage imageNamed:@"Success_zt"])
#define dFailed_Image_ZT ([UIImage imageNamed:@"failed_zt"])

static ZTHUD * sharedHUD;

typedef void(^ZTHUDHiddenBlock)(void);

@interface ZTHUD ()<MBProgressHUDDelegate>

@property (nonatomic , strong) ZTHUDContentView *customView;

@property (nonatomic , copy) ZTHUDHiddenBlock hiddenBlock;

@end

@implementation ZTHUD

+ (nonnull instancetype) sharedHUD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedHUD == NULL) {
            sharedHUD = [[ZTHUD alloc] init];
        }
    });
    
    return sharedHUD;
}

- (instancetype) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void) showWaitingHUDToView:(nullable UIView *)targetView
                     ForTitle:(NSString *)title {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = title;
    hud.customView = nil;
    [hud showAnimated:YES];
}

- (void) showWaiting:(nullable UIImage *)waiting
              ToView:(UIView *)targetView
            ForTitle:(NSString *)title {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    self.customView.contentImage = waiting;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showGifWaiting:(NSArray <UIImage *> *_Nonnull)gif
                 ToView:(nullable UIView *)targetView
               ForTitle:(NSString *)title {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    self.customView.contentGifImages = gif;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showFailedHUDToView:(nullable UIView *)targetView
                    ForTitle:(NSString *)title {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @"ZTExtension" ofType :@"bundle"];
    NSString *imgPath= [bundlePath stringByAppendingPathComponent:@"failed_zt.png"];
    UIImage *image=[UIImage imageWithContentsOfFile:imgPath];
    self.customView.contentImage = image;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showFailedHUDToView:(UIView *)targetView ForTitle:(NSString *)title image:(UIImage *)image {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    self.customView.contentImage = image;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showCustomFailed:(UIImage *_Nonnull)failedImage
                   ToView:(nullable UIView *)targetView
                 ForTitle:(NSString *)title{
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    self.customView.contentImage = failedImage;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showSuccessdHUDToView:(nullable UIView *)targetView
                      ForTitle:(NSString *)title {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @"ZTExtension" ofType :@"bundle"];
    NSString *imgPath= [bundlePath stringByAppendingPathComponent :@"Success_zt.png"];
    UIImage *image=[UIImage imageWithContentsOfFile:imgPath];
    self.customView.contentImage = image;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showSuccessdHUDToView:(UIView *)targetView ForTitle:(NSString *)title image:(UIImage *)image {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    self.customView.contentImage = image;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) showCustomSuccess:(UIImage *_Nonnull)successImage
                    ToView:(nullable UIView *)targetView
                  ForTitle:(NSString *)title {
    MBProgressHUD *hud = [self getCurrentHUDForView:targetView];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = self.customView;
    self.customView.contentImage = successImage;
    hud.label.text = title;
    [hud showAnimated:YES];
}

- (void) hiddenForView:(UIView *)view
             animation:(BOOL)animation {
    [self hiddenForView:view
                  delay:0
              animation:animation
             completion:nil];
}

- (void) hiddenForView:(UIView *)view delay:(CGFloat)delay
             animation:(BOOL)animation {
    [self hiddenForView:view
                  delay:delay
              animation:animation
             completion:nil];
}

- (void) hiddenForView:(UIView *)view
                 delay:(CGFloat)delay
             animation:(BOOL)animation
            completion:(void (^)(void))block {
    MBProgressHUD *hud = [self getCurrentHUDForView:view];
    if (block) {
        self.hiddenBlock = block;
    }
    [hud hideAnimated:animation afterDelay:delay];
}

//判断targetView 是否存在hud ， 有就直接使用，没有创建
- (MBProgressHUD *) getCurrentHUDForView:(UIView *)targetView {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:targetView];
    UIWindow *window = nil;
    if (! targetView) {
        window = [UIApplication sharedApplication].keyWindow;
        hud = [MBProgressHUD HUDForView:window];
        targetView = window;
    }
    if (hud == NULL) {
        hud = [[MBProgressHUD alloc] initWithView:targetView];
    }
    hud.delegate = self;
    hud.animationType =MBProgressHUDAnimationFade;
    [targetView addSubview:hud];
    return hud;
}

- (ZTHUDContentView *)customView {
    if (!_customView) {
        _customView = [[ZTHUDContentView alloc] init];
    }
    return _customView;
}

#pragma mark - MBProgressHUD delegate
- (void) hudWasHidden:(MBProgressHUD *)hud {
    if (self.hiddenBlock) {
        self.hiddenBlock();
        self.hiddenBlock = nil;
    }
}

@end
