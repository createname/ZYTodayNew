//
//  ZYMediaInfo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYMediaInfo : NSObject
@property(nonatomic,assign)BOOL follow;
@property(nonatomic,assign)BOOL is_star_user;
@property(nonatomic,copy)NSString *recommend_reason;
@property(nonatomic,assign)BOOL user_verified;
@property(nonatomic,assign)int media_id;
@property(nonatomic,copy)NSString *verified_content;
@property(nonatomic,assign)int user_id;
@property(nonatomic,assign)int recommend_type;
@property(nonatomic,copy)NSString *avatar_url;
@property(nonatomic,copy)NSString *name;
@end
