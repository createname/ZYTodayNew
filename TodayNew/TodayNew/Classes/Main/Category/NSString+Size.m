//
//  NSString+Size.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

/**
 计算文本的高度
 */
-(CGFloat)labelSizeHeight:(CGFloat)fontSize width:(CGFloat)width{
    
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
}
@end
