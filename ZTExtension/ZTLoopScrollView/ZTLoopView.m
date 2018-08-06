//
//  ZTLoopView.m
//  ZTExtension
//
//  Created by 黄露 on 2018/7/20.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTLoopView.h"
#import "ZTLoopViewCell.h"

@interface ZTLoopView()<UICollectionViewDelegate , UICollectionViewDataSource>

@property (nonatomic , strong) UILabel *preLabel;
@property (nonatomic , strong) UILabel *currentLabel;
@property (nonatomic , strong) UILabel *nextLabel;

@property (nonatomic , strong) UICollectionView *collectionView;

@end

@implementation ZTLoopView

#pragma mark - collectDelegate

#pragma mark - collectDatasource
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZTLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZTLoopViewCell class]) forIndexPath:indexPath];
    
    return  cell;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = self.titles.count;
    if (self.attributeTitles && self.attributeTitles.count > 0) {
        count = self.attributeTitles.count;
    }
    return count;
}

#pragma mark - init
- (void) awakeFromNib {
    [super awakeFromNib];
    [self initConfig];
}

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initConfig];
    }
    return self;
}
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initConfig];
    }
    return self;
}

- (void) initConfig {
    self.loopDirection = ZTLoopDerection_Ver;
}

#pragma mark - layout
- (void) layoutSubviews {
    [super layoutSubviews];
}


#pragma mark - lazy
- (UICollectionView *) collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        flowLayout.scrollDirection = [self currentScrollDirection];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[ZTLoopViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ZTLoopViewCell class])];
    }
    return _collectionView;
}

- (UICollectionViewScrollDirection) currentScrollDirection {
    UICollectionViewScrollDirection direction = UICollectionViewScrollDirectionVertical;
    switch (self.loopDirection) {
        case ZTLoopDerection_Ver:
            direction = UICollectionViewScrollDirectionVertical;
            break;
            
        default:
            direction = UICollectionViewScrollDirectionHorizontal;
            break;
    }
    return  direction;
}
                           

#pragma mark - setter
- (void) setLoopDirection:(ZTLoopDirection)loopDirection {
    _loopDirection = loopDirection;
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    flowLayout.scrollDirection = [self currentScrollDirection];
}

@end
