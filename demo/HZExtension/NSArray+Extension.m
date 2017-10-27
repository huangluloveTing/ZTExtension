//
//  NSArray+Extension.m
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSArray *) newArraryWithRegular:(id (^)(id object))block {
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (id obj in self) {
        NSObject *newObj = nil;
        if (block) {
            newObj = block(obj);
            if (!newObj) {
                continue;
            }
        }
        [arr addObject:newObj];
    }
    
    return arr;
}

- (NSArray *) othreArraryWithRegular:(id (^)(id, NSInteger))block {
    
    NSMutableArray *arr = [NSMutableArray array];
    if (self.count > 0) {
        for (int i = 0 ; i < self.count ; i ++) {
            id obj = [self objectAtIndex:i];
            NSObject *newObj = nil;
            if (block) {
                newObj = block(obj , i);
                if (!newObj) {
                    continue;
                }
            }
            [arr addObject:newObj];
        }
    }
    
    return arr;
}

@end
