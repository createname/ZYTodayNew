//
//  ZYHuoshanVideoCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/3.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHuoshanVideoCell.h"
#import "ZYNewsModel.h"
#import "ZYFirstFrameImage.h"
#import <UIImageView+WebCache.h>
@interface ZYHuoshanVideoCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation ZYHuoshanVideoCell
-(void)awakeFromNib{
    [super awakeFromNib];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundColor = [UIColor yellowColor];
    self.imageView.backgroundColor = [UIColor redColor];
}
-(void)setModel:(ZYNewsModel *)model{
    _model = model;
    if (model.raw_data.large_image_list.count > 0) {
        ZYLargeImage *largeImage = [model.raw_data.large_image_list firstObject];
        
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:largeImage.urlString]];
    } else if (model.raw_data.first_frame_image_list.count > 0){
        ZYFirstFrameImage *firstImage = [model.raw_data.first_frame_image_list firstObject];
        
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:firstImage.urlString]];
    }
}

@end
