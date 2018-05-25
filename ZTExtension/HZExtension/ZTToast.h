//
//  ZTToast.h
//  ZTExtension
//
//  Created by 黄露 on 2018/5/24.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTToastHeader.h"

@interface ZTToast : NSObject


+ (instancetype) toast;

- (void) showToastTitle:(NSString *)title icon:(UIImage *)icon position:(ZTToastPosition)position;

- (void) hidden;

- (void) hiddenByOpacity; //通过设置 透明度 使其隐藏

@end
