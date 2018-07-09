//
//  ZYUserCard.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYActions : NSObject
@property(nonatomic,assign)int action;
@property(nonatomic,copy)NSString *desc;
@end

@interface ZYUserAuthInfo : NSObject
@property(nonatomic,copy)NSString *auth_info;
@property(nonatomic,assign)int auth_type;
@end

@interface ZYUserCardUserInfo : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int user_id;
@property(nonatomic,copy)NSString *avatar_url;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *schema;
@property(nonatomic,strong)ZYUserAuthInfo *user_auth_info;
@end

@interface ZYUserCardUserRelation : NSObject
@property(nonatomic,assign)BOOL is_followed;
@property(nonatomic,assign)BOOL is_following;
@property(nonatomic,assign)BOOL is_friend;
@end

@interface ZYUserCardUser : NSObject
@property(nonatomic,strong)ZYUserCardUserInfo *info;
@property(nonatomic,strong)ZYUserCardUserRelation *relation;
@end

@interface ZYUserCard : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *recommend_reason;
@property(nonatomic,assign)int recommend_type;
@property(nonatomic,strong)ZYUserCardUser *user;
@property(nonatomic,copy)NSString *stats_place_holder;
@end
