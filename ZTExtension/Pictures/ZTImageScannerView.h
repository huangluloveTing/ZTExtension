//
//  ZTImageScannerView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZTNetImageItem;

@interface ZTImageScannerView : UIView

@property (nonatomic , strong) NSArray<ZTNetImageItem *> *items;

@property (nonatomic , assign) NSInteger currentIndex;

@end
