//
//  ZTImgScannerManager.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZTNetImageItem;
@class ZTLocalImageItem;

typedef NSArray *(^ZTImageLocationRulesBlock)(NSArray *);

@interface ZTImgScannerManager : NSObject

+ (void) showLocalImages:(NSArray<ZTLocalImageItem *> *)imgs currentIndex:(NSInteger)index;

+ (void) showNetImages:(NSArray <ZTNetImageItem *> *)imgs currentIndex:(NSInteger)index;

@end
