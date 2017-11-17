//
//  YLMessageHUD.m
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "YLMessageHUD.h"
#import <MBProgressHUD.h>
#import "UIColor+ZTHex.h"

@interface YLMessageHUD ()

@property (nonatomic , strong) MBProgressHUD *hud;

@property (nonatomic , strong) UIView *targetView;

@end

@implementation YLMessageHUD

- (instancetype) initForView:(UIView *)targetView {
    if(self = [super init]) {
        self.targetView = targetView;
        [self configHUD];
    }
    return self;
}

- (void) configHUD {
    self.hud = [MBProgressHUD HUDForView:self.targetView];
    if (! self.hud) {
        self.hud = [[MBProgressHUD alloc] initWithView:self.targetView];
    }
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.bezelView.backgroundColor = [UIColor colorWithHexString:@"2d2d2d"];
    self.hud.removeFromSuperViewOnHide = YES;
    [self.targetView addSubview:self.hud];
}

- (void) showWaiting:(NSString *)wait {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"tp"];
    self.hud.customView = imageView;
    self.hud.label.text = wait;
    self.targetView.userInteractionEnabled = NO;
    [self.hud showAnimated:YES];
}

- (void) showSuccess:(NSString *)success {
    self.hud.label.text = success;
    self.hud.customView = nil;
    [self.hud showAnimated:YES];
    [self hiddenHUDAfter:1.5];
}

- (void) showFailed:(NSString *)failed {
    self.hud.label.text = failed;
    self.hud.customView = nil;
    [self.hud showAnimated:YES];
    [self hiddenHUDAfter:1.5];
}

- (void) hiddenHUD {
    [self hiddenHUDAfter:0];
}

- (void) hiddenHUDAfter:(NSTimeInterval)after {
    self.targetView.userInteractionEnabled = YES;
    self.targetView.userInteractionEnabled = YES;
    [self.hud hideAnimated:YES afterDelay:after];
}

@end
