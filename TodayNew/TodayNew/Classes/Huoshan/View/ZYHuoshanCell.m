//
//  ZYHuoshanCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/6/28.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHuoshanCell.h"
#import "ZYNewsModel.h"
#import "ZYLargeImage.h"
#import "ZYFirstFrameImage.h"
#import <UIImageView+WebCache.h>

@interface ZYHuoshanCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *diggCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *playCountButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end
@implementation ZYHuoshanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setVideoModel:(ZYNewsModel *)videoModel{
    _videoModel = videoModel;
   
    self.titleLabel.attributedText = videoModel.raw_data.attributeText;
    if (videoModel.raw_data.large_image_list.count > 0) {
        ZYLargeImage *largeImage = [videoModel.raw_data.large_image_list firstObject];

        [self.imageView sd_setImageWithURL:[NSURL URLWithString:largeImage.urlString]];
    } else if (videoModel.raw_data.first_frame_image_list.count > 0){
        ZYFirstFrameImage *firstImage = [videoModel.raw_data.first_frame_image_list firstObject];

        [self.imageView sd_setImageWithURL:[NSURL URLWithString:firstImage.urlString]];
    }
//    ZYLog(@"videoModel.raw_data.action=====:%@",videoModel.raw_data.action);
    self.diggCountLabel.text = [NSString stringWithFormat:@"%@赞",videoModel.raw_data.action.diggCount];
    [self.playCountButton setTitle:[NSString stringWithFormat:@"%@播放次数",videoModel.raw_data.action.playCount] forState:UIControlStateNormal];
}
- (IBAction)closeClick:(UIButton *)sender {
}

@end
