//
//  ZYMiddleImage.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYMiddleImage.h"

@implementation ZYMiddleImage
-(NSString *)urlString{
    return [ZYTransformTool urlConverUrlString:self.url];
}

-(float)ratio{
    return self.width / self.height;
}
@end
