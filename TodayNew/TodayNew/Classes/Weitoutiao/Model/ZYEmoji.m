//
//  ZYEmoji.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/19.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYEmoji.h"

@implementation ZYEmoji
-(instancetype)init:(NSString *)Id name:(NSString *)name png:(NSString *)png isDelete:(BOOL)isDelete isEmpty:(BOOL)isEmpty{
    if (self = [super init]) {
        self.Id = Id;
        self.name = name;
        self.png = png;
        self.isDelete = isDelete;
        self.isEmpty = isEmpty;
        
    }
    return self;
}
@end
