//
//  ZYHomeCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeCell.h"
#import "ZYNewsModel.h"
#import "ZYHomeImageCollectionView.h"
#import "ZYMediaInfo.h"
#import "ZYImageList.h"
#import "ZYLargeImage.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>

@interface ZYHomeCell()
//视频放大图
@property(nonatomic,strong)UIButton *videoImageButton;
@property(nonatomic,strong)ZYHomeImageCollectionView *collectionView;
@end

@implementation ZYHomeCell

-(ZYHomeImageCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[[NSBundle mainBundle]loadNibNamed:@"ZYHomeImageCollectionView" owner:nil options:nil] firstObject];
    }
    return _collectionView;
}

-(UIButton *)videoImageButton{
    if (!_videoImageButton) {
        _videoImageButton = [[UIButton alloc]init];
    }
    return _videoImageButton;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = DEF_HEX_RGBA(0xffffff, 1);
    self.titleLabel.textColor = [UIColor blackColor];
    self.nameLabel.textColor = DEF_HEX_RGBA(0x969696, 1);
    self.adOrHotLabel.layer.borderWidth = 1;
    self.adOrHotLabel.layer.cornerRadius = 4;
    self.commentCountLabel.textColor = DEF_HEX_RGBA(0x969696, 1);
    [self.addTextpageButton setImage:[UIImage imageNamed:@"add_textpage_17x12_"] forState:UIControlStateNormal];
    self.rightTimeButton.layer.cornerRadius = 11;
    [self.rightTimeButton setImage:[UIImage imageNamed:@"palyicon_video_textpage_6x8_"] forState:UIControlStateNormal];
    [self.downloadButton setImage:[UIImage imageNamed:@"download_ad_feed_13x13_"] forState:UIControlStateNormal];
    
}

-(void)setNewsModel:(ZYNewsModel *)newsModel{
    _newsModel = newsModel;
    [self.downloadButton setImage:nil forState:UIControlStateNormal];
    self.topImageView.image = nil;
    self.rightImageView.image = nil;
    [self.videoImageButton setImage:nil forState:UIControlStateNormal];
    self.middleViewHeight.constant = 1;

    [self.videoImageButton removeFromSuperview];
    self.videoImageButton.frame = CGRectZero;
    self.collectionView.frame = CGRectZero;
    [self.collectionView removeFromSuperview];
    
    self.bottomViewHeight.constant = 0;
    [self.downloadButton setTitle:@"" forState:UIControlStateNormal];
    self.titleLabel.text = newsModel.title;
    if (newsModel.media_name.length > 0) {
        self.nameLabel.text = newsModel.media_name;
    }else if (newsModel.user_info.user_id != 0){
        self.nameLabel.text = newsModel.user_info.name;
    }else if (newsModel.media_info.media_id !=0){
        self.nameLabel.text = newsModel.media_info.name;
    }
    
    self.publishTimeLabel.text = newsModel.publishTime;
    //设置广告标签
    self.adOrHotLabel.textColor = globalRedColor;
    self.adOrHotLabel.layer.borderColor = globalRedColor.CGColor;
    self.adOrHotLabel.text = newsModel.label;
    self.bottomView.backgroundColor = [UIColor yellowColor];
    self.bottomViewHeight.constant = 0;

    if (newsModel.hot) {
        self.adOrHotLabel.text = @"热";
        self.adOrHotLabelWidth.constant = 20;
        self.nameLabelLeading.constant = 25;
    } else if (newsModel.is_stick || [newsModel.label isEqualToString:@"直播"] || [newsModel.label isEqualToString:@"影视"]){
        [self setUpAdLable];
    }else if (newsModel.label_style == 3){//广告
        self.adOrHotLabel.textColor = blueFontColor;
        self.adOrHotLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self setUpAdLable];
        if (newsModel.sub_title.length >1) {
            self.subTitleLabel.text = newsModel.sub_title;
            self.bottomViewHeight.constant = 40;
            [self.downloadButton setImage:[UIImage imageNamed:@"download_ad_feed_13x13_"] forState:UIControlStateNormal];
        }
    }else{
        self.adOrHotLabel.text = @"";
        self.adOrHotLabelWidth.constant = 0;
        self.nameLabelLeading.constant = 0;
    }
    if (newsModel.video_duration != 0 && newsModel.has_video) {//有视频
        if (newsModel.video_style == 0) {//右侧有图

            [self.rightTimeButton setTitle:newsModel.videoDuration forState:UIControlStateNormal];
            self.rightTimeButtonWidth.constant = 50;
            if (newsModel.image_list.firstObject) {
                ZYImageList *imageList = newsModel.image_list.firstObject;
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:imageList.urlString]];
            }else if (newsModel.middle_image.url.length > 0){
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.middle_image.urlString]];
                
            }else if (newsModel.large_image_list.count>0){
                ZYLargeImage *image = newsModel.large_image_list.firstObject;
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:image.urlString]];
            }
        } else if (newsModel.video_style == 2){//大图
            
            if (newsModel.large_image_list.count > 0) {
                
                ZYLog(@"有大图............");
                self.middleViewHeight.constant = KScreenWidth * 0.5;
                
                ZYLargeImage *image = newsModel.large_image_list.firstObject;
                [self.videoImageButton setImage:[UIImage imageNamed:@"video_play_icon_44x44_"] forState:UIControlStateNormal];
                [self.videoImageButton sd_setBackgroundImageWithURL:[NSURL URLWithString:image.urlString] forState:UIControlStateNormal];
                [self.middieView addSubview:self.videoImageButton];
                
                [self setUpRightImageView];
            }
            
        }
    }else{//没有视频
        if (newsModel.middle_image.url.length > 6 && (newsModel.image_list.count <= 0 || newsModel.image_list)) {
           
            [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.middle_image.urlString]];
            self.rightImageViewWidth.constant = KScreenWidth * 0.28;
        }else{
            [self setUpRightImageView];
            if (newsModel.image_list.count == 1) {//右侧右图片
                ZYImageList *imageList = newsModel.image_list.firstObject;
                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:imageList.urlString]];
                self.rightImageViewWidth.constant = KScreenWidth * 0.28;
            }else if (newsModel.image_list.count>1){//多张图片
                self.middleViewHeight.constant = image3Width;
                [self.middieView addSubview:self.collectionView];
                self.collectionView.frame = CGRectMake(0, 0, KScreenWidth - 30, image3Width);
                self.collectionView.images = newsModel.image_list;

            }
        }
    }
    [self layoutIfNeeded];
    self.videoImageButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.middieView.frame), KScreenWidth * 0.5);
}

/**
 更新右边图片和时间按钮约束
 */
-(void)setUpRightImageView{
    self.rightImageViewWidth.constant = 0;
    self.rightTimeButtonWidth.constant = 0;
    [self.rightTimeButton setTitle:@"" forState:0];
}

/**
 更新左边热文字和名字约束
 */
-(void)setUpAdLable{
    self.adOrHotLabelWidth.constant = 32;
    self.nameLabelLeading.constant = 37;
}
- (IBAction)addTextpageButton:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
