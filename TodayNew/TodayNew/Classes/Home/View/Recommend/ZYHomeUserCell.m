//
//  ZYHomeUserCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeUserCell.h"

@implementation ZYHomeUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setNews:(ZYNewsModel *)news{
    _news = news;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
