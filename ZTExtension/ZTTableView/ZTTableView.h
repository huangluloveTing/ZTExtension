//
//  ZTTableView.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/8.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZTRefreshBlock)(void);

@interface ZTTableView : UITableView

- (void) addHeaderFreshBlock:(ZTRefreshBlock)freshBlock;
- (void) addFooterFresh:(ZTRefreshBlock)freshBlock;

- (void) headerBeginRefresh;
- (void) footerBeginRefresh;
- (void) endHeaderRefresh;
- (void) endFooterRefresh;
- (void) endRefresh;
- (void) footerNoMoreData;
- (void) resetFooterMoreFresh;

@end
