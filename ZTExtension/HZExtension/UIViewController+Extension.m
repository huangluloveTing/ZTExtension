//
//  UIViewController+Extension.m
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>
#import "NSArray+Extension.h"

@interface UIViewController ()

@property (nonatomic , strong) NSMutableArray *eventBlocks;

@end

@implementation UIViewController (Extension)

- (void) presentToVC:(UIViewController *)vc Animation:(BOOL)animation Return:(ReturnBlock)returnBlock {
    if (vc) {
        [self presentViewController:vc animated:animation completion:^{
#ifdef DEBUG
            NSLog(@"present");
#endif
        }];
        
        if (returnBlock) {
            self.returnBlock = returnBlock;
        }
    }
}


- (void) pushWhenPushedHiddenBottomTabbarToVC:(UIViewController *)vc Animation:(BOOL)animation{
    if (self.navigationController) {
        [self.navigationController pushViewController:vc animated:animation];
    }
}

- (void) popViewControllerAnimation:(BOOL)animation {
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:animation];
    }
}

- (void) popViewControllerAtIndex:(NSInteger )index Animation:(BOOL)animation{
    if (self.navigationController && self.navigationController.viewControllers.count > index - 1) {
        UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:index];
        [self.navigationController popToViewController:vc animated:animation];
    }
}

- (void) popToRootViewControllerAnimation:(BOOL)animation {
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimation:animation];
    }
}


- (void) addRightBarbuttonItemWithTitle:(NSString *)rightTitle
                               TapBlock:(TapRightBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(tapRightBarButtonItemAction:)];
        self.navigationItem.rightBarButtonItem = rightBar;
        if (tapBlock) {
            self.tapRightBlock = tapBlock;
        }
    }
}

- (void) addRightBarbuttonItemWithView:(UIView *)view {
    if (self.navigationController) {
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:view];
        self.navigationItem.rightBarButtonItem = rightBar;
    }
}

- (void) addRightBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                   TapBlock:(TapRightBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemStyle target:self action:@selector(tapRightBarButtonItemAction:)];
        self.navigationItem.rightBarButtonItem = rightBar;
        if (tapBlock) {
            self.tapRightBlock = tapBlock;
        }
    }
}

- (void) addRightBarbuttonItemsWithTitles:(NSArray *)titles TapBlock:(TapRightBarButtonItemsEventBlock)tapBlock {
    if (self.navigationController) {
        NSArray *items = [titles othreArraryWithRegular:^id(NSString * title, NSInteger index) {
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(tapRightBarButtonItemAction:)];
            item.tag = index + 100;
            return item;
        }];
        if (tapBlock) {
            self.tapRightItemsBlock = tapBlock;
        }
        self.navigationItem.rightBarButtonItems = items;
    }
}

- (void) addLeftBarbuttonItemsWithTitles:(NSArray *)titles TapBlock:(TapRightBarButtonItemsEventBlock)tapBlock {
    if (self.navigationController) {
        NSArray *items = [titles othreArraryWithRegular:^id(NSString * title, NSInteger index) {
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(tapLeftBarButtonItemAction:)];
            item.tag = index + 100;
            return item;
        }];
        if (tapBlock) {
            self.tapLeftItemsBlock = tapBlock;
        }
        self.navigationItem.leftBarButtonItems = items;
    }
}

- (void) addLeftBarbuttonItemWithTitle:(NSString *)rightTitle
                              TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(tapLeftBarButtonItemAction:)];
        self.navigationItem.leftBarButtonItem = leftBat;
        if (tapBlock) {
            self.tapLeftBlock = tapBlock;
        }
    }
}

- (void) addLeftBarbuttonItemWithView:(UIView *)view {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithCustomView:view];
        self.navigationItem.leftBarButtonItem = leftBat;
    }
}

- (void) addLeftBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                  TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemStyle target:self action:@selector(tapLeftBarButtonItemAction:)];
        self.navigationItem.leftBarButtonItem = leftBat;
        if (tapBlock) {
            self.tapLeftBlock = tapBlock;
        }
    }
}


- (void) tapRightBarButtonItemAction:(UIBarButtonItem *) barButton {
    if (self.tapRightItemsBlock) {
        self.tapRightItemsBlock(barButton, barButton.tag - 100);
    }
    if (self.tapRightBlock) {
        self.tapRightBlock(barButton);
    }
    
}

- (void) tapLeftBarButtonItemAction:(UIBarButtonItem *)barButton {
    if (self.tapLeftItemsBlock) {
        self.tapLeftItemsBlock(barButton, barButton.tag - 100);
    }
    if (self.tapLeftBlock) {
        self.tapLeftBlock(barButton);
    }
}

#pragma mark - Block
- (void) setReturnBlock:(ReturnBlock)returnBlock {
    objc_setAssociatedObject(self, @selector(setReturnBlock:), returnBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (ReturnBlock) returnBlock {
    return objc_getAssociatedObject(self, @selector(setReturnBlock:));
}

- (void) setTapLeftBlock:(TapLeftBarButtonItemEventBlock)tapBlock {
    objc_setAssociatedObject(self, @selector(setTapLeftBlock:), tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TapLeftBarButtonItemEventBlock) tapLeftBlock {
    return objc_getAssociatedObject(self, @selector(setTapLeftBlock:));
}

- (void) setTapRightBlock:(TapRightBarButtonItemEventBlock)tapBlock {
    objc_setAssociatedObject(self, @selector(setTapRightBlock:), tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TapLeftBarButtonItemEventBlock) tapRightBlock {
    return objc_getAssociatedObject(self, @selector(setTapRightBlock:));
}

- (void) setTapLeftItemsBlock:(TapLeftBarButtonItemsEventBlock)tapLeftItemsBlock {
    objc_setAssociatedObject(self, @selector(setTapLeftItemsBlock:), tapLeftItemsBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TapLeftBarButtonItemsEventBlock) tapLeftItemsBlock {
    return objc_getAssociatedObject(self, @selector(setTapLeftItemsBlock:));
}

- (void) setTapRightItemsBlock:(TapRightBarButtonItemsEventBlock)tapRightItemsBlock {
    objc_setAssociatedObject(self, @selector(setTapRightItemsBlock:), tapRightItemsBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TapRightBarButtonItemsEventBlock) tapRightItemsBlock {
    return objc_getAssociatedObject(self, @selector(setTapRightItemsBlock:));
}
@end
