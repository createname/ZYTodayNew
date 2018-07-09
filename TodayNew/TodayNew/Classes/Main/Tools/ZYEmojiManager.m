//
//  ZYEmojiManager.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYEmojiManager.h"
#import "ZYEmoji.h"
#import <YYText/YYText.h>

@interface ZYEmojiManager()
@property(nonatomic,strong)NSMutableArray *temps;
@property(nonatomic,strong)NSMutableArray *emojis;
@end

@implementation ZYEmojiManager

-(NSMutableArray *)temps{
    if (!_temps) {
        _temps = [NSMutableArray array];
    }
    return _temps;
}
-(NSMutableArray *)emojis{
    if (!_emojis) {
        _emojis = [NSMutableArray array];
    }
    return _emojis;
}
-(instancetype)init{
    if (self = [super init]) {
        NSString *arrayPath = [[NSBundle mainBundle]pathForResource:@"emoji_sort.plist" ofType:nil];
        NSArray *emojiSorts = [NSArray arrayWithContentsOfFile:arrayPath];

        NSString *mappingPath = [[NSBundle mainBundle]pathForResource:@"emoji_mapping.plist" ofType:nil];
        NSDictionary *emojiMapping = [NSDictionary dictionaryWithContentsOfFile:mappingPath];
//        NSLog(@"emojiMapping=====:%@",[emojiMapping allKeys]);
        
        [emojiSorts enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx != 0 && idx % 20 == 0) {
                [self.temps addObject:[[ZYEmoji alloc]init:@"" name:@"" png:@"" isDelete:YES isEmpty:0]];
            }else{
                [self.temps addObject:[[ZYEmoji alloc] init:obj name:@"" png:[NSString stringWithFormat:@"emoji_%@_32x32_",obj] isDelete:0 isEmpty:0]];
            }
        }];
        
        for (ZYEmoji *emoji in self.temps) {
            NSArray *keys = [emojiMapping allKeys];
            
            for (int i = 0; i < keys.count; i++) {
                NSString *value = [emojiMapping objectForKey:[keys objectAtIndex:i]];
                if ([emoji.Id isEqualToString:value]) {
                    emoji.name = [NSString stringWithFormat:@"%@",[keys objectAtIndex:i]];
                    [self.emojis addObject:emoji];
                }
            }
            if (emoji.isDelete) {
                [self.emojis addObject:emoji];
            }
        }
        
        NSInteger count = self.emojis.count % 21;
        if (count !=0) {
            for (int index = 0; index < 21; index++) {
                [self.emojis addObject:index == 20 ? [[ZYEmoji alloc] init:@"" name:@"" png:@"" isDelete:YES isEmpty:0]:[[ZYEmoji alloc] init:@"" name:@"" png:@"" isDelete:0 isEmpty:YES] ];
            }
        }
    }
    return self;
}

/**
 显示emoji表情
 */
-(NSMutableAttributedString *)showEmoji:(NSString *)content font:(UIFont *)font{
    NSMutableAttributedString *attributeStr =[[NSMutableAttributedString alloc]initWithString:content];
    [attributeStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, content.length)];
    //正则表达式
    NSString *emojiPattern = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    NSRegularExpression *regularExpression = [[NSRegularExpression alloc]initWithPattern:emojiPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *array = [regularExpression matchesInString:content options:NSMatchingReportCompletion range:NSMakeRange(0, content.length)];
    if (array.count != 0) {
        
        // 倒序遍历，从最后一个开始替换，如果说从第一个旧替换的话，字符串的长度就发生变化了
        for (int index = (int)(array.count - 1); index>=0; index --) {
            NSTextCheckingResult *result = [array objectAtIndex:index];
            NSString *emojiName = [content substringWithRange:result.range];
            //取出对应的emoji
            for (ZYEmoji *emoji in self.emojis) {
                if ([emoji.name isEqualToString:emojiName]) {
                    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
                    attachment.image = [UIImage imageNamed:emoji.png];
                    attachment.bounds = CGRectMake(0, 4, 20, 20);
                    NSAttributedString *attributedImageStr = [NSAttributedString attributedStringWithAttachment:attachment];

                    [attributeStr replaceCharactersInRange:result.range withAttributedString:attributedImageStr];
                    
                }
            }
        }
    }
    // 设置高亮的范围
    YYTextBorder *highlightBorder = [YYTextBorder new];
    highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
    highlightBorder.cornerRadius = 3;
    highlightBorder.fillColor = [UIColor lightGrayColor];
    
    NSArray *topicArr = [self ranges:@"#.*?#" attributeStr:attributeStr];
    for (NSTextCheckingResult *result in topicArr) {
        NSString *substrinsgForMatch2 = [attributeStr.string substringWithRange:result.range];
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:substrinsgForMatch2];
        one.yy_font = font;
        one.yy_color = blueFontColor;
        [attributeStr replaceCharactersInRange:result.range withAttributedString:one];
        
        // 高亮状态
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setBackgroundBorder:highlightBorder];
        [highlight setColor:blueFontColor];
        highlight.userInfo = @{@"topic":[attributeStr.string substringWithRange:NSMakeRange(result.range.location + 1, result.range.length - 1)]};
        [attributeStr yy_setTextHighlight:highlight range:result.range];
        
    }
    //匹配用户名 @"[^@]*\\."
    NSArray *userArr = [self ranges:@"@[a-zA-Z0-9\\u4e00-\\u9fa5\\-]+ ?" attributeStr:attributeStr];
    for (NSTextCheckingResult *result in userArr) {
        NSString *substrinsgForMatch2 = [attributeStr.string substringWithRange:result.range];
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:substrinsgForMatch2];
        one.yy_font = font;
        one.yy_color = blueFontColor;
        [attributeStr replaceCharactersInRange:result.range withAttributedString:one];
        // 高亮状态
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setBackgroundBorder:highlightBorder];
        [highlight setColor:blueFontColor];
        highlight.userInfo = @{@"alt":[attributeStr.string substringWithRange:NSMakeRange(result.range.location + 1, result.range.length - 1)]};
        [attributeStr yy_setTextHighlight:highlight range:result.range];
    }
    
    //匹配链接
    NSArray *linkRanges = [self rangeOflink:attributeStr];
    for (NSTextCheckingResult *result in linkRanges) {
        NSString *substrinsgForMatch2 = [attributeStr.string substringWithRange:result.range];
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:substrinsgForMatch2];
        one.yy_font = font;
        one.yy_underlineStyle = NSUnderlineStyleSingle;
        one.yy_color = blueFontColor;
        [attributeStr replaceCharactersInRange:result.range withAttributedString:one];
        // 高亮状态
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setBackgroundBorder:highlightBorder];
        [highlight setColor:blueFontColor];
        highlight.userInfo = @{@"link":[attributeStr.string substringWithRange:NSMakeRange(result.range.location + 1, result.range.length - 1)]};
        [attributeStr yy_setTextHighlight:highlight range:result.range];
    }
    return attributeStr;
}

/**
 返回正则表达式匹配的结果范围
 */
-(NSArray *)ranges:(NSString *)pattern attributeStr:(NSAttributedString *)attributeStr{
    NSRegularExpression *regex = [[NSRegularExpression alloc]initWithPattern:pattern options:0 error:nil];
    return [regex matchesInString:attributeStr.string options:0 range:NSMakeRange(0, attributeStr.string.length)];
}

/**
 返回链接结果范围
 */
-(NSArray *)rangeOflink:(NSAttributedString *)attributeStr{
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    return [dataDetector matchesInString:attributeStr.string options:0 range:NSMakeRange(0, attributeStr.string.length)];
}
@end
