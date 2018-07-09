//
//  ZYNewsModel.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MJExtension.h>
#import "ZYEmojiManager.h"
#import "ZYMediaInfo.h"
#import "ZYNewsUserInfo.h"
#import "ZYLogPB.h"
#import "ZYForwardInfo.h"
#import "ZYMiddleImage.h"
#import "ZYVideoPlayInfo.h"
#import "ZYVideoDetailinfo.h"
#import "ZYSmallVideo.h"
#import "ZYLargeImage.h"
#import "ZYADButton.h"
#import "ZYRealVideo.h"
#import "ZYDongtaiPosition.h"



@interface ZYRepostParam : NSObject
@property(nonatomic,assign)int opt_id;
@property(nonatomic,copy)NSString *schema;
@property(nonatomic,assign)int repost_type;
@property(nonatomic,copy)NSString *fw_id_str;
@property(nonatomic,copy)NSString *opt_id_str;
@property(nonatomic,assign)int opt_id_type;
@property(nonatomic,assign)int fw_id_type;
@property(nonatomic,assign)int fw_user_id;
@property(nonatomic,assign)int fw_id;
@property(nonatomic,copy)NSString *cover_url;
@property(nonatomic,copy)NSString *title;
@end

@interface ZYNewsModel : NSObject
@property(nonatomic,copy)NSString *show_more;
@property(nonatomic,strong)ZYEmojiManager *emojiManager;
@property(nonatomic,assign)float ppmmCellHieght;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,strong)NSMutableAttributedString *attributeConten;
@property(nonatomic,assign)float contentH;
@property(nonatomic,assign)int item_id;
@property(nonatomic,assign)int cell_flag;
@property(nonatomic,assign)int behot_time;
@property(nonatomic,assign)int tip;
@property(nonatomic,assign)NSTimeInterval publish_time;
@property(nonatomic,copy)NSString *publishTime;
@property(nonatomic,assign)NSTimeInterval create_time;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,assign)int source_icon_style;
@property(nonatomic,assign)int tag_id;
@property(nonatomic,strong)ZYMediaInfo *media_info;
@property(nonatomic,strong)ZYNewsUserInfo *user_info;
@property(nonatomic,strong)ZYNewsUserInfo *user;
@property(nonatomic,assign)int preload_web;
@property(nonatomic,assign)int cell_layout_style;
@property(nonatomic,assign)int group_id;
@property(nonatomic,assign)int cell_type;
@property(nonatomic,strong)ZYLogPB *log_pb;
@property(nonatomic,copy)NSString *media_name;
@property(nonatomic,assign)int user_repin;
@property(nonatomic,copy)NSString *display_url;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,assign)int repin_count;
@property(nonatomic,copy)NSString *stick_label;
@property(nonatomic,assign)BOOL show_portrait_article;
@property(nonatomic,strong)NSMutableArray *action_list;
@property(nonatomic,assign)BOOL user_digg;
@property(nonatomic,assign)int digg_count;
@property(nonatomic,assign)BOOL has_m3u8_video;
@property(nonatomic,assign)BOOL has_video;
@property(nonatomic,assign)int item_version;
@property(nonatomic,assign)int share_count;
@property(nonatomic,assign)int forward_count;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *article_alt_url;
@property(nonatomic,assign)int comment_count;
@property(nonatomic,copy)NSString *commentCount;
@property(nonatomic,assign)int cursor;
@property(nonatomic,assign)int video_style;
@property(nonatomic,assign)BOOL show_portrait;
@property(nonatomic,assign)int stick_style;
@property(nonatomic,assign)int ignore_web_transform;
@property(nonatomic,strong)ZYForwardInfo *forward_info;
@property(nonatomic,assign)BOOL is_stick;
@property(nonatomic,copy)NSString *verified_content;
@property(nonatomic,copy)NSString *share_url;
@property(nonatomic,assign)int bury_count;
@property(nonatomic,assign)int article_sub_type;
@property(nonatomic,assign)BOOL allow_download;
@property(nonatomic,copy)NSString *tag;
@property(nonatomic,assign)int like_count;
@property(nonatomic,assign)int level;
@property(nonatomic,assign)int read_count;
@property(nonatomic,copy)NSString *readCount;
@property(nonatomic,assign)int article_type;
@property(nonatomic,assign)BOOL user_verified;
@property(nonatomic,copy)NSString *rid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)float titleH;
@property(nonatomic,assign)float imageCellHeight;
@property(nonatomic,copy)NSString *abstract;
@property(nonatomic,assign)BOOL is_subject;
@property(nonatomic,assign)BOOL hot;
@property(nonatomic,copy)NSString *keywords;
@property(nonatomic,copy)NSString *source_open_url;
@property(nonatomic,copy)NSString *article_url;
@property(nonatomic,assign)int ban_comment;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,assign)int aggr_type;
@property(nonatomic,assign)int has_mp4_video;
@property(nonatomic,assign)BOOL hase_image;
@property(nonatomic,strong)NSMutableArray *image_list;
@property(nonatomic,strong)NSMutableArray *url_list;
@property(nonatomic,strong)NSMutableArray *large_image_list;
@property(nonatomic,strong)NSMutableArray *thumb_image_list;
@property(nonatomic,assign)float collectionViewH;
@property(nonatomic,assign)float weitoutiaoheight;
@property(nonatomic,strong)ZYMiddleImage *middle_image;
@property(nonatomic,strong)ZYVideoPlayInfo *video_play_info;
@property(nonatomic,strong)ZYVideoDetailinfo *video_detail_info;
@property(nonatomic,strong)ZYSmallVideo *raw_data;
@property(nonatomic,assign)int video_duration;
@property(nonatomic,copy)NSString *videoDuration;
@property(nonatomic,copy)NSString *video_id;
@property(nonatomic,assign)int gallary_flag;
@property(nonatomic,assign)int gallary_image_count;
@property(nonatomic,strong)ZYLargeImage *large_image;
@property(nonatomic,strong)ZYADButton *ad_button;
@property(nonatomic,assign)int ad_id;
@property(nonatomic,copy)NSString *ad_label;
@property(nonatomic,copy)NSString *sub_title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)int label_style;// 3 是广告,1是置顶
@property(nonatomic,copy)NSString *app_name;
@property(nonatomic,copy)NSString *appleid;
@property(nonatomic,copy)NSString *descriptions;//关键字
@property(nonatomic,copy)NSString *download_url;
@property(nonatomic,assign)int card_type;
@property(nonatomic,assign)BOOL is_article;
@property(nonatomic,assign)BOOL is_preview;
@property(nonatomic,copy)NSString *web_url;
@property(nonatomic,strong)NSMutableArray *user_cards;
@property(nonatomic,strong)ZYDongtaiPosition *position;
@property(nonatomic,strong)ZYRepostParam *repost_params;
@property(nonatomic,copy)NSString *brand_info;

@property(nonatomic,assign)float cellHeight;
@end


