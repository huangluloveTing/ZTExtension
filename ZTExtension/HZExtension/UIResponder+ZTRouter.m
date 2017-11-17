//
//  UIResponder+ZTRouter.m
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "UIResponder+ZTRouter.h"

static __weak id currentFirstResponder;

@implementation UIResponder (ZTRouter)

-(void) routerEventWithName:(NSString *)eventName dataInfo:(NSDictionary *)dataInfo{
    [[self nextResponder] routerEventWithName:eventName dataInfo:dataInfo];
}

+(id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

-(void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}

@end
