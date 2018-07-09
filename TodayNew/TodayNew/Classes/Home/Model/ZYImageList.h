//
//  ZYImageList.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYImageList : NSObject
@property(nonatomic,assign)int type;
@property(nonatomic,assign)float height;
@property(nonatomic,strong)NSMutableArray *url_list;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,assign)float width;
@property(nonatomic,copy)NSString *uri;
@property(nonatomic,assign)float ratio;//宽高比
@end
