//
//  ZYHuoshanViewModel.h
//  TodayNew
//
//  Created by liqiaona on 2018/6/27.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYNetwortTool.h"
@interface ZYHuoshanViewModel : NSObject
@property(nonatomic,strong)NSMutableArray *news;
@property(nonatomic,assign)NSTimeInterval maxBehotTime;//刷新时间
+(instancetype)shareHomeViewModel;
/**
 获取标题数据
 */
-(void)requestNavTitle:(void(^)(id array))block;
/**
 获取视频、小视频的新闻列表数据
 */
-(void)loadHuoshanApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(success)success failure:(faile)failure;
@end
