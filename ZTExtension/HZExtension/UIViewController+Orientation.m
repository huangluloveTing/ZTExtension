//
//  UIViewController+Orientation.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/4.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "UIViewController+Orientation.h"
#import "ZTOritationSupport.h"


@implementation UIViewController (Orientation)

#pragma mark setOrientations
/**第三步:base界面旋转开关控制,指定界面重新开关控制**/
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)setInterfaceOrientation:(UIInterfaceOrientation )orientation
{
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            [ZTOritationSupport saveCurrentWindowOrientation:orientation];
            if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(application:supportedInterfaceOrientationsForWindow:)]) {
                [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
            }
            else {
                @throw [NSException exceptionWithName:@"屏幕旋转" reason:@"需要实现 appdelegate的 application:supportedInterfaceOrientationsForWindow:  方法" userInfo:nil];
            }
            [self interfaceOrientation:orientation];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [ZTOritationSupport saveCurrentWindowOrientation:orientation];
            if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(application:supportedInterfaceOrientationsForWindow:)]) {
                [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
            }
            else {
                @throw [NSException exceptionWithName:@"屏幕旋转" reason:@"需要实现 appdelegate的 application:supportedInterfaceOrientationsForWindow:  方法" userInfo:nil];
            }
            [self interfaceOrientation:orientation];
            break;
        case UIInterfaceOrientationPortrait:
            [ZTOritationSupport saveCurrentWindowOrientation:orientation];
            if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(application:supportedInterfaceOrientationsForWindow:)]) {
                [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
            }
            else {
                @throw [NSException exceptionWithName:@"屏幕旋转" reason:@"需要实现 appdelegate的 application:supportedInterfaceOrientationsForWindow:  方法" userInfo:nil];
            }
            [self interfaceOrientation:orientation];
            break;
        default:
            break;
    }
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}
@end
