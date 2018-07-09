//
//  ZYChannelCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYChannelCell.h"
#import "ZYHomeNewTitle.h"
@interface ZYChannelCell()
@property (weak, nonatomic) IBOutlet UIButton *titleButton;

@end
@implementation ZYChannelCell
-(void)setModel:(ZYHomeNewTitle *)model{
    _model = model;
    [self.titleButton setTitle:model.name forState:UIControlStateNormal];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
