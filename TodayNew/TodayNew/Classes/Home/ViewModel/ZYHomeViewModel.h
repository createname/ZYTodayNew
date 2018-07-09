//
//  ZYHomeViewModel.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYNetwortTool.h"
#import "ZYVideoModel.h"
#import "ZYNewsModel.h"

typedef enum category{
    hot = 0,
    local,
    video,
    society,
    photos,
    entertainment,
    newsTech,
    car,
    finance,
    military,
    sports,
    essayJoke,
    imagePPMM,
    imageFunny,
    imageWonderful,
    world,
    funny,
    health,
    jinritemai,
    house,
    fashion,
    history,
    baby,
    digital,
    essaySaying,
    astrology,
    rumor,
    positive,
    comic,
    story,
    collect,
    boutique,
    pregnancy,
    culture,
    game,
    stock,
    science,
    pet,
    emotion,
    home,
    education,
    agriculture,
    food,
    regimen,
    movie,
    cellphone,
    travel,
    questionAndAnswer,
    novelChannel,
    live_talk,
    chinaSinger,
    hotsoon,
    highCourt,
    happyBoy,
    media,
    millionHero,
    lottery,
    chinaAct,
    springFestival,
    weitoutiao,
    hotsoonVideo,
    ugcVideoBeauty,
    ugcVideoCasual,
    ugcVideoFood,
    ugcVideoLife,
    
}TitleCategory;

@interface ZYHomeViewModel : NSObject

@property(nonatomic,strong)NSMutableArray *news;//新闻数据
@property(nonatomic,strong)ZYHomeNewTitle *newsTitle;//新闻标题
@property(nonatomic,assign)NSTimeInterval maxBehotTime;//刷新时间
@property(nonatomic,strong)ZYRealVideo *realVideo;//真实视频数据

@property(nonatomic,strong)NSMutableArray *categories;

+(instancetype)shareHomeViewModel;
/**
 首页顶部新闻标题数据
 */
-(void)requestHomeNewsTitle:(void(^)(id array))block;
/**
 获取首页频道数据
 */
-(void)loadHomeCategoryRecommend:(block)block;
/**
 获取首页列表、视频、小视频的新闻列表数据
 */
-(void)loadApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(success)success failure:(faile)failure;
/**
 获取首页、视频、小视频的新闻列表数据,加载更多
 */
-(void)loadMoreApiNewsFeeds:(NSString *)category success:(success)success failure:(faile)failure;
/**
 解析视频的播放地址
 */
-(void)parseVideoRealURL:(NSString *)video_id success:(success)success;
/**
 取消关注
 */
-(void)loadRelationUnfollow:(NSInteger)userId success:(success)success;
/**
 点击关注
 */
-(void)loadRelationFollow:(NSInteger)userId  success:(success)success;
@end
