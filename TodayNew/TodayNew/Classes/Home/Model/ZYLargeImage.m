//
//  ZYLargeImage.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYLargeImage.h"

@implementation ZYLargeImage
-(NSString *)urlString{
    return [ZYTransformTool urlConverUrlString:self.url];
}
@end
