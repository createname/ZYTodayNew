//
//  ZYSmallVideo.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYSmallVideo.h"
#import "ZYLargeImage.h"
#import "ZYFirstFrameImage.h"

@implementation ZYSmallVideo
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"large_image_list":[ZYLargeImage class],@"first_frame_image_list":[ZYFirstFrameImage class]};
}
-(NSMutableAttributedString *)attributeText{
    return [[ZYEmojiManager alloc]showEmoji:self.title font:[UIFont systemFontOfSize:17]];
}
@end
