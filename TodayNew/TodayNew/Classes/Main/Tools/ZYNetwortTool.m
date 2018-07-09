//
//  ZYNetwortTool.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYNetwortTool.h"
#import <AFNetworking.h>
#import "NSData+CRC32.h"

#define deviceId 41312231473 //41312231473  6096495334
#define iId 17769976909 //  17769976909   5034850950
@implementation ZYNetwortTool
+(instancetype)request{
    static  ZYNetwortTool *tool=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool==nil) {
            tool = [[self alloc]init];
        }
    });
    return tool;
}
-(AFHTTPSessionManager *)manager{
    static  AFHTTPSessionManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager==nil) {
            
            manager = [AFHTTPSessionManager manager];
            NSSet *typeSet=[NSSet setWithObjects:@"application/json",
                            @"text/json",
                            @"text/javascript",
                            @"text/html",
                            @"text/css",
                            @"text/plain",
                            @"charset/UTF-8",nil];
            manager.responseSerializer.acceptableContentTypes = typeSet;
            manager.requestSerializer.timeoutInterval = 15;
        }
    });
    
    return manager;
}
#pragma mark- ---------------------------首页数据-----------------------------

/**
 首页顶部新闻标题数据
 */
-(void)loadHomeNewsTitleData:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/article/category/get_subscribed/v1/?",BASE_URL];
    [self request:url parame:@{@"device_id":@(deviceId),@"iid":@(iId)} success:^(id msg) {
        if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
            
            success(msg);
            
        }else{
            
            failure();
        }

    } failure:^{
        failure();
    } method:0];
}

/**
 点击首页加号按钮，获取频道推荐数据
 */
-(void)loadHomeCategoryRecommend:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/article/category/get_extra/v1/?",BASE_URL];
    [self request:url parame:@{@"device_id":@(deviceId),@"iid":@(iId)} success:^(id msg) {
        success(msg);
    } failure:^{
        failure();
    } method:0];
}

/**
 首页顶部导航栏搜索推荐标题内容
 */
-(void)loadHomeSearchSuggestInfo:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/search/suggest/homepage_suggest/?",BASE_URL];
    [self request:url parame:@{@"device_id":@(deviceId),@"iid":@(iId)} success:^(id msg) {
        success(msg);
    } failure:^{
        failure();
    } method:0];
}

/**
 获取首页列表、视频、小视频的新闻列表数据
 */
-(void)loadApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(loadSuccess)success failure:(faile)failure{
    
    NSTimeInterval pullTime = [[NSDate date] timeIntervalSince1970];
    NSString *url = [NSString stringWithFormat:@"%@/api/news/feed/v54/?",BASE_URL];
    NSDictionary *parame = @{@"device_id":@(deviceId),@"count": @(15),@"list_count": @(15),
                             @"category": category,
                             @"min_behot_time": @(pullTime),
                             @"strict": @(0),
                             @"detail": @(1),
                             @"refresh_reason": @(1),
                             @"tt_from": ttfrom,@"iid":@(iId)};
    if ([category isEqualToString:@"weitoutiao"]) {
        [self request:url parame:parame success:^(id msg) {
            
            
            if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
                
                success(pullTime, [msg objectForKey:@"data"]);
                
            }else{
                failure();
            }
        } failure:^{
            failure();
        } method:1];
    }else{
        [self request:url parame:[self convertToJsonData:parame] success:^(id msg) {
            
            if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
                
                success(pullTime, [msg objectForKey:@"data"]);
                
            }else{
                failure();
            }
        } failure:^{
            failure();
        } method:1];
    }
    
}

/**
 获取首页、视频、小视频的新闻列表数据,加载更多
 */
-(void)loadMoreApiNewsFeeds:(NSString *)category listCount:(int)listCount maxBehotTime:(NSTimeInterval)maxBehotTime success:(loadSuccess)success failure:(faile)failure{
  
    NSString *url = [NSString stringWithFormat:@"%@/api/news/feed/v54/?",BASE_URL];
    NSDictionary *parame = @{@"device_id":@(deviceId),
                             @"count": @(20),
                             @"list_count": @(15),
                             @"category": category,
                             @"list_count":@(listCount),
                             @"min_behot_time": @(maxBehotTime),
                             @"strict": @(0),
                             @"detail": @(1),
                             @"refresh_reason": @(1),
                             @"tt_from": @"load_more",
                             @"iid":@(iId)};
    
    [self request:url parame:[category isEqualToString:@"weitoutiao"]?parame:[self convertToJsonData:parame] success:^(id msg) {
                                   if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
                                       success(maxBehotTime, [msg objectForKey:@"data"]);
                                       
                                   }else{
                                       failure();
                                   }
                               } failure:^{
                                   failure();
                               } method:0];
}

#pragma mark- --------------------------------------Video-----------------------------------------

/**
 视频顶部新闻标题的数据
 */
-(void)loadVideoApiCategoies:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/video_api/get_category/v1/?",BASE_URL];
    NSDictionary *parame = @{@"device_id": @(deviceId),
                             @"iid":@(iId)};
    [self request:url parame:parame success:^(id msg) {
        if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
            success([msg objectForKey:@"data"]);
            
        }else{
            failure();
        }
    } failure:^{
        failure();
    } method:0];
}
/**
 解析头条视频真实播放地址
 */
-(void)parseVideoRealURL:(NSString *)video_id success:(success)success failure:(faile)failure{
    NSInteger r = arc4random();
    NSString *url = [NSString stringWithFormat:@"/video/urls/v/1/toutiao/mp4/%@?r=%ld",video_id,r];
    NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding];
    UInt64 crc32 = (UInt64)[data getCRC32];
    
    if (crc32 < 0.0) {
        crc32 += 0x100000000;
    }
    NSString *realURL = [NSString stringWithFormat:@"http://i.snssdk.com/video/urls/v/1/toutiao/mp4/%@?r=%ld&s=%llu",video_id,r,crc32];
    [self request:realURL parame:nil success:^(id msg) {
        success([msg objectForKey:@"data"]);

    } failure:^{
        
    } method:0];
}

/**
 取消关注
 */
-(void)loadRelationUnfollow:(NSInteger)userId  success:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/2/relation/unfollow/?",BASE_URL];
    NSDictionary *parame = @{@"user_id":@(userId),
                             @"device_id": @(deviceId),
                             @"iid":@(iId)};
    [self request:url parame:parame success:^(id msg) {
        if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
            success([[msg objectForKey:@"data"] objectForKey:@"user"]);
            
        }else{
            failure();
        }
    } failure:^{
        failure();
    } method:0];
}

/**
 点击关注
 */
-(void)loadRelationFollow:(NSInteger)userId  success:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/2/relation/follow/v2/?",BASE_URL];
    NSDictionary *parame = @{@"user_id":@(userId),
                             @"device_id": @(deviceId),
                             @"iid":@(iId)};
    [self request:url parame:parame success:^(id msg) {
        if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
            success([[msg objectForKey:@"data"] objectForKey:@"user"]);
        }else{
            failure();
        }
    } failure:^{
        failure();
    } method:0];
}
#pragma mark- --------------------------------------火山小视频-----------------------------------------
/**
 火山视频顶部标题的数据
 */
-(void)loadHuoshanApiCategoies:(success)success failure:(faile)failure{
    NSString *url = [NSString stringWithFormat:@"%@/category/get_ugc_video/1/?",BASE_URL];
    NSDictionary *parame = @{@"device_id": @(deviceId),
                             @"iid":@(iId)};
    [self request:url parame:parame success:^(id msg) {
        if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
            success([msg objectForKey:@"data"]);
            
        }else{
            failure();
        }
    } failure:^{
        failure();
    } method:0];
}
/**
 获取视频、小视频的新闻列表数据
 */
-(void)loadHUoshanApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(loadSuccess)success failure:(faile)failure{
    
    NSTimeInterval pullTime = [[NSDate date] timeIntervalSince1970];
    NSString *url = [NSString stringWithFormat:@"%@/api/news/feed/v75/?",BASE_URL];
    NSDictionary *parame = @{@"device_id":@(deviceId),@"count": @(20),@"list_count": @(15),
                             @"category": category,
                             @"min_behot_time": @(pullTime),
                             @"strict": @(0),
                             @"detail": @(1),
                             @"refresh_reason": @(1),
                             @"tt_from": ttfrom,@"iid":@(iId)};
    
    [self request:url parame:parame success:^(id msg) {
        
        if ([[msg objectForKey:@"message"] isEqualToString:@"success"]) {
            
            success(pullTime, [msg objectForKey:@"data"]);
            
        }else{
            failure();
        }
    } failure:^{
        failure();
    } method:1];
    
}

-(void)request:(NSString *)url parame:(id)parame success:(success)success failure:(faile)faile method:(int)method{
     AFHTTPSessionManager *manager = [self manager];
    if (method == 0) {//get
        [manager GET:url parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile();
            ZYLog(@"error=======:%@",error);
        }];
    }else{
        [manager POST:url parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success([self replaceCharacterSet:responseObject]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            faile();
            ZYLog(@"error=======:%@",error);
        }];
    }
}
// 字典转json字符串方法

-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    NSString *jsonString;
    
    jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
    
}
-(NSDictionary *)replaceCharacterSet:(id)response{


    
    NSData *data = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonStr = [jsonStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符使用
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dicStr = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil
                            ];
    return dicStr;
}
@end
