//
//  NSDateFormatter+ZTCategory.h
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ZTCategory)

+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/

@end
