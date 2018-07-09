//
//  ZYChannelTitleView.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYChannelTitleView.h"

@interface ZYChannelTitleView()
@end

@implementation ZYChannelTitleView
- (IBAction)editBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (_blockEdit) {
        _blockEdit(sender);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
