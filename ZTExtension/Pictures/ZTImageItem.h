//
//  ZTImageItem.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTNetImageItem : NSObject

@property (nonatomic , assign) NSInteger total;

@property (nonatomic , assign) NSInteger currentIndex;

@property (nonatomic , copy) NSString *des;

@property (nonatomic , copy) NSString *imgUrl;

@property (nonatomic , copy) NSString *thumbImageUrl;

@property (nonatomic , copy , readonly) NSString *currentPageFormate;

@end

@interface ZTLocalImageItem: NSObject

@property (nonatomic , assign) NSInteger total;

@property (nonatomic , assign) NSInteger currentIndex;

@property (nonatomic , copy) NSString *des;

@property (nonatomic , strong) UIImage *img;

@property (nonatomic , copy , readonly) NSString *currentPageFormate;

@end
