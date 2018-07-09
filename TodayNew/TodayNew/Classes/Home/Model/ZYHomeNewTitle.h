//
//  ZYHomeNewTitle.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYHomeNewTitle : NSObject

@property(nonatomic,assign)int flags;
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *web_url;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSNumber *tip_new;
@property(nonatomic,strong)NSNumber *default_add;
@property(nonatomic,copy)NSString *concern_id;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,copy)NSString *icon_url;
@end
