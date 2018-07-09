//
//  ZYFirstFrameImage.m
//  TodayNew
//
//  Created by liqiaona on 2018/6/28.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYFirstFrameImage.h"

@implementation ZYFirstFrameImage
-(NSString *)urlString{
    return [ZYTransformTool urlConverUrlString:self.url];
}
@end
