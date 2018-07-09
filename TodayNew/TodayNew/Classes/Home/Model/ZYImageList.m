//
//  ZYImageList.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYImageList.h"

@implementation ZYImageList
-(NSString *)urlString{
    return [ZYTransformTool urlConverUrlString:self.url];
}

-(float)ratio{
    return self.width / self.height;
}
@end
