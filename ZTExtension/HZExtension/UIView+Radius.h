//
//  UIView+Radius.h
//  ZTExtension
//
//  Created by 黄露 on 2017/12/8.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Radius)

//设置部分圆角
- (void) radius_rectCorners:(UIRectCorner)rectCorners
                      radiu:(CGFloat)radius
                      color:(UIColor *)boraderColor ;

@end
