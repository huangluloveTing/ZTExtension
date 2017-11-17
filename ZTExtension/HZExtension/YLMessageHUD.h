//
//  YLMessageHUD.h
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YLMessageHUD : NSObject

- (instancetype) initForView:(UIView *)targetView;

- (void) showWaiting:(NSString *)wait;

- (void) showSuccess:(NSString *)success;

- (void) showFailed:(NSString *)failed;

- (void) hiddenHUD;

- (void) hiddenHUDAfter:(NSTimeInterval)after;

@end
