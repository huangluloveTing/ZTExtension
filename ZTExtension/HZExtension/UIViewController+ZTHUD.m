//
//  UIViewController+ZTHUD.m
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "UIViewController+ZTHUD.h"
#import "YLMessageHUD.h"

@implementation UIViewController (ZTHUD)

/**
 显示正在等待的hud
 
 @param waiting waiting description
 */
- (void) showWaitingWithTitle:(nonnull NSString *)waiting {
    YLMessageHUD *hud = [self obtainHUD];
    [hud showWaiting:waiting];
}

/**
 显示成功的HUD
 
 @param success success description
 */
- (void) showSuccessWithTitle:(nonnull NSString *)success {
    YLMessageHUD *hud = [self obtainHUD];
    [hud showSuccess:success];
}

/**
 显示失败的HUD
 
 @param failed failed description
 */
- (void) showFailedWithTitle:(nonnull NSString *)failed {
    YLMessageHUD *hud = [self obtainHUD];
    [hud showFailed:failed];
}

/**
 显示自定义动画的等待HUD
 
 @param waiting waiting description
 */
- (void) showAnimationWaitingWithTitle:(nonnull NSString *)waiting {
    
}

- (void) hiddenHUD {
    [[self obtainHUD] hiddenHUD];
}

- (void) hiddenHUDDelay:(NSTimeInterval)delay {
    [[self obtainHUD] hiddenHUDAfter:delay];
}

- (YLMessageHUD *) obtainHUD {
   return [[YLMessageHUD alloc] initForView:self.view];
}

@end
