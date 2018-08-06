//
//  ZTLoopView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/7/20.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ZTLoopView;
@protocol ZTLoopViewDelegate <NSObject>

- (UIFont *) fontForloopView:(ZTLoopView *)loopView withTitle:(NSString *)title atIndex:(NSInteger)index;

- (UIView *) itemViewForLoopView:(ZTLoopView *)loopView atIndex:(NSInteger)index;

@end


typedef NS_ENUM(NSInteger , ZTLoopDirection) {
    ZTLoopDerection_Hori = 0,
    ZTLoopDerection_Ver
};

@interface ZTLoopView : UIView

@property (nonatomic , assign) ZTLoopDirection loopDirection; // loop 的方向

@property (nonatomic , strong) NSArray *titles;             //普通title集合
@property (nonatomic , strong) UIFont *font;                // 字体大小

/* 设置了富文本集合，普通title集合将失效*/
@property (nonatomic , strong) NSArray *attributeTitles;    // 设置富文本集合

@property (nonatomic , weak) id<ZTLoopViewDelegate> delegate;

@end
