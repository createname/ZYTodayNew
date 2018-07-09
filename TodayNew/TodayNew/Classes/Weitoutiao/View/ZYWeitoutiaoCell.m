//
//  ZYWeitoutiaoCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/19.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYWeitoutiaoCell.h"
#import "ZYNewsModel.h"
#import <UIImageView+WebCache.h>
#import "ZYEmojiManager.h"
#import "ZYDongtaiCollectionView.h"
#import "ZYCalculateTool.h"
#import "ZYRichtextLabel.h"
#import "NSString+Size.h"
#import <YYText/YYText.h>
#import <YYLabel.h>
#import <Masonry.h>

@interface ZYWeitoutiaoCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *vImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeAndDescLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *concernButton;
@property (weak, nonatomic) IBOutlet UIButton *coverButton;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *contentsView;

@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButtton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIView *separatorView;
@property (weak, nonatomic) IBOutlet UIView *separatorView2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;

@property(nonatomic,strong)ZYDongtaiCollectionView *collectionView;

/**
 记录连接的范围
 */
@property(nonatomic,strong)NSArray *linkRanges;

/**
 记录话题的范围
 */
@property(nonatomic,strong)NSArray *topicRanges;
@property(nonatomic,strong)YYLabel *yyLabel;
@end
@implementation ZYWeitoutiaoCell

-(ZYDongtaiCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[ZYDongtaiCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    }
    return _collectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorView.backgroundColor = DEF_HEX_RGBA(0xf0f0f0, 1);
    self.separatorView2.backgroundColor = DEF_HEX_RGBA(0xf0f0f0, 1);
    self.backgroundColor = DEF_HEX_RGBA(0xffffff, 1);
    self.nameLabel.textColor = [UIColor blackColor];
    self.timeAndDescLabel.textColor = [UIColor lightGrayColor];
    self.areaLabel.textColor = [UIColor lightGrayColor];
    
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = 30;
    _yyLabel = [[YYLabel alloc]init];
    _yyLabel.font = [UIFont systemFontOfSize:16];
    _yyLabel.numberOfLines = 0;
    _yyLabel.userInteractionEnabled = YES;
    _yyLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    [_yyLabel setHighlightTapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"33====:%@",[text attributedSubstringFromRange:range].string);
    }];
    [self.contentsView addSubview:_yyLabel];
    [_yyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(10));
        make.right.equalTo(@(-10));
        make.top.bottom.equalTo(self.contentsView);
    }];
}
-(void)setNewsModel:(ZYNewsModel *)newsModel{
    _newsModel = newsModel;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.user.avatar_url]];
    self.vImageView.hidden = !newsModel.user.user_verified;
    self.nameLabel.text = newsModel.user.name;
    NSString *content = newsModel.user.verified_content.length > 0 ? [NSString stringWithFormat:@" · %@",newsModel.user.verified_content]:@"";
    self.timeAndDescLabel.text = [NSString stringWithFormat:@"%@%@",newsModel.createTime,content];
    [self.likeButton setTitle:newsModel.digg_count == 0 ? @"赞":[NSString stringWithFormat:@"%d",newsModel.digg_count] forState:UIControlStateNormal];
    self.likeButton.selected = newsModel.user_digg;
    [self.commentButtton setTitle:newsModel.commentCount forState:UIControlStateNormal];
    [self.forwardButton setTitle:[NSString stringWithFormat:@"%d",newsModel.forward_info.forward_count] forState:UIControlStateNormal];
    self.concernButton.selected = newsModel.user.is_following;
    self.areaLabel.text = newsModel.position.position.length > 0 ? [NSString stringWithFormat:@"%@ · ",newsModel.position.position] : [NSString stringWithFormat:@"%@阅读%@",newsModel.readCount,newsModel.brand_info.length>0?newsModel.brand_info:@""];

    //计算一行的高度
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"全文"];
    [text addAttribute:NSForegroundColorAttributeName value:blueFontColor range:NSMakeRange(0, text.string.length)];
    [text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, text.string.length)];

    self.contentViewHeight.constant = newsModel.contentH > 150 ? 150 : newsModel.contentH;
    self.contentLabelHeight.constant = newsModel.contentH > 150 ? 150 : newsModel.contentH;
    self.middleViewHeight.constant = newsModel.collectionViewH;
    
    [self.collectionView removeFromSuperview];
    if (newsModel.thumb_image_list.count > 0) {
        [self.middleView addSubview:self.collectionView];
        self.collectionView.frame = CGRectMake(15, 0, [ZYCalculateTool collectionViewWidth:newsModel.thumb_image_list.count], [ZYCalculateTool collectionViewHeight:(int)newsModel.thumb_image_list.count]);
        self.collectionView.thumImages = newsModel.thumb_image_list;
        self.collectionView.largeImages = newsModel.large_image_list;
        self.collectionView.isWeitoutiao = YES;
        [self.collectionView reloadData];
       
    }else{
        self.middleViewHeight.constant = 0;
    }
    
    self.yyLabel.attributedText = newsModel.attributeConten;
    [self addMorButton];
}



/**
 添加全文按钮
 */
-(void)addMorButton{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...全文"];
    // 设置高亮的范围
    YYTextBorder *highlightBorder = [YYTextBorder new];
    highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
    highlightBorder.cornerRadius = 3;
    highlightBorder.fillColor = [UIColor lightGrayColor];
    YYTextHighlight *textHeight = [YYTextHighlight new];
    [textHeight setColor:blueFontColor];
    [textHeight setBackgroundBorder:highlightBorder];
    textHeight.tapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"点击全文");
    };
    [text yy_setColor:blueFontColor range:[text.string rangeOfString:@"全文"]];
    [text yy_setTextHighlight:textHeight range:[text.string rangeOfString:@"全文"]];
    
    text.yy_font = [UIFont systemFontOfSize:16];
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentCenter];

    _yyLabel.truncationToken = truncationToken;
    
}

-(void)addImageItems{
//    for (int i = 0; i < _newsModel.thumb_image_list.count; i++) {
//        UIImageView *imageView = [[UIImageView alloc]init];
//
//    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
