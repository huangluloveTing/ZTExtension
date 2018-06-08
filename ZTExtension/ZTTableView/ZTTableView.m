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
    self.mj_header = [ZTRefreshHeader headerWithRefreshingBlock:freshBlock];
}
- (void) addFooterFresh:(ZTRefreshBlock)freshBlock {
    self.mj_footer = [ZTRefreshFooter footerWithRefreshingBlock:freshBlock];
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
