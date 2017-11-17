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
#import "UIViewController+ZTHUD.h"

@interface ViewController ()

@property (nonatomic , strong) UIView *redView;

@property (nonatomic , strong) UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HZ_Weakify(self);
    [self addLeftBarbuttonItemsWithTitles:@[@"haha", @"hehe"] TapBlock:^(UIBarButtonItem *barButtonItem, NSInteger index) {
        HZ_Strongify(self);
        if (index == 0) {
            [self hiddenHUD];
        }
        else {
            NSLog(@"点击了第二个");
            [self showSuccessWithTitle:@"hahah"];
        }
    }];
    
    [self addRightBarbuttonItemWithTitle:@"title"
                                TapBlock:^(UIBarButtonItem *barButtonItem) {
                                    HZ_Strongify(self);
                                    UIViewController *itemVC = [[UIViewController alloc] init];
                                    itemVC.view.backgroundColor = [UIColor blueColor];
                                    [self pushWhenPushedHiddenBottomTabbarToVC:itemVC Animation:YES];
                                }];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.redView];
    self.redView.right(100).top(20).bottom(400).left(100);
    
    [self.view addSubview:self.yellowView];
    
    self.yellowView.equal_left(self.view).equal_bottom(self.view).constrain_Width(200).constrain_Height(200);
    
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

