//
//  ZYHomeImageCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeImageCell.h"
#import <UIImageView+WebCache.h>
#import "ZYImageList.h"

@interface ZYHomeImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation ZYHomeImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setImagelist:(ZYImageList *)imagelist{
    _imagelist = imagelist;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imagelist.urlString]];
}
@end
