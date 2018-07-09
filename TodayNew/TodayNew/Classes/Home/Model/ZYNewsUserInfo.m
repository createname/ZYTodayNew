//
//  ZYNewsUserInfo.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYNewsUserInfo.h"

@implementation ZYNewsUserInfo
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id",@"descri":@"description"};
}
@end
