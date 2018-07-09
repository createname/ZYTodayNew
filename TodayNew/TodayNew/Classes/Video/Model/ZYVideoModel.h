//
//  ZYVideoModel.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/17.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYNewsModel.h"
#import "ZYVideo.h"
#import "ZYThumbImage.h"

@interface ZYDwonloadAddr: NSObject
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,strong)NSMutableArray *url_list;
@end


@interface ZYAppImage: NSObject
@property(nonatomic,strong)NSMutableArray *url_list;
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,assign)NSInteger width;
@end

@interface ZYFilterWord: NSObject
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)BOOL is_selected;
@end

@interface ZYMixed: NSObject
@property(nonatomic,assign)NSInteger *display_subtype;
@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,copy)NSString *log_extra;
@property(nonatomic,assign)NSInteger show_dislike;
@property(nonatomic,assign)NSInteger image_height;
@property(nonatomic,copy)NSString *track_url;
@property(nonatomic,strong)NSMutableArray *track_url_list;
@property(nonatomic,copy)NSString *web_title;
@property(nonatomic,copy)NSString *button_text;
@property(nonatomic,assign)NSInteger image_width;
@property(nonatomic,assign)NSInteger is_tongtou_ad;
@property(nonatomic,copy)NSString *open_url;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,strong)ZYThumbImage *image_list;
@property(nonatomic,copy)NSString *source_name;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *web_url;
@property(nonatomic,strong)NSMutableArray *filter_words;
@end

@interface ZYApp: NSObject
@property(nonatomic,copy)NSString *log_extra;
@property(nonatomic,copy)NSString *open_url;
@property(nonatomic,copy)NSString *os_type;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *app_name;
@property(nonatomic,copy)NSString *button_text;
@property(nonatomic,assign)NSInteger image_mode;
@property(nonatomic,copy)NSString *appleid;
@property(nonatomic,strong)NSMutableArray *click_track_url_list;
@property(nonatomic,strong)NSMutableArray *track_url_list;
@property(nonatomic,copy)NSString *click_track_url;
@property(nonatomic,copy)NSString *track_url;
@property(nonatomic,copy)NSString *download_url;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)int Id;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,copy)NSString *app_size;
@property(nonatomic,strong)NSMutableArray *filter_words;
@property(nonatomic,assign)NSInteger show_dislike;
@property(nonatomic,copy)NSString *download_count;
@property(nonatomic,assign)NSInteger rate;
@property(nonatomic,assign)NSInteger ad_id;
@property(nonatomic,copy)NSString *app_icon;
@property(nonatomic,assign)NSInteger display_subtype;
@property(nonatomic,copy)NSString *descriptions;
@property(nonatomic,strong)ZYAppImage *image;
@end

@interface ZYAD: NSObject
@property(nonatomic,strong)ZYMixed *mixed;
@property(nonatomic,assign)BOOL is_preview;
@property(nonatomic,strong)ZYApp *app;

@end

@interface ZYMedia: NSObject
@property(nonatomic,copy)NSString *pgc_custom_menu;
@property(nonatomic,copy)NSString *user_auth_info;
@property(nonatomic,assign)BOOL user_verified;
@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,assign)BOOL can_be_praised;
@property(nonatomic,copy)NSString *description;
@property(nonatomic,copy)NSString *user_decoration;
@property(nonatomic,copy)NSString *avatar_url;
@property(nonatomic,copy)NSString *name;
@end

@interface ZYH5Extra: NSObject

@property(nonatomic,assign)BOOL is_subscribed;
@property(nonatomic,assign)NSInteger have_red_pack;
@property(nonatomic,assign)BOOL is_original;
@property(nonatomic,strong)ZYMedia *media;
@end

@interface ZYVideoDetail: NSObject
@property(nonatomic,strong)NSMutableArray *related_video_toutiao;
@property(nonatomic,copy)NSString *context;
@property(nonatomic,assign)NSInteger user_bury;
@property(nonatomic,strong)ZYLogPB *log_pb;
@property(nonatomic,strong)NSMutableArray *ordered_info;
@property(nonatomic,assign)NSInteger bury_count;
@property(nonatomic,copy)NSString *buryCount;
@property(nonatomic,assign)NSInteger ignore_web_transform;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)ZYAD *ad;
@property(nonatomic,strong)NSMutableArray *labels;
@property(nonatomic,assign)NSInteger like_count;
@property(nonatomic,assign)NSInteger ban_digg;
@property(nonatomic,strong)NSMutableArray *filter_words;
@property(nonatomic,assign)NSInteger danmaku_count;
@property(nonatomic,assign)NSInteger info_flag;
@property(nonatomic,strong)ZYH5Extra *h5_extra;
@property(nonatomic,copy)NSString *script;
@property(nonatomic,assign)NSInteger ug_install_aid;
@property(nonatomic,assign)NSInteger user_digg;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,strong)NSMutableArray *related_wenda;
@property(nonatomic,assign)NSInteger ban_bury;
@property(nonatomic,assign)NSInteger comment_count;
@property(nonatomic,assign)NSInteger digg_count;
@property(nonatomic,assign)NSInteger group_flags;
@property(nonatomic,assign)BOOL is_wenda;
@property(nonatomic,strong)ZYNewsUserInfo *user_info;

@property(nonatomic,assign)NSInteger user_repin;
@property(nonatomic,copy)NSString *like_desc;
@property(nonatomic,assign)BOOL ban_danmaku;
@property(nonatomic,assign)NSInteger group_id;
@property(nonatomic,assign)NSInteger detail_show_flags;
@property(nonatomic,copy)NSString *display_url;
@property(nonatomic,strong)ZYMediaInfo *media_info;
@property(nonatomic,assign)NSInteger user_like;
@property(nonatomic,assign)NSInteger read_count;
@property(nonatomic,copy)NSString *share_url;
@property(nonatomic,copy)NSString *video_label_html;
@property(nonatomic,assign)NSInteger video_watch_count;
@property(nonatomic,assign)NSInteger repin_count;
@property(nonatomic,assign)NSInteger ban_comment;
@property(nonatomic,assign)NSInteger related_video_section;
@end

@interface ZYVideoModel : NSObject
@property(nonatomic,copy)NSString *logo_name;
@property(nonatomic,copy)NSString *coded_format;
@property(nonatomic,assign)int vwidth;
@property(nonatomic,assign)NSInteger socket_buffer;
@property(nonatomic,assign)NSInteger preload_interval;
@property(nonatomic,assign)NSInteger preload_size;
@property(nonatomic,assign)NSInteger preload_min_step;
@property(nonatomic,assign)NSInteger bitrate;
@property(nonatomic,assign)NSInteger size;
@property(nonatomic,copy)NSString *main_url;
@property(nonatomic,copy)NSString *mainURL;

@property(nonatomic,assign)NSInteger user_video_proxy;
@property(nonatomic,copy)NSString *backup_url_1;
@property(nonatomic,assign)NSInteger preload_max_step;
@property(nonatomic,copy)NSString *definition;
@property(nonatomic,assign)NSInteger vheight;
@property(nonatomic,assign)NSInteger vtype;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,strong)ZYDwonloadAddr *download_addr;
@property(nonatomic,strong)ZYPlayAddr *play_addr;
@property(nonatomic,strong)ZYOriginCover *origin_cover;
@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)float duration;
@property(nonatomic,copy)NSString *video_id;
@property(nonatomic,copy)NSString *ratio;
@end
