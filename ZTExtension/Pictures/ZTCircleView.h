//
//  ZTCircleView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTCircleView : UIView

@property (nonatomic , assign) CGFloat progress; //加载百分比

@property (nonatomic , strong) UIColor *bgColor;

@property (nonatomic , assign) CGFloat radius;

+ (instancetype) showInView:(UIView *)targetView;

- (void) hidden;

@end
