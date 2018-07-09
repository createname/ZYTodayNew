//
//  ZYSmallVideo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>
#import "ZYEmojiManager.h"
#import "ZYUser.h"
#import "ZYVideo.h"
#import "ZYSmallVideoAction.h"

@interface ZYStatus : NSObject
@property(nonatomic,assign)BOOL allow_share;
@property(nonatomic,assign)BOOL allow_download;
@property(nonatomic,assign)BOOL allow_comment;
@property(nonatomic,assign)BOOL is_delete;
@end

@interface ZYAppDownload : NSObject
@property(nonatomic,assign)int flag;
@property(nonatomic,copy)NSString *text;
@end

@interface ZYShare : NSObject
@property(nonatomic,copy)NSString *share_title;
@property(nonatomic,copy)NSString *share_url;
@property(nonatomic,copy)NSString *share_weibo_desc;
@property(nonatomic,copy)NSString *share_cover;
@property(nonatomic,copy)NSString *share_desc;
@end

@interface ZYPublishReason : NSObject
@property(nonatomic,copy)NSString *noun;
@property(nonatomic,copy)NSString *verb;
@end

@interface ZYMusic : NSObject
@property(nonatomic,copy)NSString *author;
@property(nonatomic,assign)int *music_id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *cover_large;
@property(nonatomic,copy)NSString *album;
@property(nonatomic,copy)NSString *cover_medium;
@property(nonatomic,copy)NSString *cover_thumb;
@property(nonatomic,copy)NSString *cover_hd;
@end

@interface ZYSmallVideo : NSObject
@property(nonatomic,strong)ZYEmojiManager *emojiManager;
@property(nonatomic,copy)NSString *rich_title;
@property(nonatomic,assign)int group_id;
@property(nonatomic,strong)ZYStatus *status;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSMutableAttributedString *attributeText;
@property(nonatomic,strong)NSMutableArray *thumb_image_lis;
@property(nonatomic,assign)NSTimeInterval create_time;
@property(nonatomic,copy)NSString *recommand_reason;
@property(nonatomic,strong)NSMutableArray *first_frame_image_list;
@property(nonatomic,strong)ZYSmallVideoAction *action;
@property(nonatomic,strong)ZYAppDownload *app_download;
@property(nonatomic,copy)NSString *app_schema;
@property(nonatomic,copy)NSString *interact_label;
@property(nonatomic,copy)NSString *activity;
@property(nonatomic,strong)NSMutableArray *large_image_list;
@property(nonatomic,assign)int group_source;
@property(nonatomic,strong)ZYShare *share;
@property(nonatomic,strong)ZYPublishReason *publish_reason;
@property(nonatomic,strong)ZYMusic *music;
@property(nonatomic,copy)NSString *title_rich_span;
@property(nonatomic,strong)ZYUser *user;
@property(nonatomic,strong)ZYVideo *video;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,copy)NSString *label_for_list;
@property(nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *detail_schema;
@property(nonatomic,assign)int item_id;
@property(nonatomic,strong)NSMutableArray *animated_image_list;
@property(nonatomic,assign)int video_neardup_id;

@property(nonatomic,strong)NSMutableArray *user_cards;
@property(nonatomic,assign)BOOL has_more;
@property(nonatomic,assign)int Id;
@property(nonatomic,copy)NSString *show_more;
@property(nonatomic,copy)NSString *show_more_jump_url;
@end
