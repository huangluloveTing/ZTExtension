//
//  NSArray+Extension.m
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSArray *) map:(id (^)(id, NSInteger))block {
    __block NSMutableArray *newArr = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) {
            id newObject = block(obj , idx);
            [newArr addObject:newObject];
        }
    }];
    return [NSArray arrayWithArray:newArr];
}

- (NSArray *) filter:(BOOL (^)(id, NSInteger))block {
    __block NSMutableArray *newArr = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) {
            BOOL ok = block(obj , idx);
            if (ok) {
                [newArr addObject:obj];
            }
        }
    }];
    return [NSArray arrayWithArray:newArr];
}

- (id) find:(BOOL (^)(id, NSInteger))block {
    __block id newObject = nil;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) {
            BOOL ok = block(obj , idx);
            if (ok) {
                newObject = obj;
                *stop = true;
            }
        }
    }];
    return newObject;
}

- (NSArray *) findAll:(BOOL (^)(id, NSInteger))block {
    return [self filter:block];
}

- (BOOL) some:(BOOL (^)(id, NSInteger))block {
    id obj = [self find:block];
    if (obj) {
        return true;
    }
    return false;
}

- (BOOL) any:(BOOL (^)(id, NSInteger))block {
    __block BOOL ok = true;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) {
            BOOL result = block(obj , idx);
            if (!result) {
                ok = false;
                *stop = true;
            }
        }
    }];
    return ok;
}

- (NSArray *) sort:(NSComparisonResult (^)(id, id))block {
    return [self sortedArrayUsingComparator:block];
}

- (NSArray *) slice:(NSInteger)start {
    return [self slice:start length:self.count];
}

- (NSArray *) slice:(NSInteger)start length:(NSInteger)length {
    NSAssert(start < self.count, @"开始位置必须小于数组长度");
    NSInteger newLength = length;
    if (start + length > self.count) {
        newLength = self.count - start;
    }
    NSArray *newArr =  [self subarrayWithRange:NSMakeRange(start, newLength)];
    return newArr;
}

@end
