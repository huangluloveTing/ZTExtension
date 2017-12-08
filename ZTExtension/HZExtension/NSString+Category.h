//
//  NSString+Category.h
//  ZTExtension
//
//  Created by 黄露 on 2017/12/8.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

/**
 字符串反转 方法一
 */
- (NSString *)reverseWords;

/**
 字符串反转 方法二
 */
- (NSString*)reverseWordsOtherFun;

//字符串是否含有中文
- (BOOL)checkIsChinese;

//获取汉子的拼音
+ (NSString *)transform:(NSString *)chinese;

//阿拉伯数字转中文格式
+(NSString *)translation:(NSString *)arebic;



@end
