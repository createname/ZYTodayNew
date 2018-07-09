//
//  ZYVideoModel.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/17.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideoModel.h"

#import <MJExtension.h>

@implementation ZYFilterWord
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}

@end

@implementation ZYMixed
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}
+(NSDictionary *)mj_objectClassInArray{
    return @{@"filter_words":[ZYFilterWord class]};
}
@end

@implementation ZYApp
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id",@"descriptions":@"description"};
}
+(NSDictionary *)mj_objectClassInArray{
    return @{@"filter_words":[ZYFilterWord class]};
}
@end

@implementation ZYVideoDetail
+(NSDictionary *)mj_objectClassInArray{
    return @{@"related_video_toutiao":[ZYNewsModel class]};
}

-(NSString *)buryCount{
    return [ZYTransformTool numConverString:self.bury_count];
}
@end


@implementation ZYVideoModel



-(NSString *)mainURL{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self.main_url options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
@end
