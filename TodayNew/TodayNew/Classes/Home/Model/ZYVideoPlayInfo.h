//
//  ZYVideoPlayInfo.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYVideoPlayInfo : NSObject
@property(nonatomic,assign)int status;
@property(nonatomic,assign)BOOL enable_ssl;
@property(nonatomic,copy)NSString *poster_url;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,assign)int video_duration;
@end
