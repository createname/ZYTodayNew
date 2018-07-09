//
//  ZYChannelTitleView.h
//  TodayNew
//
//  Created by liqiaona on 2018/7/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYChannelTitleView : UIView
@property (weak, nonatomic) IBOutlet UIButton *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;

@property(nonatomic,copy)void(^blockEdit)(UIButton *btn) ;
@end
