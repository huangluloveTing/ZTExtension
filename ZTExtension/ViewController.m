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
#import "ZTViewController.h"
#import "ZTHUD.h"
#import "ZTUtil.h"
#import "ZTToastManager.h"

#import "ZTCircleView.h"
#import "ZTImageScannerView.h"
#import "ZTImageItem.h"
#import "ZTImgScannerManager.h"

@interface ViewController ()

@property (nonatomic , strong) UIView *redView;

@property (nonatomic , strong) UIView *yellowView;

@property (nonatomic , strong) ZTCircleView *circleView;



@end

NSString *image1= @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=b0f72b4864b486d8b82cfca49c543c0c&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe4dde71190ef76c63eba26ff9716fdfaae5167fe.jpg";

NSString *image2=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=d99c0fcc731c05d1d9c765e4f4d9f9a3&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F71cf3bc79f3df8dce5b43e45c711728b4610285c.jpg";

NSString *image3=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=99d3a39efc77cad2c8433898237876bf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201512%2F23%2F20151223190635_eENUs.jpeg";

NSString *image4=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728895&di=6291c75cbf0e49dde68b1b1eb332ccb1&imgtype=0&src=http%3A%2F%2Fpic8.nipic.com%2F20100716%2F5372314_005516302742_2.jpg";

NSString *image5=@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728894&di=fc27a9e499853444dee52d12740045af&imgtype=0&src=http%3A%2F%2Fpic29.nipic.com%2F20130520%2F7487939_211408433130_2.jpg";

@implementation ViewController {
    NSArray *_imgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.circleView = [ZTCircleView showInView:self.view];
//    self.circleView.radius = 100;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 200, 50);
    [butt setTitle:@"tap " forState:UIControlStateNormal];
    butt.center = CGPointMake(50, 300);
    [butt addTarget:self action:@selector(tapbutton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butt];
    butt.backgroundColor = [UIColor redColor];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0 ; i < 6; i ++ ) {
        ZTNetImageItem *item = [[ZTNetImageItem alloc] init];
        item.des = @"sfalkhfakhfkal身份卡号客服哈洛克和福利卡号发货啦客户返利卡号咖啡哈伦裤回复啦咖啡哈伦裤回复啦发货啦开户费拉客户安理会发了客户发快了回复安抚哈伦裤回复拉客户方发哈老客户法力回复安抚哈伦裤合法来看发哈楼回复啦ahflahf";
        item.imgUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1527856728896&di=4ab77a116883d4f2c893e18035c803d7&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Ffc1f4134970a304eed77712edbc8a786c8175c89.jpg";
        item.currentIndex = i;
        item.total = 5;
        [temp addObject:item];
        switch (i) {
            case 0:
                item.imgUrl = image1;
                break;
                
            case 1:
                item.imgUrl = image2;
                break;
                
            case 2:
                item.imgUrl = image3;
                break;
                
            case 3:
                item.imgUrl = image4;
                break;
                
            case 4:
                item.imgUrl = image5;
                break;
                
            default:
                break;
        }
    }
    
    _imgs = temp;
}

- (void) tapbutton {
    [ZTImgScannerManager showNetImages:_imgs currentIndex:3];
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

