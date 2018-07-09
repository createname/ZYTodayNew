//
//  ZYHomeViewModel.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeViewModel.h"
#import "ZYHomeNewTitle.h"
#import <MJExtension.h>
#import "ZYNewsModel.h"
#import "ZYImageList.h"


@interface ZYHomeViewModel()
@property(nonatomic,strong)ZYNetwortTool *networtTool;
@end

@implementation ZYHomeViewModel
-(NSMutableArray *)news{
    if (!_news) {
        _news = [[NSMutableArray alloc]init];
    }
    return _news;
}
-(ZYNetwortTool *)networtTool{
    if (!_networtTool) {
        _networtTool = [ZYNetwortTool request];
    }
    return _networtTool;
}

+(instancetype)shareHomeViewModel{
    static ZYHomeViewModel *viewModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewModel = [[ZYHomeViewModel alloc]init];
    });
    return viewModel;
}

/**
 获取首页顶部标题
 */
-(void)requestHomeNewsTitle:(void(^)(id array))block{
   
    [self.networtTool loadHomeNewsTitleData:^(id msg) {
       NSArray *array = [ZYHomeNewTitle mj_objectArrayWithKeyValuesArray:[[msg objectForKey:@"data"]objectForKey:@"data"]];
        
        int type = 0;
        
        for (ZYHomeNewTitle *model in array) {
            model.flags = type;
            type++;
        }
        block(array);
        
    }failure:^{
        
    }];
}

/**
 获取首页频道数据
 */
-(void)loadHomeCategoryRecommend:(block)block{
    
    [self.networtTool loadHomeCategoryRecommend:^(id msg) {
        self.categories = [ZYHomeNewTitle mj_objectArrayWithKeyValuesArray:[[msg objectForKey:@"data"]objectForKey:@"data"]];
        
        int type = 0;
        
        for (ZYHomeNewTitle *model in self.categories) {
            model.flags = type;
            type++;
        }
        block();
        
    }failure:^{
        
    }];
}


/**
 获取首页列表、视频、小视频的新闻列表数据
 */
-(void)loadApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(success)success failure:(faile)failure{
    ZYWeakSelf(self);
//    NSLog(@"category==========:%@",category);
    [self.news removeAllObjects];
    [self.networtTool loadApiNewsFeeds:category tt_from:ttfrom success:^(NSTimeInterval time, id msg) {
       
        for (NSDictionary *dic in msg) {
            
            ZYNewsModel *model = [ZYNewsModel mj_objectWithKeyValues:[dic objectForKey:@"content"]];
            
            [weakself.news addObject:model];

        }
        weakself.maxBehotTime = time;
        success(nil);
    } failure:^{
        failure();
    }];
}
/**
 获取首页、视频、小视频的新闻列表数据,加载更多
 */
-(void)loadMoreApiNewsFeeds:(NSString *)category success:(success)success failure:(faile)failure{
    [self.networtTool loadMoreApiNewsFeeds:category listCount:(int)self.news.count maxBehotTime:self.maxBehotTime success:^(NSTimeInterval time, id msg) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dic in msg) {
            ZYNewsModel *model = [ZYNewsModel mj_objectWithKeyValues:[dic objectForKey:@"content"]];
            [array addObject:model];
            
        }
        [self.news addObjectsFromArray:array];
        success(nil);
    } failure:^{
        failure();
    }];
}

/**
 解析视频的播放地址
 */
-(void)parseVideoRealURL:(NSString *)video_id success:(success)success{
    [self.networtTool parseVideoRealURL:video_id success:^(id msg) {
//        ZYLog(@"video====:%@",msg);
        self.realVideo = [ZYRealVideo mj_objectWithKeyValues:msg];
        success(nil);
    } failure:^{
        
    }];
}

/**
 取消关注
 */
-(void)loadRelationUnfollow:(NSInteger)userId success:(success)success{
    [self.networtTool loadRelationUnfollow:userId success:^(id msg) {
         success(msg);
    } failure:^{
        
    }];
}

/**
 点击关注
 */
-(void)loadRelationFollow:(NSInteger)userId  success:(success)success{
    [self.networtTool loadRelationFollow:userId success:^(id msg) {
        success(msg);
    } failure:^{
        
    }];
}
@end
