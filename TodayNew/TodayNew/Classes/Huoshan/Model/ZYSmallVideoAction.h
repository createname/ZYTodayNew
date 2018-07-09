//
//  ZYSmallVideoAction.h
//  TodayNew
//
//  Created by liqiaona on 2018/6/28.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYSmallVideoAction : NSObject
@property(nonatomic,assign)int bury_count;
@property(nonatomic,copy)NSString *buryCount;

@property(nonatomic,assign)int comment_count;
@property(nonatomic,copy)NSString *commentCount;

@property(nonatomic,assign)int digg_count;
@property(nonatomic,copy)NSString *diggCount;

@property(nonatomic,assign)int forward_count;
@property(nonatomic,copy)NSString *forwardCount;

@property(nonatomic,assign)int play_count;
@property(nonatomic,copy)NSString *playCount;

@property(nonatomic,assign)int read_count;
@property(nonatomic,copy)NSString *readcount;

@property(nonatomic,assign)int user_bury;
@property(nonatomic,copy)NSString *userBury;

@property(nonatomic,assign)int user_repin;
@property(nonatomic,copy)NSString *userRepin;

@property(nonatomic,assign)int user_digg;
@end
