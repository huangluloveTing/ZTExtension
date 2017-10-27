//
//  NSArray+Extension.h
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

/**
 根据自己定义的规则，组成新的数组

 @param block block
 @return newArr
 */
- (NSArray *) newArraryWithRegular:(id (^)(id  object))block;

- (NSArray *) othreArraryWithRegular:(id (^)(id  object , NSInteger index))block;

@end
