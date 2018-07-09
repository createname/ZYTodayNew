//
//  ZYImageTableViewCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/18.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYImageTableViewCell.h"
#import "ZYNewsModel.h"
#import "ZYImageList.h"
#import <UIImageView+WebCache.h>

@interface ZYImageTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *imageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *imageCountLabel;

@end
@implementation ZYImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageTitleLabel.textColor = [UIColor blackColor];
    self.usernameLabel.textColor = DEF_HEX_RGBA(0xd0d0d0, 1);
    self.timeLabel.textColor = DEF_HEX_RGBA(0xd0d0d0, 1);
}
-(void)setNewsModel:(ZYNewsModel *)newsModel{
    _newsModel = newsModel;
    if (newsModel.gallary_image_count > 0) {
        self.imageCountLabel.text = [NSString stringWithFormat:@"%d图",newsModel.gallary_image_count];
    }
    self.imageTitleLabel.text = newsModel.title;
    self.timeLabel.text = [NSString stringWithFormat:@"%@评论",newsModel.commentCount];
    if (newsModel.media_info.user_id != 0) {
        self.usernameLabel.text = newsModel.media_info.name;
    }
    
//    ZYLog(@"imageList======:%@",newsModel.image_list);
    
    if (newsModel.image_list.count > 0) {
        ZYImageList *imageList = [newsModel.image_list firstObject];
        [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:imageList.urlString ]];
    }else{
        if (newsModel.middle_image.url_list > 0) {
            NSString *urlStr = [[newsModel.middle_image.url_list firstObject] objectForKey:@"url"];
            [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:[ZYTransformTool urlConverUrlString:urlStr] ]];
          
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
