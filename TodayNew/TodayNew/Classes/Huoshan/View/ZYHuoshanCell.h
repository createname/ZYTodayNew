//
//  ZYHuoshanCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/6/28.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYNewsModel;

@interface ZYHuoshanCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)ZYNewsModel *videoModel;
@end
