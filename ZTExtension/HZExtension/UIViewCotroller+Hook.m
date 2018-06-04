//
//  UIView+Hook.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/4.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "UIViewCotroller+Hook.h"
#import "NSObject+ZTSwzzling.h"

@implementation UIViewController (Hook)


+(void) load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethods:[self class] OriginMethod:@selector(viewDidLoad) SwizzledMethod:@selector(ZT_viewDidLoad:)];
        [self swizzleMethods:[self class] OriginMethod:@selector(viewDidAppear:) SwizzledMethod:@selector(ZT_viewDidAppear:)];
        [self swizzleMethods:[self class] OriginMethod:@selector(viewWillAppear:) SwizzledMethod:@selector(ZT_viewWillAppear:)];
        [self swizzleMethods:[self class] OriginMethod:@selector(viewWillDisappear:) SwizzledMethod:@selector(ZT_viewWillDisappear:)];
        [self swizzleMethods:[self class] OriginMethod:@selector(viewDidDisappear:) SwizzledMethod:@selector(ZT_viewDidDisappear:)];
    });
}

- (void) ZT_viewDidLoad:(BOOL) animation {
    [self ZT_viewDidLoad:animation];
//    ZTLog(@"ZT_viewDidLoad");
    NSLog(@"__function:%s , __line:%c , __class:%@ \n" , __FUNCTION__ , __LINE__ , NSStringFromClass([self class]));
}

- (void) ZT_viewWillAppear:(BOOL)animation {
    [self ZT_viewWillAppear:animation];
//    ZTLog(@"ZT_viewWillAppear");
}

- (void) ZT_viewWillDisappear:(BOOL) animation {
    [self ZT_viewWillDisappear:animation];
//    ZTLog(@"ZT_viewWillDisappear");
}

- (void) ZT_viewDidAppear:(BOOL)animation {
    [self ZT_viewDidAppear:animation];
//    ZTLog(@"ZT_viewDidAppear");
}

- (void) ZT_viewDidDisappear:(BOOL)animation {
    [self ZT_viewDidDisappear:animation];
//    ZTLog(@"ZT_viewDidDisappear");
}

@end
