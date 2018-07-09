//
//  ZYAddCategoryCell.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYAddCategoryCell.h"
#import "ZYHomeNewTitle.h"

@interface ZYAddCategoryCell()
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
@implementation ZYAddCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(ZYHomeNewTitle *)model{
    _model = model;
    [self.titleButton setTitle:model.name forState:UIControlStateNormal];
}
-(void)setIsEdit:(BOOL)isEdit{
    _isEdit = isEdit;
    self.deleteButton.hidden = !isEdit;
    
}
- (IBAction)deleteClick:(id)sender {
    
}

@end
