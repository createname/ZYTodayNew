//
//  ZYSmallVideoAction.m
//  TodayNew
//
//  Created by liqiaona on 2018/6/28.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYSmallVideoAction.h"

@implementation ZYSmallVideoAction
-(NSString *)buryCount{
    return [ZYTransformTool numConverString:self.bury_count];
}
-(NSString *)commentCount{
    return [ZYTransformTool numConverString:self.comment_count];
}
-(NSString *)diggCount{
    return [ZYTransformTool numConverString:self.digg_count];
}
-(NSString *)forwardCount{
    return [ZYTransformTool numConverString:self.forward_count];
}
-(NSString *)playCount{
    return [ZYTransformTool numConverString:self.play_count];
}
-(NSString *)readcount{
    return [ZYTransformTool numConverString:self.read_count];
}
-(NSString *)userBury{
    return [ZYTransformTool numConverString:self.user_bury];
}
-(NSString *)userRepin{
    return [ZYTransformTool numConverString:self.user_repin];
}
@end
