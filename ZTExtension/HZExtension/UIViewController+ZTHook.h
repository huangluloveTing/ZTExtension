//
//  UIViewController+ZTHook.h
//  ZTExtension
//
//  Created by 黄露 on 2017/10/31.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZTHook)

- (void) ZT_viewDidLoad:(BOOL) animation;

- (void) ZT_viewWillAppear:(BOOL)animation;

- (void) ZT_viewWillDisappear:(BOOL) animation ;

- (void) ZT_viewDidAppear:(BOOL)animation ;

- (void) ZT_viewDidDisappear:(BOOL)animation;

@end
