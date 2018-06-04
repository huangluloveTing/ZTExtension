//
//  UIView+Hook.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/4.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Hook)

- (void) ZT_viewDidLoad:(BOOL) animation;

- (void) ZT_viewWillAppear:(BOOL)animation;

- (void) ZT_viewWillDisappear:(BOOL) animation ;

- (void) ZT_viewDidAppear:(BOOL)animation ;

- (void) ZT_viewDidDisappear:(BOOL)animation;

@end
