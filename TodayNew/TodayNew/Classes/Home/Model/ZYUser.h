//
//  ZYUser.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYUserCard.h"

@interface ZYRelationCount : NSObject
@property(nonatomic,assign)int followings_count;
@property(nonatomic,assign)int followers_count;
@end

@interface ZYRelation : NSObject
@property(nonatomic,assign)BOOL is_followed;
@property(nonatomic,assign)BOOL is_friend;
@property(nonatomic,assign)BOOL is_following;
@property(nonatomic,copy)NSString *remark_name;
@end


@interface ZYInfo : NSObject
@property(nonatomic,copy)NSString *medals;
@property(nonatomic,copy)NSString *avatar_url;
@property(nonatomic,copy)NSString *schema;
@property(nonatomic,strong)ZYUserAuthInfo *user_auth_info;
@property(nonatomic,assign)int user_id;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,assign)BOOL ban_status;
@property(nonatomic,assign)BOOL user_verified;
@property(nonatomic,copy)NSString *verified_content;
@property(nonatomic,copy)NSString *media_id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *user_decoration;
@end

@interface ZYUser : NSObject
@property(nonatomic,strong)ZYRelationCount *relation_count;
@property(nonatomic,strong)ZYRelation *relation;
@property(nonatomic,strong)ZYInfo *info;
@end
