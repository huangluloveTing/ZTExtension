//
//  HZToolHeader.h
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#ifndef HZExtensionHeader_h
#define HZExtensionHeader_h

#import "NSArray+Extension.h"
#import "NSDictionary+Extension.h"
#import "UIViewController+Extension.h"
#import "UIControl+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+ZTExtension.h"
#import "UIViewCotroller+Hook.h"
#import "UIViewController+Orientation.h"

// 避免宏循环引用
#ifndef LLWeakObj
#if DEBUG
#if __has_feature(objc_arc)
#define LLWeakObj(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define LLWeakObj(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define LLWeakObj(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define LLWeakObj(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef LLStrongObj
#if DEBUG
#if __has_feature(objc_arc)
#define LLStrongObj(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define LLStrongObj(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define LLStrongObj(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define LLStrongObj(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#define HZ_Weakify(self) @LLWeakObj(self)

#define HZ_Strongify(self) @LLStrongObj(self)

#ifdef DEBUG
#define ZTLog(logInfo) NSLog(@"__function:%s , __line:%c , __class:%@ \n%@" , __FUNCTION__ , __LINE__ , NSStringFromClass([self class]) ,logInfo)
#else
#define ZTLog(logInfo)
#endif



#endif /* HZToolHeader_h */
