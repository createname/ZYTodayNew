//
//  ZYHomeCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYNewsModel;

@interface ZYHomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UIButton *rightTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *addTextpageButton;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *adOrHotLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
@property (weak, nonatomic) IBOutlet UIView *middieView;
@property (weak, nonatomic) IBOutlet UILabel *publishTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *adOrHotLabelWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabelLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightImageViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightTimeButtonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleViewHeight;


@property(nonatomic,strong)ZYNewsModel *newsModel;
@end
