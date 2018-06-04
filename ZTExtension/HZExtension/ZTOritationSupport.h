//
//  ZTOritationSupport.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/4.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTOritationSupport : NSObject

//枚举 设置旋转方向
typedef enum : NSUInteger {
    Orientations_MaskAll=0,//支持所有的旋转
    Orientations_Portrait,
    Orientations_left,
    Orientations_right,
    Orientations_Landscape //横屏,包含左右横屏
} Orientations;


+ (void) saveCurrentWindowOrientation:(UIInterfaceOrientation)orientation;


+ (UIInterfaceOrientationMask) currentWindowOrientation;

@end
