//
//  ZYVideoDetailinfo.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideoDetailinfo.h"

@implementation ZYDetailVideoLargeImage
-(NSString *)urlString{
    return [ZYTransformTool urlConverUrlString:self.url];
    
}
@end
@implementation ZYVideoDetailinfo
-(NSString *)videoWatchingCount{
    return [ZYTransformTool numConverString:self.video_watching_count];
}
-(NSString *)videoWatchCount{
    return [ZYTransformTool numConverString:self.video_watch_count];
}
@end
