//
//  ZYVideoCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/16.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideoCell.h"
#import "ZYNewsModel.h"
#import <UIButton+WebCache.h>
#import "ZYHomeViewModel.h"

@interface ZYVideoCell()
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *concernButton;
@property (weak, nonatomic) IBOutlet UILabel *shareLable;
@property (weak, nonatomic) IBOutlet UIButton *pyqButton;
@property (weak, nonatomic) IBOutlet UIButton *wechatButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;
@property (weak, nonatomic) IBOutlet UILabel *adLabel;
@property (weak, nonatomic) IBOutlet UIButton *adButton;

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;
@property (weak, nonatomic) IBOutlet UIImageView *vImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *descriptionLabelHeight;

@end
@implementation ZYVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    self.adLabel.layer.borderWidth = 1;
    self.adLabel.layer.borderColor = RGB(0, 177, 253).CGColor;
    self.adLabel.layer.cornerRadius = 3;
    
    self.avatarButton.layer.borderWidth = 1;
    self.avatarButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avatarButton.layer.cornerRadius = self.avatarButton.frame.size.width *0.5;
    self.avatarButton.clipsToBounds = YES;
    
    [self.bgImageButton setImage:[UIImage imageNamed:@"video_play_icon_44x44_"] forState:UIControlStateNormal];
    self.bgImageButton.tag = 101;
    self.shareLable.textColor = [UIColor blackColor];
    self.titleLabel.textColor = DEF_HEX_RGBA(0xffffff, 1);
    self.nameLable.textColor = [UIColor blackColor];
    self.playCountLabel.textColor = DEF_HEX_RGBA(0xffffff, 1);
    [self.concernButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.concernButton setTitleColor:DEF_HEX_RGBA(0xd2d2d2, 1) forState:UIControlStateSelected];
    [self.adButton setTitleColor:DEF_HEX_RGBA(0x486495, 1) forState:UIControlStateNormal];
}

-(void)setNewsModel:(ZYNewsModel *)newsModel{
    _newsModel = newsModel;
    self.titleLabel.text = newsModel.title;
    self.playCountLabel.text = [NSString stringWithFormat:@"%@次播放",newsModel.video_detail_info.videoWatchCount];
    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:newsModel.user_info.avatar_url] forState:UIControlStateNormal];
    self.vImageView.hidden = newsModel.user_info.user_verified;
    self.concernButton.selected = newsModel.user_info.follow;
    [self.bgImageButton sd_setBackgroundImageWithURL:[NSURL URLWithString:newsModel.video_detail_info.detail_video_large_image.urlString] forState:UIControlStateNormal];
    
    self.timeLabel.text = newsModel.videoDuration;
    [self.commentButton setTitle:newsModel.commentCount forState:UIControlStateNormal];
    [self.commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.commentButton setImage:[UIImage imageNamed:@"comment_24x24_"] forState:UIControlStateNormal];
    self.concernButton.hidden = newsModel.label_style == 3?YES:NO;
    self.commentButton.hidden = newsModel.label_style == 3?YES:NO;
    [self.adButton setTitle:newsModel.ad_button.button_text.length < 1? [NSString stringWithFormat:@"查看详情"]:newsModel.ad_button.button_text forState:UIControlStateNormal];
    self.nameLable.text = newsModel.user_info.name;
    if (newsModel.label_style == 3) {
        self.nameLable.text = newsModel.app_name.length >1 ? newsModel.app_name:newsModel.ad_button.app_name;
        self.descriptionLable.text = newsModel.ad_button.descriptions.length > 1?newsModel.ad_button.descriptions:newsModel.sub_title;
        self.descriptionLabelHeight.constant = 20;
        [self layoutIfNeeded];
    }
    if (newsModel.label_style != 3) {
        self.adButton.hidden = YES;
        self.adLabel.hidden = YES;
        
    }
}
- (IBAction)bgImageButtonClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(videoCell:playVideoClick:)]) {
        [_delegate videoCell:self playVideoClick:sender];
    }
    
}
- (IBAction)concerBtnClick:(UIButton *)sender {
    if (sender.selected) {//取消关注
        [self.homeViewModel loadRelationUnfollow:_newsModel.user_info.user_id success:^(id msg) {
            sender.selected = !sender.selected;
        }];
    }else{
        [self.homeViewModel loadRelationFollow:_newsModel.user_info.user_id success:^(id msg) {
            sender.selected = !sender.selected;
        }];
    }
}
- (IBAction)adButtonClick:(id)sender {
    NSString *downloadURL = _newsModel.ad_button.download_url.length > 0?_newsModel.ad_button.download_url:_newsModel.download_url;
    NSLog(@"app 下载地址====:%@",downloadURL);
}

-(void)hideSubViews{
    self.titleLabel.hidden = YES;
    self.playCountLabel.hidden = YES;
    self.timeLabel.hidden = YES;
    self.vImageView.hidden = YES;
    self.avatarButton.hidden = YES;
    self.nameLable.hidden = YES;
    self.stackView.hidden = YES;
}
-(void)showSubViews{
    self.titleLabel.hidden = NO;
    self.playCountLabel.hidden = NO;
    self.timeLabel.hidden = NO;
    self.vImageView.hidden = NO;
    self.avatarButton.hidden = NO;
    self.nameLable.hidden = NO;
    self.stackView.hidden = NO;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
