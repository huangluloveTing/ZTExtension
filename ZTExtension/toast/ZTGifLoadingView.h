//
//  ZTLoadingView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/7.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTGifLoadingView : UIView

+ (instancetype) shared;

- (void) showOnView:(UIView *)view;

+ (instancetype) loadingAtView:(UIView *)view;

@property (nonatomic , strong) UIFont *textFont;

@property (nonatomic , strong) UIColor *textColor;

@property (nonatomic , copy) NSString *text;

@property (nonatomic , strong) NSData *gifImageData;

- (void) hidden;

- (void) hiddeAtView:(UIView *)view;

@end
