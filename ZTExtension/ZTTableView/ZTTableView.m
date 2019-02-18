//
//  ZTTableView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/8.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTTableView.h"
#import "ZTRefreshHeader.h"
#import "ZTRefreshFooter.h"

@implementation ZTTableView

- (void) addHeaderFreshBlock:(ZTRefreshBlock)freshBlock {
    ZTRefreshHeader *mj_header = [ZTRefreshHeader headerWithRefreshingBlock:freshBlock];
    [mj_header setShakeTitle:@"优鲜就在您身边" state:MJRefreshStatePulling];
    [mj_header setShakeTitle:@"优鲜就在您身边" state:MJRefreshStateIdle];
    [mj_header setShakeTitle:@"正在努力加载" state:MJRefreshStateRefreshing];
    [mj_header setShakeTitle:@"优鲜就在您身边" state:MJRefreshStateWillRefresh];
    self.mj_header = mj_header;
}
- (void) addFooterFresh:(ZTRefreshBlock)freshBlock {
    ZTRefreshFooter *mj_footer = [ZTRefreshFooter footerWithRefreshingBlock:freshBlock];
    [mj_footer setShakeTitle:@"优鲜就在您身边" state:MJRefreshStatePulling];
    [mj_footer setShakeTitle:@"优鲜就在您身边" state:MJRefreshStateIdle];
    [mj_footer setShakeTitle:@"优鲜就在您身边" state:MJRefreshStateWillRefresh];
    [mj_footer setShakeTitle:@"正在努力加载" state:MJRefreshStateRefreshing];
    [mj_footer setShakeTitle:@"优鲜就在您身边" state:MJRefreshStateNoMoreData];
    self.mj_footer = mj_footer;
}

- (void) headerBeginRefresh {
    [self.mj_header beginRefreshing];
}
- (void) footerBeginRefresh {
    [self.mj_footer beginRefreshing];
}
- (void) endHeaderRefresh {
    [self.mj_header endRefreshing];
}
- (void) endFooterRefresh {
    [self.mj_footer endRefreshing];
}
- (void) endRefresh {
    [self endHeaderRefresh];
    [self endFooterRefresh];
}
- (void) footerNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}
- (void) resetFooterMoreFresh {
    [self.mj_footer resetNoMoreData];
}

@end
