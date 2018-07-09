//
//  ZYWeitoutiaoCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/19.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYNewsModel;
@interface ZYWeitoutiaoCell : UITableViewCell
@property(nonatomic,copy)void (^didSelectCell)(NSInteger index, NSMutableArray* imgUrlArr);
@property(nonatomic,strong)ZYNewsModel *newsModel;
@end
