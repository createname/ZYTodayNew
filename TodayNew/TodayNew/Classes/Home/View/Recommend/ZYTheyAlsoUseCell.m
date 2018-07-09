//
//  ZYTheyAlsoUseCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYTheyAlsoUseCell.h"
#import "ZYSmallVideo.h"

@implementation ZYTheyAlsoUseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setTheyUse:(ZYSmallVideo *)theyUse{
    _theyUse = theyUse;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
