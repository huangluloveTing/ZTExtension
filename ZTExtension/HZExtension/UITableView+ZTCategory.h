//
//  UITableView+ZTCategory.h
//  ZTExtension
//
//  Created by 黄露 on 2017/11/17.
//  Copyright © 2017年 huanglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZTCategory)

/**
 *  设置表格的底部视图为nil
 */
-(void) setTableViewFooterNil;

/**
 *  计算可变tableView的cell高度，前提是这个cell是由xib构成的
 *
 *  @param indexPath indexPath
 *
 *  @return 高度
 */
-(CGFloat) heightForRowAtIndexPath:(NSIndexPath *) indexPath;



/**
 *  为制定cell设定高度值，缓存使用
 *
 *  @param indexPath cell索引
 *
 *  @return 若高度大于0，则存在，若高度=0则未缓存，需要判断
 */
-(CGFloat ) cacheHeightForIndexPath:(NSIndexPath *)indexPath;

/**
 *  为指定cell设定高度值
 *
 *  @param cacheHeight    高度
 *  @param indexPath 索引
 */
-(void) setCacheHeight:(CGFloat) cacheHeight forIndexPath:(NSIndexPath *) indexPath;

/**
 *  删除所有对应cell高度值
 */
-(void) removeCacheHeights;

/**
 *  删除指定索引数组的高度,只有在reloadCell的时候移除当前reload的IndexPath,其他delete,insert等方式，都需要删除指定行之后的高度，因为这里removeCachheight是以indexPath为key的
 *
 *  @param indexPaths 索引数组
 */
-(void) removeCacheHeightsWithIndexPaths:(NSArray *)indexPaths;

/**
 *  注意：(只用于只有一个 section)当tableView增加，删除cell时，执行的删除指定行以后(包括指定行在内)的所有indexPath数组高度
 *
 *  @param indexPath 指定indexPath
 */
-(void) removeCacheHeightsWithDeleteAndInsertCell:(NSIndexPath *) indexPath;

@end
