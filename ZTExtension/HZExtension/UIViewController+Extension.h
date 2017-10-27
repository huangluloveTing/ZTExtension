//
//  UIViewController+Extension.h
//  demo
//
//  Created by 黄露 on 2017/10/21.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnBlock)(id returnObject);
typedef void(^TapRightBarButtonItemEventBlock)(UIBarButtonItem *barButtonItem);
typedef void(^TapRightBarButtonItemsEventBlock)(UIBarButtonItem *barButtonItem , NSInteger index);

typedef void(^TapLeftBarButtonItemEventBlock)(UIBarButtonItem *barButtonItem);
typedef void(^TapLeftBarButtonItemsEventBlock)(UIBarButtonItem *barButtonItem , NSInteger index);


@interface UIViewController (Extension)

@property (nonatomic ,copy) ReturnBlock returnBlock;

@property (nonatomic , copy) TapRightBarButtonItemEventBlock tapRightBlock;
@property (nonatomic , copy) TapRightBarButtonItemsEventBlock tapRightItemsBlock;

@property (nonatomic , copy) TapLeftBarButtonItemEventBlock tapLeftBlock;
@property (nonatomic , copy) TapLeftBarButtonItemsEventBlock tapLeftItemsBlock;


//present
- (void) presentToVC:(UIViewController *)vc Animation:(BOOL)animation Return:(ReturnBlock)returnBlock;

// push
- (void) pushWhenPushedHiddenBottomTabbarToVC:(UIViewController *)vc Animation:(BOOL)animation;

//pop
- (void) popViewControllerAnimation:(BOOL)animation;

- (void) popViewControllerAtIndex:(NSInteger)index Animation:(BOOL)animation;

- (void) popToRootViewControllerAnimation:(BOOL)animation;

//添加navigationItem -- right
- (void) addRightBarbuttonItemWithTitle:(NSString *)rightTitle
                               TapBlock:(TapRightBarButtonItemEventBlock)tapBlock;
- (void) addRightBarbuttonItemWithView:(UIView *)view;
- (void) addRightBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                   TapBlock:(TapRightBarButtonItemEventBlock)tapBlock;
- (void) addRightBarbuttonItemsWithTitles:(NSArray *)titles
                                 TapBlock:(TapRightBarButtonItemsEventBlock)tapBlock;

//添加navigationItem -- left
- (void) addLeftBarbuttonItemWithTitle:(NSString *)rightTitle
                              TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock;
- (void) addLeftBarbuttonItemWithView:(UIView *)view ;
- (void) addLeftBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                  TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock;
- (void) addLeftBarbuttonItemsWithTitles:(NSArray *)titles
                                 TapBlock:(TapRightBarButtonItemsEventBlock)tapBlock;
@end
