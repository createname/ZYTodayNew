//
//  ZYHomeTableViewController.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYHomeViewModel.h"
#import "ZYHomeNewTitle.h"

@interface ZYHomeTableViewController : UITableViewController

@property(nonatomic,strong)ZYHomeViewModel *homeViewModel;
@property(nonatomic,copy)NSString *category;
/**
 获取数据
 */
-(void)setUpRefresh:(NSString *)category;
@end
