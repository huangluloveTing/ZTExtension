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

@interface ViewController ()

@property (nonatomic , strong) UIView *redView;

@property (nonatomic , strong) UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLeftBarbuttonItemWithTitle:@"tap" TapBlock:^(UIBarButtonItem *barButtonItem) {
       
        [[ZTHUD sharedHUD] showSuccessdHUDToView:self.view ForTitle:@"success"];
    }];
    
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

