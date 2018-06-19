//
//  ViewController.m
//  demo
//
//  Created by 黄露 on 2017/10/20.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "ViewController.h"
#import "HZExtensionHeader.h"
#import "UIView+ZTExtension.h"
#import "ZTHUD.h"
#import "ZTUtil.h"
#import "ZTToastManager.h"

#import "ZTCircleView.h"
#import "ZTImageScannerView.h"
#import "ZTImageItem.h"
#import "ZTImgScannerManager.h"
#import <FLAnimatedImage/FLAnimatedImage.h>
#import <FLAnimatedImage/FLAnimatedImage.h>
#import "ZTGifLoadingView.h"
#import "ZTLoadMoreView.h"
#import "ZTTableView.h"
#import <Lottie/Lottie.h>
#import <YogaKit/UIView+Yoga.h>

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic , strong) UIView *redView;

@property (nonatomic , strong) UIView *yellowView;

@property (nonatomic , strong) ZTCircleView *circleView;

//@property (nonatomic , strong) RACSignal *singal_a;
//
//@property (nonatomic , strong) RACSignal *singal_b;
//
//@property (nonatomic , strong) RACSignal *singal_c;

@property (nonatomic , strong) FLAnimatedImageView *imageView;

@end

NSString *image1= @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=b0f72b4864b486d8b82cfca49c543c0c&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe4dde71190ef76c63eba26ff9716fdfaae5167fe.jpg";

NSString *image2=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=d99c0fcc731c05d1d9c765e4f4d9f9a3&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F71cf3bc79f3df8dce5b43e45c711728b4610285c.jpg";

NSString *image3=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=99d3a39efc77cad2c8433898237876bf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201512%2F23%2F20151223190635_eENUs.jpeg";

NSString *image4=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=6291c75cbf0e49dde68b1b1eb332ccb1&imgtype=0&src=http%3A%2F%2Fpic8.nipic.com%2F20100716%2F5372314_005516302742_2.jpg";

NSString *image5=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728894&di=fc27a9e499853444dee52d12740045af&imgtype=0&src=http%3A%2F%2Fpic29.nipic.com%2F20130520%2F7487939_211408433130_2.jpg";

@implementation ViewController {
    NSArray *_imgs;
    ZTTableView *tableve;
    int i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    self.view.backgroundColor = [UIColor yellowColor];
////    self.imageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
////    self.imageView.center = self.view.center;
//    NSData *gifData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"loading" withExtension:@"gif"]];
//    [ZTToastManager showLoadingTitle:@"jiazaizhong"];
//    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:gifData];
//    self.imageView.backgroundColor = [UIColor yellowColor];
//    self.imageView.animatedImage = image;
//    [self.view addSubview:self.imageView];
//    self.singal_a = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [subscriber sendNext:@"singal a"];
//                sleep(1);
//                [subscriber sendNext:@"singal a next"];
//            });
//        });
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"singa dispose");
//        }];
//    }];
//    self.singal_b = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [subscriber sendNext:@"singal b"];
////                [subscriber sendCompleted];
//            });
//        });
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"singb dispose");
//        }];
//    }];
//    
//    self.singal_c = [_singal_a throttle:2];
////    [_singal_c subscribeNext:^(id x) {
////        ");
////    }];
////    self.singal_c = [_singal_a combineLatestWith:_singal_b];
//    [_singal_c subscribeNext:^(id x) {
//        NSLog(@"合并信息 ： %@" , x);
//    }];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(50, 400, 100, 30);
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(tapbutton) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
////    ZTLoadMoreView *moreView = [[ZTLoadMoreView alloc] initWithFrame:CGRectMake(100, 100, 100 , 30)];
////    moreView.circleRadius = 10;
////    moreView.jump = 10;
////    [self.view addSubview:moreView];
////    [moreView startShake];
////    tableve = [[ZTTableView alloc] initWithFrame:CGRectMake(0, 70, CGRectGetWidth(self.view.frame), 300)];
////    [self.view addSubview:tableve];
////
////    tableve.dataSource = self;
////    tableve.tableFooterView = [[UIView alloc] init];
////    [tableve addHeaderFreshBlock:^{
////        NSLog(@"refresh");
////    }];
////    [tableve addFooterFresh:^{
////
////    }];
////
//    LOTAnimationView *animation = [LOTAnimationView animationNamed:@"404" inBundle:[NSBundle mainBundle]];
//    animation.loopAnimation = YES;
//    animation.frame = self.view.bounds;
//    [self.view addSubview:animation];
//    [animation playWithCompletion:^(BOOL animationFinished) {
//    }];
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
    }];
    
    UIView *flexView1 = [[UIView alloc] init];
    flexView1.backgroundColor = [UIColor redColor];
    [flexView1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(30);
    }];
    [self.view addSubview:flexView1];
    
    UIView *flexView2 = [[UIView alloc] init];
    flexView2.backgroundColor = [UIColor blueColor];
    [flexView2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(30);
    }];
    [self.view addSubview:flexView2];
    
    UIView *flexView3 = [[UIView alloc] init];
    flexView3.backgroundColor = [UIColor yellowColor];
    [flexView3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1.0;
    }];
    [self.view addSubview:flexView3];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"hell0";
    }
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (void) tapbutton {
    [tableve endRefresh];
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)yellowView {
    if (!_yellowView) {
        _yellowView = [[UIView alloc] init];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) ZT_viewDidLoad:(BOOL)animation {
    [super ZT_viewDidLoad:animation];
    ZTLog(@" ovrride ");
}


@end

