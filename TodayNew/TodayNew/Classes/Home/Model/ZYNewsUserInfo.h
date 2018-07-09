//
//  ZYNewsUserInfo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface ZYNewsUserInfo : NSObject
@property(nonatomic,assign)BOOL follow;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)BOOL user_verified;
@property(nonatomic,copy)NSString *verified_content;
@property(nonatomic,assign)NSInteger user_id;
@property(nonatomic,assign)int Id;
@property(nonatomic,copy)NSString *descri;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *avatar_url;
@property(nonatomic,assign)int follower_count;
@property(nonatomic,assign)int subcribed;
@property(nonatomic,copy)NSString *user_decoration;
@property(nonatomic,assign)int fans_count;
@property(nonatomic,strong)NSMutableArray *special_column;
@property(nonatomic,copy)NSString *user_auth_info;
@property(nonatomic,assign)int media_id;
@property(nonatomic,copy)NSString *screen_name;
@property(nonatomic,assign)BOOL is_followed;
@property(nonatomic,assign)BOOL is_following;
@property(nonatomic,assign)BOOL is_blocking;
@property(nonatomic,assign)BOOL is_blocked;
@property(nonatomic,assign)BOOL is_friend;
@property(nonatomic,strong)NSMutableArray *medals;
@end
