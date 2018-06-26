//
//  NSTimer+ZTLoop.m
//  ZTExtension
//
//  Created by 黄露 on 2018/6/26.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "NSTimer+ZTLoop.h"

@implementation NSTimer (ZTLoop)


-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

- (void)stopTimer
{
    if ([self isValid]) {
        [self invalidate];
    }
}

@end
