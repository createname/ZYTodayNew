//
//  ZYVideo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDownloadAddr : NSObject
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,strong)NSMutableArray *url_list;
@end

@interface ZYPlayAddr : NSObject
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,strong)NSMutableArray *url_list;
@end

@interface ZYOriginCover : NSObject
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,strong)NSMutableArray *url_list;
@end

@interface ZYVideo : NSObject
@property(nonatomic,copy)NSArray *logo_name;
@property(nonatomic,copy)NSString *coded_format;
@property(nonatomic,assign)int vwidth;
@property(nonatomic,assign)int socket_buffer;
@property(nonatomic,assign)int preload_interval;
@property(nonatomic,assign)int preload_size;
@property(nonatomic,assign)int preload_min_step;
@property(nonatomic,assign)int bitrate;
@property(nonatomic,assign)int size;
@property(nonatomic,copy)NSString *main_url;
@property(nonatomic,copy)NSString *mainURL;
@property(nonatomic,assign)int user_video_proxy;
@property(nonatomic,copy)NSString *backup_url_1;
@property(nonatomic,assign)int preload_max_step;
@property(nonatomic,copy)NSString *definition;
@property(nonatomic,assign)int vheight;
@property(nonatomic,copy)NSString *vtype;
@property(nonatomic,assign)int height;
@property(nonatomic,strong)ZYDownloadAddr *download_addr;
@property(nonatomic,strong)ZYPlayAddr *play_addr;
@property(nonatomic,strong)ZYOriginCover *origin_cover;
@property(nonatomic,assign)int width;
@property(nonatomic,assign)float duration;
@property(nonatomic,copy)NSString *video_id;
@property(nonatomic,copy)NSString *ratio;
@end
