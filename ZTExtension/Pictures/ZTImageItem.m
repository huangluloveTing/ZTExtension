//
//  ZTImageItem.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTImageItem.h"

@implementation ZTNetImageItem

- (NSString *) currentPageFormate {
    if (_total > 0) {
        return [NSString stringWithFormat:@"%ld / %ld " , _currentIndex + 1  , (long)_total];
    }
    
    return @"";
}

@end


@implementation ZTLocalImageItem

- (NSString *) currentPageFormate {
    if (_total > 0) {
        return [NSString stringWithFormat:@"%ld / %ld " , _currentIndex + 1  , (long)_total];
    }
    
    return @"";
}

@end
