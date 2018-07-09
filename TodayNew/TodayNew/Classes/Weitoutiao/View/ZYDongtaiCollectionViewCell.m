//
//  ZYDongtaiCollectionViewCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/21.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYDongtaiCollectionViewCell.h"
#import "ZYThumbImage.h"
#import "ZYLargeImage.h"
#import <UIImageView+WebCache.h>
#import "SVProgressHUD+ZYSVProgressHUD.h"
#import <SVProgressHUD.h>

@interface ZYDongtaiCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *gifLabel;
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end
@implementation ZYDongtaiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.thumbImageView.userInteractionEnabled = YES;
    self.thumbImageView.layer.borderColor = DEF_HEX_RGBA(0xe6e6e6, 1).CGColor;
    self.thumbImageView.layer.borderWidth = 1;
    self.backgroundColor = DEF_HEX_RGBA(0xffffff, 1);
}

-(void)setIsPostSmallVideo:(BOOL)isPostSmallVideo{
    _isPostSmallVideo = isPostSmallVideo;
    [self.iconButton setImage:isPostSmallVideo ? [UIImage imageNamed:@"images.smallvideo_all_32x32_"]:nil forState:UIControlStateNormal];
    self.iconButton.hidden = isPostSmallVideo == NO?YES:NO;
}
-(void)setThumImage:(ZYThumbImage *)thumImage{
    _thumImage = thumImage;
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:thumImage.urlString]];
    
    self.gifLabel.hidden = thumImage.type == 2 ? NO :YES;
}
-(void)setLargeImage:(ZYLargeImage *)largeImage{
    _largeImage = largeImage;
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:largeImage.urlString] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];

    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:largeImage.urlString] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        [SVProgressHUD showProgress:receivedSize/expectedSize];
        [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [SVProgressHUD dismiss];
    }];
}
@end
