//
//  ZYVideoDetailinfo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDetailVideoLargeImage : NSObject
@property(nonatomic,assign)int height;
@property(nonatomic,strong)NSMutableArray *url_list;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString*urlString;
@property(nonatomic,assign)int width;
@property(nonatomic,copy)NSString *uri;
@end


@interface ZYVideoDetailinfo : NSObject
@property(nonatomic,assign)int video_preloading_flag;
@property(nonatomic,assign)int direct_play;
@property(nonatomic,assign)int group_flags;
@property(nonatomic,strong)NSMutableArray *video_url;
@property(nonatomic,strong)ZYDetailVideoLargeImage *detail_video_large_image;
@property(nonatomic,copy)NSString *video_third_monitor_url;
@property(nonatomic,assign)int video_watching_count;
@property(nonatomic,copy)NSString *videoWatchingCount;
@property(nonatomic,copy)NSString *video_id;
@property(nonatomic,assign)int video_watch_count;
@property(nonatomic,copy)NSString *videoWatchCount;
@property(nonatomic,assign)int video_type;
@property(nonatomic,assign)int show_pgc_subscribe;
@end
