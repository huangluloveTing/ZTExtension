//
//  NSTimer+ZTLoop.h
//  ZTExtension
//
//  Created by 黄露 on 2018/6/26.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ZTLoop)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)stopTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
