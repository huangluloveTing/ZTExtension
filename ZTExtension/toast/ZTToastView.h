//
//  ZTToastText.h
//  ZTExtension
//
//  Created by 黄露 on 2018/5/24.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTToastHeader.h"

@interface ZTToastView : UIView

+ (instancetype) sharedView;

@property (nonatomic , assign) ZTToastPosition position;

@property (nonatomic , strong) UIFont *textFont;

@property (nonatomic , strong) UIColor *textColor;

@property (nonatomic , strong) UIColor *bgColor;

- (void) currentIcon:(UIImage *)icon;

- (void) currentTitle:(NSString *)title;

@end
