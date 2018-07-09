//
//  ZYAddCategoryCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/7/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYHomeNewTitle;
@interface ZYAddCategoryCell : UICollectionViewCell
@property(nonatomic,strong)ZYHomeNewTitle *model;
@property(nonatomic,assign)BOOL isEdit;
@end
