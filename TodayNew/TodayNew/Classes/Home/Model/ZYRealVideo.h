//
//  ZYRealVideo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/18.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYVideoList.h"

@interface ZYRealVideo : NSObject
@property(nonatomic,assign)NSInteger status;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *video_id;
@property(nonatomic,assign)NSInteger validate;
@property(nonatomic,assign)BOOL enable_ssl;
@property(nonatomic,assign)float video_duration;
@property(nonatomic,strong)ZYVideoList *video_list;
@end
