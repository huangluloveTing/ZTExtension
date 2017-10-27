//
//  NSDictionary+Extension.m
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSArray *) newArrWithRegular:(id (^)(id , id))regular {
    __block NSMutableArray *newArr = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        id newObject = nil;
        if (regular) {
            newObject = regular(key , obj);
            if (newObject) {
                [newArr addObject:newObject];
            }
        }
        
        
    }];
    
    
    
    return newArr;
}

- (NSDictionary *) newDictionaryWithRegular:(NSDictionary *(^)(id , id))regular {
    __block NSMutableDictionary *newDic = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSDictionary *dic = nil;
        if (regular) {
            dic = regular(key , obj);
        }
        if (dic) {
            [newDic setValuesForKeysWithDictionary:dic];
        }
    }];
    
    return newDic;
}

@end
