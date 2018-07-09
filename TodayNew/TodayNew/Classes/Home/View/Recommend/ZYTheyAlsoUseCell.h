//
//  ZYTheyAlsoUseCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYSmallVideo;

@interface ZYTheyAlsoUseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)ZYSmallVideo *theyUse;
@end
