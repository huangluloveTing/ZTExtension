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

@property (nonatomic , assign) BOOL pushAnimation;//push 是否带动画

@property (nonatomic ,copy) ReturnBlock returnBlock;

@property (nonatomic , copy) TapRightBarButtonItemEventBlock tapRightBlock;
@property (nonatomic , copy) TapRightBarButtonItemsEventBlock tapRightItemsBlock;

@property (nonatomic , copy) TapLeftBarButtonItemEventBlock tapLeftBlock;
@property (nonatomic , copy) TapLeftBarButtonItemsEventBlock tapLeftItemsBlock;


//present
- (void) presentToVC:(UIViewController *)vc Animation:(BOOL)animation Return:(ReturnBlock)returnBlock;

// push
- (void) pushWhenPushedHiddenBottomTabbarToVC:(UIViewController *)vc Animation:(BOOL)animation;
//push 一个新的控制器，关闭当前控制器
- (void) pushWhenPushedHiddenBottomTabbarAndDestoryCurrentToVC:(UIViewController *)vc Animation:(BOOL)animation;

//pop
- (void) popViewControllerAnimation:(BOOL)animation;
- (void) popViewControllerLikePush; //pop 按照 push 方式， 有动画push ， pop 也有动画，没有则都没有
- (void) popViewControllerAtIndex:(NSInteger)index Animation:(BOOL)animation;
- (void) popToRootViewControllerAnimation:(BOOL)animation;
- (void) popViewControllerCurrentBeforeIndes:(NSInteger)index animation:(BOOL)animation;

//添加navigationItem -- right
- (UIBarButtonItem *) addRightBarbuttonItemWithTitle:(NSString *)rightTitle
                               TapBlock:(TapRightBarButtonItemEventBlock)tapBlock;
- (UIBarButtonItem *) addRightBarbuttonItemWithView:(UIView *)view;
- (UIBarButtonItem *) addRightBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                   TapBlock:(TapRightBarButtonItemEventBlock)tapBlock;
- (NSArray <UIBarButtonItem *> *) addRightBarbuttonItemsWithTitles:(NSArray *)titles
                                 TapBlock:(TapRightBarButtonItemsEventBlock)tapBlock;
- (UIBarButtonItem *) addRightBarbuttonItemWithImage:(UIImage *)image
                                 TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock;



//添加navigationItem -- left
- (UIBarButtonItem *) addLeftBarbuttonItemWithTitle:(NSString *)rightTitle
                              TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock;
- (UIBarButtonItem *) addLeftBarbuttonItemWithView:(UIView *)view ;
- (UIBarButtonItem *) addLeftBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle
                                  TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock;
- (NSArray <UIBarButtonItem *> *) addLeftBarbuttonItemsWithTitles:(NSArray *)titles
                                 TapBlock:(TapLeftBarButtonItemsEventBlock)tapBlock;
- (UIBarButtonItem *) addLeftBarbuttonItemWithImage:(UIImage *)image
                                TapBlock:(TapLeftBarButtonItemEventBlock)tapBlock;

//添加navigationItem -- right ,需要重写 对应的 方法
- (UIBarButtonItem *) addRightBarbuttonItemWithTitle:(NSString *)rightTitle;
- (UIBarButtonItem *) addRightBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle;
- (UIBarButtonItem *) addRightBarbuttonItemsWithTitles:(NSArray *)titles;
- (UIBarButtonItem *) addRightBarbuttonItemWithImage:(UIImage *)image;



//添加navigationItem -- left
- (UIBarButtonItem *) addLeftBarbuttonItemWithTitle:(NSString *)leftTitle;
- (UIBarButtonItem *) addLeftBarbuttonItemWithBarSystem:(UIBarButtonSystemItem)systemStyle;
- (UIBarButtonItem *) addLeftBarbuttonItemsWithTitles:(NSArray *)titles;
- (UIBarButtonItem *) addLeftBarbuttonItemWithImage:(UIImage *)image;

#pragma mark - Override
- (void) zt_rightBarButtonAction:(UIBarButtonItem *)sender;
- (void) zt_leftBarButtonAction:(UIBarButtonItem *)sender;
- (void) zt_rightBarButtonsAction:(UIBarButtonItem *)sender atIndex:(NSInteger)index;
- (void) zt_leftBarButtonsAction:(UIBarButtonItem *)sender atIndex:(NSInteger)index;
@end
