//
//  ZYEmojiManager.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYEmojiManager : NSObject
-(NSMutableAttributedString *)showEmoji:(NSString *)content font:(UIFont *)font;
@end
