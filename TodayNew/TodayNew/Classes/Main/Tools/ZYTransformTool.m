//
//  ZYTransformTool.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/10.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYTransformTool.h"

@implementation ZYTransformTool

/**
 秒数转时间字符串
 */
+(NSString *)timeConvertString:(NSTimeInterval)time{
    //获取到的秒数转换成具体的时间
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:time];
    //获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取日期的年份
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents* comps = [calendar components:unitFlags fromDate:createDate toDate:[NSDate date] options:0];
    //日期格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    if (![self isThisYear:createDate]) {
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return [dateFormatter stringFromDate:createDate];
    }
    //前天
    if ([self isBeforeYesterday:createDate]) {
        dateFormatter.dateFormat = @"前天 HH:mm";
        return [dateFormatter stringFromDate:createDate];
    }else if ([self isToday:createDate] || [self isYesterday:createDate]){
        if (comps.hour >= 1) {
            return [NSString stringWithFormat:@"%ld小时前",comps.hour];
        }else if (comps.minute >= 1){
            return [NSString stringWithFormat:@"%ld分钟前",comps.minute];
        }else{
            return @"刚刚";
        }
    }else{
        dateFormatter.dateFormat = @"MM-dd HH:mm";
        return [dateFormatter stringFromDate:createDate];
    }
}

/**
 是否是今年
 */
+(BOOL)isThisYear:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取日期年份
    NSInteger yearComps = [calendar component:NSCalendarUnitYear fromDate:date];
    //获取现在的日期年份
    NSInteger nowComps = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    if (yearComps == nowComps) {
        return YES;
    }
    return NO;
}
/**
 是否是前天
 */
+(BOOL)isBeforeYesterday:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //获取日期
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date toDate:[NSDate date] options:0];
    
    return comp.year == 0 && comp.month == 0 && comp.day == 1;
}

/**
 是否是昨天
 */
+(BOOL)isYesterday:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if ([calendar isDateInYesterday:date]){//昨天
        return YES;
    }
    return NO;
}
/**
 是否是今天
 */
+(BOOL)isToday:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if ([calendar isDateInToday:date]){//昨天
        return YES;
    }
    return NO;
}

/**
 数字转换
 */
+(NSString *)numConverString:(float)num{
    if (num >= 10000) {
        return [NSString stringWithFormat:@"%.1f万",(num / 10000.0)];
    }else{
        return [NSString stringWithFormat:@"%.1f",num];
    }
}

/**
 秒数转间隔时间字符串

 */
+(NSString *)secondConverVideoDuration:(int)time{
    if (time == 0) {
        return @"00:00";
    }
    NSInteger seconds = time;
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    if (str_hour.intValue > 0) {
        return [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    }else{
        return [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    }
    


}

/**
 图片连接转换
 */
+(NSString *)urlConverUrlString:(NSString *)url{
    
    if ([url hasSuffix:@".webp"]) {
        return [url stringByReplacingCharactersInRange:NSMakeRange(url.length - 5, 5) withString:@".png"];
    }else{
        return url;
    }
}
@end
