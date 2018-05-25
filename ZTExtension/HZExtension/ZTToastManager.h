//
//  ZTToastManager.h
//  ZTExtension
//
//  Created by 黄露 on 2018/5/24.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTToastHeader.h"

@interface ZTToastManager : NSObject

+ (void) toastWithTitle:(NSString *)title icon:(UIImage *)icon position:(ZTToastPosition)position duration:(NSTimeInterval)duration;

#pragma mark - 显示成功的toast
+ (void) successToastWithTitle:(NSString *)title duration:(NSTimeInterval)duration position:(ZTToastPosition)position;
+ (void) successToastAtMiddleWithTitle:(NSString *)title duration:(NSTimeInterval)duration;
+ (void) successToastAtBottomWithTitle:(NSString *)title duration:(NSTimeInterval)duration;

#pragma mark - 显示失败的toast
+ (void) errorToastWithTitle:(NSString *)title duration:(NSTimeInterval)duration position:(ZTToastPosition)position;
+ (void) errorToastAtMiddleWithTitle:(NSString *)title duration:(NSTimeInterval)duration;
+ (void) errorToastAtBottomWithTitle:(NSString *)title duration:(NSTimeInterval)duration;

#pragma mark - 显示提示的toast
+ (void) warningToastWithTitle:(NSString *)title duration:(NSTimeInterval)duration position:(ZTToastPosition)position;
+ (void) warningToastAtMiddleWithTitle:(NSString *)title duration:(NSTimeInterval)duration;
+ (void) warningToastAtBottomWithTitle:(NSString *)title duration:(NSTimeInterval)duration;

@end
