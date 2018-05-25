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

@interface ViewController ()

@property (nonatomic , strong) UIView *redView;

@property (nonatomic , strong) UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ZTToastManager toastWithTitle:@"this is toast demo" icon:[UIImage imageNamed:@"tp"] position:ZTToastPosition_Middle duration:5];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZTToastManager toastWithTitle:@"this is" icon:[UIImage imageNamed:@"tp"] position:ZTToastPosition_Middle duration:2];
    });
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, 0, 200, 50);
    [butt setTitle:@"tap " forState:UIControlStateNormal];
    butt.center = CGPointMake(50, 300);
    [butt addTarget:self action:@selector(tapbutton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butt];
    butt.backgroundColor = [UIColor redColor];
}

- (void) tapbutton {
    
    [ZTToastManager successToastAtBottomWithTitle:@"提交成功" duration:2];
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

