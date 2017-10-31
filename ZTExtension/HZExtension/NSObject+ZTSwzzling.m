//
//  NSObject+ZTSwzzling.m
//  ZTExtension
//
//  Created by 黄露 on 2017/10/31.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "NSObject+ZTSwzzling.h"
#import <objc/runtime.h>

@implementation NSObject (ZTSwzzling)

+ (void) swizzleMethods:(Class)class OriginMethod:(SEL)originSel SwizzledMethod:(SEL)swizzleSel {
    
    Method originMethod = class_getInstanceMethod(class, originSel);
    Method swizzleMethod = class_getInstanceMethod(class, swizzleSel);
    
    BOOL didMethod = class_addMethod(class, originSel, class_getMethodImplementation(class, swizzleSel), method_getTypeEncoding(swizzleMethod));
    if (didMethod) {
        class_replaceMethod(class, swizzleSel, class_getMethodImplementation(class, originSel), method_getTypeEncoding(originMethod));
    }
    else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
}

@end
