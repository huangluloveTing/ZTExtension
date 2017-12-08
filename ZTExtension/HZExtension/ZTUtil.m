//
//  ZTUtil.m
//  ZTExtension
//
//  Created by 黄露 on 2017/12/8.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "ZTUtil.h"

@implementation ZTUtil

+ (void) openSystemSetting:(NSString *)sysytemName {
    //iOS8之后
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@""]];
    //如果App没有添加权限，显示的是设定界面。如果App有添加权限（例如通知），显示的是App的设定界面。
    //iOS8之前
    //先添加一个url type如下图，在代码中调用如下代码,即可跳转到设置页面的对应项
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
}

@end
