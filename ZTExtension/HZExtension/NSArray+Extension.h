//
//  NSArray+Extension.h
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<T> (Extension)

/**
 * map 映射
 */
- (NSArray *) map:(id(^)(T obj , NSInteger index))block;

/**
 * filter 过滤
 */
- (NSArray *) filter:(BOOL(^)(T obj , NSInteger index))block;

/**
 * find 找到符合条件的值
 */
- (id) find:(BOOL(^)(T obj , NSInteger index))block;

/**
 * findAll 找到所有符合条件的值
 */
- (NSArray *) findAll:(BOOL(^)(T obj , NSInteger index))block;

/**
 * some 是否有满足条件的数据，如果有，返回 true
 */
- (BOOL) some:(BOOL(^)(T obj , NSInteger index))block;

/**
 * any 是否所有的都满足条件，如果全部满足，返回true
 */
- (BOOL) any:(BOOL(^)(T obj , NSInteger index))block;

/**
 * sort 排序
 */
- (NSArray *) sort:(NSComparisonResult(^)(T obj1 , T obj2))block;

/**
 * 截取 数组
 * @param start 开始位置
 * @param length 长度
 */
- (NSArray *) slice:(NSInteger)start length:(NSInteger)length;

/**
 * 截取 数组 从开始位置到数组末尾
 * @param start 开始位置
 */
- (NSArray *) slice:(NSInteger) start;

@end
