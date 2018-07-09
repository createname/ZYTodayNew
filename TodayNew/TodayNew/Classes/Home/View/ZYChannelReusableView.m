//
//  ZYChannelReusableView.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYChannelReusableView.h"

@interface ZYChannelReusableView()
@property (weak, nonatomic) IBOutlet UIButton *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
@implementation ZYChannelReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)editClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.blockEdit) {
        self.blockEdit(sender);
    }
}

@end
