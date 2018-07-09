//
//  ZYVideoCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/16.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYNewsModel,ZYHomeViewModel,ZYVideoCell;

@protocol ZYVideoCellDelegate <NSObject>
-(void)videoCell:(ZYVideoCell *)cell playVideoClick:(UIButton *)click;
@end

@interface ZYVideoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *bgImageButton;

@property(nonatomic,strong)ZYNewsModel *newsModel;
@property(nonatomic,strong)ZYHomeViewModel *homeViewModel;

@property(nonatomic,weak)id<ZYVideoCellDelegate>delegate;

-(void)hideSubViews;
-(void)showSubViews;
@end
