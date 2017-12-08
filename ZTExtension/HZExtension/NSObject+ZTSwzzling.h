//
//  NSObject+ZTSwzzling.h
//  ZTExtension
//
//  Created by 黄露 on 2017/10/31.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZTSwzzling)


/**
 方法交换

 @param class class
 @param originSel originSel description
 @param swizzleSel swizzleSel description
 */
+ (void) swizzleMethods:(Class)class OriginMethod:(SEL)originSel SwizzledMethod:(SEL)swizzleSel;


@end
