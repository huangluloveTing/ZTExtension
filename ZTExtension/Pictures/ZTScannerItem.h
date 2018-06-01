//
//  ZTScannerItemView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZTNetImageItem;
@class ZTLocalImageItem;
@class ZTScannerItem;

@protocol ZTScannerItemDelegate<NSObject>

- (void) didTapScannerItem:(ZTScannerItem *)item;

@end

@interface ZTScannerItem : UICollectionViewCell

@property (nonatomic , strong) UIImage *placeholderImage;

@property (nonatomic , strong) ZTNetImageItem *netImageItem;

@property (nonatomic , weak) id<ZTScannerItemDelegate> delegate;

@end
