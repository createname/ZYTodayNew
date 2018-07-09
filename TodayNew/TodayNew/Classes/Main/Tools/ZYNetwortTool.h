//
//  ZYNetwortTool.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYHomeNewTitle.h"

typedef void(^success)(id msg);
typedef void(^loadSuccess)(NSTimeInterval time,id msg);
typedef void(^faile)(void);
typedef void(^block)();
@interface ZYNetwortTool : NSObject

+(instancetype)request;
/**
 首页顶部新闻标题数据
 */
-(void)loadHomeNewsTitleData:(success)success failure:(faile)failure;

/**
 点击首页加号按钮，获取频道推荐数据
 */
-(void)loadHomeCategoryRecommend:(success)success failure:(faile)failure;
/**
 首页顶部导航栏搜索推荐标题内容
 */
-(void)loadHomeSearchSuggestInfo:(success)success failure:(faile)failure;
/**
 获取首页列表、视频、小视频的新闻列表数据
 */
-(void)loadApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(loadSuccess)success failure:(faile)failure;
/**
 获取首页、视频、小视频的新闻列表数据,加载更多
 */
-(void)loadMoreApiNewsFeeds:(NSString *)category listCount:(int)listCount maxBehotTime:(NSTimeInterval)maxBehotTime success:(loadSuccess)success failure:(faile)failure;


/**
 视频顶部新闻标题的数据
 */
-(void)loadVideoApiCategoies:(success)success failure:(faile)failure;
/**
 解析头条视频真实播放地址
 */
-(void)parseVideoRealURL:(NSString *)video_id success:(success)success failure:(faile)failure;
/**
 取消关注
 */
-(void)loadRelationUnfollow:(NSInteger)userId  success:(success)success failure:(faile)failure;
/**
 点击关注
 */
-(void)loadRelationFollow:(NSInteger)userId  success:(success)success failure:(faile)failure;


/**
 火山视频顶部标题的数据
 */
-(void)loadHuoshanApiCategoies:(success)success failure:(faile)failure;
/**
 获取视频、小视频的新闻列表数据
 */
-(void)loadHUoshanApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(loadSuccess)success failure:(faile)failure;
@end
