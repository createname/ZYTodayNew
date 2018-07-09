//
//  ZYCalculateTool.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/21.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYCalculateTool : NSObject
/**
 计算高度
 */
+(float)collectionViewHeight:(int)count;
/**
 计算宽度
 */
+(CGFloat)collectionViewWidth:(NSInteger)count;
/**
 计算collectionviewcell的大小
 */
+(CGSize)collectionViewCellSize:(NSInteger)count;
/**
 计算详情里collectionviewcell的大小
 */
+(CGSize)detailCollectionViewCellSize:(NSMutableArray *)thumbImages;
@end
