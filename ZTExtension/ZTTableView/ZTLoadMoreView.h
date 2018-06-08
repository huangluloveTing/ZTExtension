//
//  ZTLoadMoreView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/8.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTLoadMoreView : UIView

//圆球的个数
@property (nonatomic , assign) NSInteger circleCount;

//circleColors 数量必须是3个
@property (nonatomic , strong) NSArray <UIColor *> *circleColors;

//起伏的距离
@property (nonatomic , assign) CGFloat jump;

//圆球的半径
@property (nonatomic , assign) CGFloat circleRadius;

//抖动频率（）
@property (nonatomic , assign) CGFloat shakeRate;

//开始抖动
- (void) startShake;
//停止抖动
- (void) stopShake;

@end
