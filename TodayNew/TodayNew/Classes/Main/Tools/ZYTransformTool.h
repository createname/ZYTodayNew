//
//  ZYTransformTool.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/10.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYTransformTool : NSObject
/**
 秒数转时间字符串
 */
+(NSString *)timeConvertString:(NSTimeInterval)time;
/**
 数字转换
 */
+(NSString *)numConverString:(float)num;
/**
 秒数转间隔时间字符串
 
 */
+(NSString *)secondConverVideoDuration:(int)time;

/**
 图片连接转换
 */
+(NSString *)urlConverUrlString:(NSString *)url;
@end
