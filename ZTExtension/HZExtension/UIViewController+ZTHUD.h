//
//  UIViewController+ZTHUD.h
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZTHUD)

/**
 显示正在等待的hud

 @param waiting waiting description
 */
- (void) showWaitingWithTitle:(nonnull NSString *)waiting;

/**
 显示成功的HUD

 @param success success description
 */
- (void) showSuccessWithTitle:(nonnull NSString *)success;

/**
 显示失败的HUD

 @param failed failed description
 */
- (void) showFailedWithTitle:(nonnull NSString *)failed;

/**
 显示自定义动画的等待HUD

 @param waiting waiting description
 */
- (void) showAnimationWaitingWithTitle:(nonnull NSString *)waiting;


/**
 隐藏hud
 */
- (void) hiddenHUD;


/**
 在delay 秒 后隐藏hud

 @param delay delay description
 */
- (void) hiddenHUDDelay:(NSTimeInterval)delay;

@end
