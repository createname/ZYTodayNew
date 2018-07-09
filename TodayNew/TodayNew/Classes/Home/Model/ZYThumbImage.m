//
//  ZYThumbImage.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/10.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYThumbImage.h"

@implementation ZYThumbImage
-(NSString *)urlString{
    return [ZYTransformTool urlConverUrlString:self.url];
}

-(float)ratio{
    return self.width / self.height;
}
@end
