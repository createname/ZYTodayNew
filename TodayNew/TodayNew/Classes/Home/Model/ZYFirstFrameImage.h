//
//  ZYFirstFrameImage.h
//  TodayNew
//
//  Created by liqiaona on 2018/6/28.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYFirstFrameImage : NSObject
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,assign)int image_type;
@property(nonatomic,strong)NSMutableArray *url_list;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,assign)int width;
@property(nonatomic,assign)int height;
@end
