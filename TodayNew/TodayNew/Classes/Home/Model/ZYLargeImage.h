//
//  ZYLargeImage.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLargeImage : NSObject
@property(nonatomic,assign)int type;
@property(nonatomic,assign)float height;
@property(nonatomic,strong)NSMutableArray *url_list;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,assign)float width;
@property(nonatomic,copy)NSString *uri;

@property(nonatomic,copy)NSString *urlString;
@end
