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

#define HZ_Weakify(self) \
__weak typeof(self) weak_##_self = self;

#define HZ_Strongify(self) \
__strong typeof(weak_##_self) self = weak_##_self;



#endif /* HZToolHeader_h */
