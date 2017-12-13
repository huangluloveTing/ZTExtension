//
//  ZTHUD.h
//  ZTExtension
//
//  Created by 黄露 on 2017/12/4.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTHUD : NSObject

+ (nonnull instancetype) sharedHUD;

// waiting
- (void) showWaitingHUDToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title;

- (void) showWaiting:(nullable UIImage *)waiting ToView:(UIView *_Nullable)targetView ForTitle:(NSString *_Nullable)title;

// waiting ,自定义 gif
- (void) showGifWaiting:(NSArray <UIImage *> *_Nonnull)gif ToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title;

// Failed
- (void) showFailedHUDToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title;

- (void) showFailedHUDToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title image:(UIImage *)image;

// Failed 自定义 失败时的图片
- (void) showCustomFailed:(UIImage *_Nonnull)failedImage ToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title;

// success
- (void) showSuccessdHUDToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title;

- (void) showSuccessdHUDToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title image:(UIImage *_Nullable)image;

// success 自定义 失败时的图片
- (void) showCustomSuccess:(UIImage *_Nonnull)successImage ToView:(nullable UIView *)targetView ForTitle:(NSString *_Nullable)title;

// hidden
- (void) hiddenForView:(UIView *_Nullable)view animation:(BOOL)animation;

// hidden
- (void) hiddenForView:(UIView *_Nullable)view delay:(CGFloat)delay animation:(BOOL)animation;

// hidden
- (void) hiddenForView:(UIView *_Nullable)view delay:(CGFloat)delay animation:(BOOL)animation completion:(void(^_Nullable)(void))block;

@end
