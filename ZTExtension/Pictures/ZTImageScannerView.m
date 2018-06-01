//
//  ZTImageScannerView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/1.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTImageScannerView.h"
#import "UIView+ZTExtension.h"
#import "ZTScannerItem.h"
#import "ZTImageItem.h"

@interface ZTImageScannerView()<UICollectionViewDelegate , UICollectionViewDataSource , ZTScannerItemDelegate>

@property (nonatomic , strong) UICollectionView *collectionView;

@property (nonatomic , strong) UILabel *pageLabel;

@property (nonatomic , strong) UILabel *descLabel;

@end

@implementation ZTImageScannerView


- (void) configCollectionView {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(width, height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self addSubview:self.collectionView];
    self.collectionView.top(0).right(0).left(0).bottom(0);
    
    [self.collectionView registerClass:[ZTScannerItem class] forCellWithReuseIdentifier:NSStringFromClass([ZTScannerItem class])];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    
    [self addSubview:self.pageLabel];
    self.pageLabel.top(20).left(20);
    [self addSubview:self.descLabel];
    self.descLabel.left(10).right(10).bottom(10);
    [self showContentAtIndex:0];
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configCollectionView];
    }
    
    return self;
}

#pragma mark - UICollectionViewDelegate
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = round(scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame));
    _currentIndex = currentIndex;
    [self showContentAtIndex:currentIndex];
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZTScannerItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZTScannerItem class]) forIndexPath:indexPath];
    item.netImageItem = self.items[indexPath.row];
    item.delegate = self;
    return item;
}

- (void) didTapScannerItem:(ZTScannerItem *)item {
    [self removeFromSuperview];
}

#pragma mark - setter

- (void) setItems:(NSArray *)items {
    _items = items;
    [self.collectionView reloadData];
}

#pragma mark -

#pragma mark - lazy
- (UILabel *) descLabel {
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = [UIColor whiteColor];
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}
- (UILabel *) pageLabel {
    if (!_pageLabel) {
        _pageLabel = [[UILabel alloc] init];
        _pageLabel.textColor = [UIColor whiteColor];
        _pageLabel.font = [UIFont systemFontOfSize:18];
    }
    return _pageLabel;
}

- (void) setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    [self showContentAtIndex:currentIndex];
}

- (void) showContentAtIndex:(NSInteger)index {
    self.pageLabel.text = [NSString stringWithFormat:@"%ld / %ld" , index + 1 , self.items.count];
    self.descLabel.text = self.items[index].des;
}

#pragma mark -
- (void) layoutSubviews {
    [super layoutSubviews];
    self.collectionView.contentOffset = CGPointMake(_currentIndex * CGRectGetWidth(self.frame) , 0);
}

@end
