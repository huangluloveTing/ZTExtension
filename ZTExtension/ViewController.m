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
#import <SDWebImage/FLAnimatedImageView+WebCache.h>
#import <YYText/YYText.h>

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

NSString *video = @"https://apd-0c188bb5ab2fef2acb91849a22f08a08.v.smtcdns.com/om.tc.qq.com/Asrq36I8jIEbp5uOrda9zu0T3z0TnxxzKD-Y41bHcB60/uwMROfz0r5zEYaQXGdGnC2dfJ7zj45gf7uirZPo4C_o7RdqK/g0545kszfu3.p712.1.mp4?sdtfrom=v1010&guid=0458a27b84d4711880dd8929f2bfbcb8&vkey=9D693C5877F009FD2062C3D36C6DD3B1508DFE381D24D94AB1FB6F52487C6F7990D76885A7B1C6F32EE077F10D4DAC7B076CBE9E8BE62C1EE5462572A7E5A105037A2968804FA4E0743ED6C3263CCD7AA74B7E370BCC8F910191D6FE48CCBBA7DF3379A34427721DF6D96C15CF0EE9BDE40C912BF6DF4F57#t=62";

@implementation ViewController {
    NSArray *_imgs;
    ZTTableView *tableve;
    int i;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _playerMaskView = [[ZQPlayerMaskView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width*0.56)];
////    _playerMaskView.delegate = self;
//    _playerMaskView.isWiFi = YES; // 是否允许自动加载，
//    [self.view addSubview:_playerMaskView];
//
//    // 网络视频
//    NSString *videoUrl = @"http://183.60.197.29/17/q/t/v/w/qtvwspkejwgqjqeywjfowzdjcjvjzs/hc.yinyuetai.com/A0780162B98038FBED45554E85720E53.mp4?sc=e9bad1bb86f52b6f&br=781&vid=3192743&aid=38959&area=KR&vst=2&ptp=mv&rd=yinyuetai.com";
//    // 本地视频
//    // NSString *videoUrl = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"];
//    [_playerMaskView playWithVideoUrl:videoUrl];
    
//    YYTextView *textView = [[YYTextView alloc] initWithFrame:CGRectMake(0, 100, 0, 0)];
//    textView.backgroundColor = [UIColor grayColor];
//    textView = [[YYTextView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
//    textView.userInteractionEnabled = YES;
//    textView.textVerticalAlignment = YYTextVerticalAlignmentTop;
//
//    //创建最主要的attribute文本
//    NSMutableAttributedString *contentText = [NSMutableAttributedString new];
//    UIFont *font = [UIFont systemFontOfSize:16];
//
//    //图片资源
//    UIImage *image = [UIImage imageNamed:@"loading.gif"];
//
//
//    //添加文本+图片
//    [contentText appendAttributedString:[[NSAttributedString alloc] initWithString:@"这是第一站图片" attributes:nil]];
//    {
//        FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithImage:image];
//        imageView.frame = CGRectMake(0, 0, textView.width - 10, textView.width/image.size.width*image.size.height);
//        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
//        [contentText appendAttributedString:attachText];
//    }
//
//    //添加文本+图片
//    [contentText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n 接下来是第二张" attributes:nil]];
//
//    {
//        FLAnimatedImageView *imageView2 = [[FLAnimatedImageView alloc] initWithImage:image];
//
//        imageView2.frame = CGRectMake(0, 0, textView.width - 10, textView.width/image.size.width*image.size.height);
//        NSMutableAttributedString *attachText2 = [NSMutableAttributedString yy_attachmentStringWithContent:imageView2 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView2.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
//        [contentText appendAttributedString:attachText2];
//    }
//
//    textView.attributedText = contentText;
//    [self.view addSubview:textView];
//
//    //获取图片资源
//    NSArray *attachments =  textView.textLayout.attachments;
//    for(YYTextAttachment *attachment in attachments)
//    {
//        FLAnimatedImageView *imageView = attachment.content;
//        UIImage *image = imageView.image;
//        NSLog(@"获取到图片:%@",image);
//    }
//    NSArray *attachmentRanges = textView.textLayout.attachmentRanges;
//    for (NSValue *range in attachmentRanges)
//    {
//        NSRange r = [range rangeValue];
//        NSLog(@"资源所在位置：%ld 长度: %ld",r.location,r.length);
//    }

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
//    tableve = [[ZTTableView alloc] initWithFrame:CGRectMake(0, 70, CGRectGetWidth(self.view.frame), 300)];
//    [self.view addSubview:tableve];
//////
//    tableve.dataSource = self;
//    tableve.tableFooterView = [[UIView alloc] init];
//    [tableve addHeaderFreshBlock:^{
//        NSLog(@"refresh");
//
//    }];
//    [tableve addFooterFresh:^{
//
//    }];
//
//    [self addRightBarbuttonItemWithTitle:@"stop" TapBlock:^(UIBarButtonItem *barButtonItem) {
//        [tableve endRefresh];
////        [ZTToastManager showLoadingTitle:@"努力加载"];
//    }];
////
//    LOTAnimationView *animation = [LOTAnimationView animationNamed:@"404" inBundle:[NSBundle mainBundle]];
//    animation.loopAnimation = YES;
//    animation.frame = self.view.bounds;
//    [self.view addSubview:animation];
//    [animation playWithCompletion:^(BOOL animationFinished) {
//    }];
//    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.flexDirection = YGFlexDirectionRow;
//    }];
//    
//    UIView *flexView1 = [[UIView alloc] init];
//    flexView1.backgroundColor = [UIColor redColor];
//    [flexView1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.width = YGPointValue(30);
//    }];
//    [self.view addSubview:flexView1];
//    
//    UIView *flexView2 = [[UIView alloc] init];
//    flexView2.backgroundColor = [UIColor blueColor];
//    [flexView2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.width = YGPointValue(30);
//    }];
//    [self.view addSubview:flexView2];
//    
//    UIView *flexView3 = [[UIView alloc] init];
//    flexView3.backgroundColor = [UIColor yellowColor];
//    [flexView3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.flexGrow = 1.0;
//    }];
//    [self.view addSubview:flexView3];
//    [self.view.yoga applyLayoutPreservingOrigin:YES];
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

