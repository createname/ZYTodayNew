//
//  ZYEmoji.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/19.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYEmoji : NSObject
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *png;
@property(nonatomic,assign)BOOL isDelete;
@property(nonatomic,assign)BOOL isEmpty;

-(instancetype)init:(NSString *)Id name:(NSString *)name png:(NSString *)png isDelete:(BOOL)isDelete isEmpty:(BOOL)isEmpty;
@end
