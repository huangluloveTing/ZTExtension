//
//  UIResponder+ZTRouter.h
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (ZTRouter)

/**
 *  发送一个路由器消息, 对eventName感兴趣的 UIResponsder 可以对消息进行处理
 *
 *  @param eventName 发生的事件名称
 *  @param dataInfo  传递消息时, 携带的数据, 数据传递过程中, 会有新的数据添加
 *
 */
- (void)routerEventWithName:(NSString *)eventName dataInfo:(NSDictionary *)dataInfo;

+(id) currentFirstResponder;

-(void) findFirstResponder:(id) sender;


@end
