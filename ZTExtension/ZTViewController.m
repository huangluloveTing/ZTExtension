//
//  ZTViewController.m
//  ZTExtension
//
//  Created by 黄露 on 2017/10/31.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "ZTViewController.h"
#import "UIViewController+Extension.h"
#import "HZExtensionHeader.h"

@interface ZTViewController ()

@end

@implementation ZTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    HZ_Weakify(self);
    [self addRightBarbuttonItemWithTitle:@"tap" TapBlock:^(UIBarButtonItem *barButtonItem) {
        HZ_Strongify(self);
        ZTViewController *itemVC = [[ZTViewController alloc] init];
        [self pushWhenPushedHiddenBottomTabbarAndDestoryCurrentToVC:itemVC Animation:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
