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
        vc.hidesBottomBarWhenPushed = YES;
        self.pushAnimation = animation;
        [self.navigationController pushViewController:vc animated:animation];
    }
}

- (void) pushWhenPushedHiddenBottomTabbarAndDestoryCurrentToVC:(UIViewController *)vc Animation:(BOOL)animation {
    if (self.navigationController) {
        self.pushAnimation = animation;
        [self pushWhenPushedHiddenBottomTabbarToVC:vc Animation:animation];
        UIViewController *currentVC = self;
        NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [viewControllers removeObject:currentVC];
        self.navigationController.viewControllers = viewControllers;
    }
}

- (void) popViewControllerAnimation:(BOOL)animation {
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:animation];
    }
}

- (void) popViewControllerLikePush {
    [self popViewControllerAnimation:self.pushAnimation];
}

- (void) popViewControllerAtIndex:(NSInteger )index Animation:(BOOL)animation{
    if (self.navigationController && self.navigationController.viewControllers.count > index) {
        UIViewController *vc = [self.navigationController.viewControllers objectAtIndex:index];
        [self.navigationController popToViewController:vc animated:animation];
    }
}

- (void) popToRootViewControllerAnimation:(BOOL)animation {
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimated:animation];
    }
}

- (void) popViewControllerCurrentBeforeIndes:(NSInteger)index animation:(BOOL)animation {
    if (self.navigationController && self.navigationController.viewControllers.count > index) {
        NSInteger currentIndex = [self.navigationController.viewControllers indexOfObject:self];
        UIViewController *toVC = nil;
        if (currentIndex > index) {
            toVC = [self.navigationController.viewControllers objectAtIndex:(currentIndex - index)];
        }
        [self.navigationController popToViewController:toVC animated:YES];
    }
}


- (UIBarButtonItem *) addRightBarbuttonItemWithTitle:(NSString *)rightTitle
                               TapBlock:(TapRightBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(tapRightBarButtonItemAction:)];
        self.navigationItem.rightBarButtonItem = rightBar;
        if (tapBlock) {
            self.tapRightBlock = tapBlock;
        }
        return rightBar;
    }
    return nil;
}

- (UIBarButtonItem *) addRightBarbuttonItemWithView:(UIView *)view {
    if (self.navigationController) {
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:view];
        self.navigationItem.rightBarButtonItem = rightBar;
        return rightBar;
    }
    return nil;
}

- (UIBarButtonItem *) addRightBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                   TapBlock:(TapRightBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemStyle target:self action:@selector(tapRightBarButtonItemAction:)];
        self.navigationItem.rightBarButtonItem = rightBar;
        if (tapBlock) {
            self.tapRightBlock = tapBlock;
        }
        return rightBar;
    }
    return nil;
}

- (NSArray <UIBarButtonItem *> *) addRightBarbuttonItemsWithTitles:(NSArray *)titles TapBlock:(TapRightBarButtonItemsEventBlock)tapBlock {
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
        return items;
    }
    return nil;
}

- (UIBarButtonItem *) addRightBarbuttonItemWithImage:(UIImage *)image TapBlock:(TapRightBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *rightBat = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(tapRightBarButtonItemAction:)];
        self.navigationItem.rightBarButtonItem = rightBat;
        if (tapBlock) {
            self.tapLeftBlock = tapBlock;
        }
        return rightBat;
    }
    return nil;
}

- (NSArray <UIBarButtonItem * >*) addLeftBarbuttonItemsWithTitles:(NSArray *)titles TapBlock:(TapLeftBarButtonItemsEventBlock)tapBlock {
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
        return items;
    }
    return nil;
}

- (UIBarButtonItem *) addLeftBarbuttonItemWithTitle:(NSString *)rightTitle
                              TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(tapLeftBarButtonItemAction:)];
        self.navigationItem.leftBarButtonItem = leftBat;
        if (tapBlock) {
            self.tapLeftBlock = tapBlock;
        }
        return leftBat;
    }
    return nil;
}

- (UIBarButtonItem *) addLeftBarbuttonItemWithView:(UIView *)view {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithCustomView:view];
        self.navigationItem.leftBarButtonItem = leftBat;
        return leftBat;
    }
    return nil;
}

- (UIBarButtonItem *) addLeftBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                  TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemStyle target:self action:@selector(tapLeftBarButtonItemAction:)];
        self.navigationItem.leftBarButtonItem = leftBat;
        if (tapBlock) {
            self.tapLeftBlock = tapBlock;
        }
        return leftBat;
    }
    return nil;
}

- (UIBarButtonItem *) addLeftBarbuttonItemWithImage:(UIImage *)image
                              TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock {
    if (self.navigationController) {
        UIBarButtonItem *leftBat = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(tapLeftBarButtonItemAction:)];
        self.navigationItem.leftBarButtonItem = leftBat;
        if (tapBlock) {
            self.tapLeftBlock = tapBlock;
        }
        return leftBat;
    }
    return nil;
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

//添加navigationItem -- right ,需要重写 对应的 方法
- (UIBarButtonItem *) addRightBarbuttonItemWithTitle:(NSString *)rightTitle {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(zt_rightBarButtonAction:)];
    if (self.navigationController) {
        self.navigationItem.rightBarButtonItem = right;
        return right;
    }
    return right;
}
- (UIBarButtonItem *) addRightBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemStyle target:self action:@selector(zt_rightBarButtonAction:)];
    if (self.navigationController) {
        self.navigationItem.rightBarButtonItem = right;
    }
    return right;
}
- (NSArray <UIBarButtonItem *> *) addRightBarbuttonItemsWithTitles:(NSArray *)titles {
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0 ; i < titles.count ; i ++) {
        NSString *title =  titles[i];
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(multiRightBarButtonAction:)];
        right.tag = 100 + i;
        [tempArr addObject:right];
    }
    if (self.navigationController) {
        self.navigationItem.rightBarButtonItems = tempArr;
    }
    return tempArr;
}
- (UIBarButtonItem *) addRightBarbuttonItemWithImage:(UIImage *)image {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(zt_rightBarButtonAction:)];
    if (self.navigationController) {
        self.navigationItem.rightBarButtonItem = right;
    }
    return right;
}



//添加navigationItem -- left
- (UIBarButtonItem *) addLeftBarbuttonItemWithTitle:(NSString *)leftTitle {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:leftTitle style:UIBarButtonItemStylePlain target:self action:@selector(zt_leftBarButtonAction:)];
    if (self.navigationController) {
        self.navigationItem.leftBarButtonItem = left;
    }
    return left;
}
- (UIBarButtonItem *) addLeftBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemStyle target:self action:@selector(zt_leftBarButtonAction:)];
    if (self.navigationController) {
        self.navigationItem.leftBarButtonItem = left;
    }
    return left;
}
- (NSArray<UIBarButtonItem*> *) addLeftBarbuttonItemsWithTitles:(NSArray *)titles {
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0 ; i < titles.count ; i ++) {
        NSString *title =  titles[i];
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(multtLeftBarButtonAction:)];
        right.tag = 100 + i;
        [tempArr addObject:right];
    }
    if (self.navigationController) {
        self.navigationItem.leftBarButtonItems = tempArr;
    }
    return tempArr;
}
- (UIBarButtonItem *) addLeftBarbuttonItemWithImage:(UIImage *)image {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(zt_leftBarButtonAction:)];
    if (self.navigationController) {
        self.navigationItem.leftBarButtonItem = left;
    }
    return left;
}

- (void) multiRightBarButtonAction:(UIBarButtonItem *)item {
    NSInteger tag = item.tag - 100;
    [self zt_rightBarButtonsAction:item atIndex:tag];
}
- (void) multtLeftBarButtonAction:(UIBarButtonItem *)item {
    NSInteger tag = item.tag - 100;
    [self zt_leftBarButtonsAction:item atIndex:tag];
}


#pragma mark - Override
- (void) zt_rightBarButtonAction:(UIBarButtonItem *)sender {
    
}
- (void) zt_leftBarButtonAction:(UIBarButtonItem *)sender {
    
}


- (void) zt_rightBarButtonsAction:(UIBarButtonItem *)sender atIndex:(NSInteger)index {
    
}

- (void) zt_leftBarButtonsAction:(UIBarButtonItem *)sender atIndex:(NSInteger)index {
    
}

- (void) setPushAnimation:(BOOL)pushAnimation {
    objc_setAssociatedObject(self, @selector(setPushAnimation:), @(pushAnimation), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL) pushAnimation {
    return [objc_getAssociatedObject(self, @selector(setPushAnimation:)) boolValue];
}
@end
