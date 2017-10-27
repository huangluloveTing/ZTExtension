//
//  NSDictionary+Extension.h
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
 根据规则获取新的数组

 @param regular block ， 自定义规则
 @return return
 */
- (NSArray *) newArrWithRegular:(id (^)(id key , id value))regular;

/**
 根据自定义规则获取新的字典

 @param regular 自定义规则的block
 @return return
 */
- (NSDictionary *)newDictionaryWithRegular:(NSDictionary *(^)(id key , id value))regular;

@end
