//
//  ZYDongtaiCollectionViewCell.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/21.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYLargeImage, ZYThumbImage;

@interface ZYDongtaiCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property(nonatomic,assign)BOOL isPostSmallVideo;
@property(nonatomic,strong)ZYLargeImage *largeImage;
@property(nonatomic,strong)ZYThumbImage *thumImage;
@end
