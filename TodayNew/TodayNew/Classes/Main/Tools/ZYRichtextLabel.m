//
//  ZYRichtextLabel.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/29.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYRichtextLabel.h"

@interface ZYRichtextLabel()

/**
 文本容器，文本可以排版的区域，默认是矩形，可以自定义区域大小
 */
@property(nonatomic,strong)NSTextContainer *textContainer;

/**
 布局管理者，负责对文字进行编辑排版处理，将存储在 NSTextStorage 中的数据转换为可以在视图控件中显示的文本内容
 */
@property(nonatomic,strong)NSLayoutManager *layoutManager;

/**
 当 NSTextStorage 中的字符或属性发生改变时，会通知 NSLayoutManager，进而做到文本内容的显示更新。
 */
@property(nonatomic,strong)NSTextStorage *textStorage;

/**
 记录用户名的范围
 */
@property(nonatomic,strong)NSArray *userRanges;

/**
 记录连接的范围
 */
@property(nonatomic,strong)NSArray *linkRanges;

/**
 记录话题的范围
 */
@property(nonatomic,strong)NSArray *topicRanges;

@property(nonatomic,copy)void (^tapRichTextBlock)(NSString *str, NSRange range);

//@property(nonatomic,assign)TapRichTextType userTapped;
//@property(nonatomic,assign)TapRichTextType linkTapped;
//@property(nonatomic,assign)TapRichTextType topicTapped;
//@property(nonatomic,assign)TapRichTextType tapRichTextType;

/**
 记录用户点击的range
 */
@property(nonatomic,assign)NSRange selectedRange;
@end

@implementation ZYRichtextLabel

-(NSTextContainer *)textContainer{
    if (!_textContainer) {
        _textContainer = [[NSTextContainer alloc]init];
    }
    return _textContainer;
}

-(NSLayoutManager *)layoutManager{
    if (!_layoutManager) {
        _layoutManager = [[NSLayoutManager alloc]init];
    }
    return _layoutManager;
}

-(NSTextStorage *)textStorage{
    if (!_textStorage) {
        _textStorage = [[NSTextStorage alloc]init];
    }
    return _textStorage;
}

-(NSArray *)userRanges{
    if (!_userRanges) {
        _userRanges = [[NSArray alloc]init];
    }
    return _userRanges;
}
-(NSArray *)linkRanges{
    if (!_linkRanges) {
        _linkRanges = [[NSArray alloc]init];
    }
    return _linkRanges;
}
-(NSArray *)topicRanges{
    if (!_topicRanges) {
        _topicRanges = [[NSArray alloc]init];
    }
    return _topicRanges;
}

-(void)drawTextInRect:(CGRect)rect{
    NSRange range = NSMakeRange(0, self.textStorage.length);
    [self.layoutManager drawGlyphsForGlyphRange:range atPoint:CGPointZero];
}
-(instancetype)init{
    if (self = [super init]) {
       [self setupText];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupText];
    }
    return self;
}

-(void)setupText{
    self.numberOfLines = -1;
    // 将 layoutManager 添加到 textStorage 中
    [self.layoutManager addTextContainer:self.textContainer];
    // 将 textStorage 添加到 layoutManager 中
    [self.textStorage addLayoutManager:self.layoutManager];
    //设置可以与用户交互
    [self setUserInteractionEnabled:YES];
    self.textContainer.lineFragmentPadding = 0;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textContainer.size = self.frame.size;
}

-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:attributedText];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, attributedString.length)];
    // 设置 textStorage 的文本内容
    [self.textStorage setAttributedString:attributedString];
    //匹配用户名
    self.userRanges = [self ranges:@"@.*?:"];
    for (NSTextCheckingResult *result in self.userRanges) {
        ZYLog(@"userRanges====:%@",NSStringFromRange(result.range));
        [self.textStorage addAttribute:NSForegroundColorAttributeName value:blueFontColor range:result.range];
    }
    
    //匹配话题
    self.topicRanges = [self ranges:@"#.*?#"];
    for (NSTextCheckingResult *result in self.topicRanges) {
        [self.textStorage addAttribute:NSForegroundColorAttributeName value:blueFontColor range:result.range];
    }
    
    //匹配链接
    self.linkRanges = [self rangeOflink];
    for (NSTextCheckingResult *result in self.linkRanges) {
        [self.textStorage addAttribute:NSForegroundColorAttributeName value:blueFontColor range:result.range];
    }
}

/**
 返回链接结果范围
 */
-(NSArray *)rangeOflink{
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    return [self results:dataDetector];
}
/**
 返回正则表达式匹配的结果范围
 */
-(NSArray *)ranges:(NSString *)pattern{
    NSRegularExpression *regex = [[NSRegularExpression alloc]initWithPattern:pattern options:0 error:nil];
    return [self results:regex];
}

-(NSArray *)results:(NSRegularExpression *)regex{
    NSArray *checkingResults = [regex matchesInString:self.textStorage.string options:0 range:NSMakeRange(0, self.textStorage.length)];
    return checkingResults;
}

/**
 根据点击的坐标，获取范围
 */
-(NSRange)range:(CGPoint)point{
    if (self.textStorage.length == 0) {
        return NSMakeRange(0, 0);
    }
    NSInteger index = [self.layoutManager glyphIndexForPoint:point inTextContainer:self.textContainer];
    //获取用户名的范围
    for (NSTextCheckingResult *result in self.userRanges) {
        if (index > result.range.location && index < result.range.location + result.range.length) {
//            self.tapRichTextType = user;
            return result.range;
        }
    }
    //获取连接范围
    for (NSTextCheckingResult *result in self.linkRanges) {
        if (index > result.range.location && index < result.range.location + result.range.length) {
//            self.tapRichTextType = links;
            return result.range;
        }
    }
    
    //获取话题范围
    for (NSTextCheckingResult *result in self.topicRanges) {
        if (index > result.range.location && index < result.range.location + result.range.length) {
//            self.tapRichTextType = topic;
            return result.range;
        }
    }
    return NSMakeRange(0, 0);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *set = [event allTouches];
    UITouch *touch = [set anyObject];
    CGPoint point = [touch locationInView:self];
    self.selectedRange = [self range:point];
    //获取点击的范围的内容
    NSString *content = [self.textStorage.string substringWithRange:self.selectedRange];
//    switch (self.tapRichTextType) {
//        case user:
//            if (self.tapRichTextBlock) {
//
//                self.tapRichTextBlock(content, self.selectedRange);
//            }
//            break;
//        case links:
//            if (self.tapRichTextBlock) {
//
//                self.tapRichTextBlock(content, self.selectedRange);
//            }
//            break;
//        case topic:
//            if (self.tapRichTextBlock) {
//
//                self.tapRichTextBlock(content, self.selectedRange);
//            }
//            break;
//        default:
//            break;
//    }
}
@end
