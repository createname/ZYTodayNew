//
//  ZYDongtaiCollectionView.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/22.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYThumbImage,ZYLargeImage;

@interface ZYDongtaiCollectionView : UICollectionView
@property(nonatomic,copy)void(^didSelect)(NSInteger row);

@property(nonatomic,strong)NSMutableArray<ZYThumbImage *> *thumImages;
@property(nonatomic,strong)NSMutableArray<ZYLargeImage *> *largeImages;

/**
 是否发布了小视频
 */
@property(nonatomic,assign)BOOL isPostSmallVideo;

/**
 是否是动态详情
 */
@property(nonatomic,assign)BOOL isDongtaiDetail;

/**
 微头条
 */
@property(nonatomic,assign)BOOL isWeitoutiao;
@end
