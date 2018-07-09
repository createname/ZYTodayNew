//
//  ZYHuoshanVideoViewController.h
//  TodayNew
//
//  Created by liqiaona on 2018/7/3.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYNewsModel;

@interface ZYHuoshanVideoViewController : UIViewController<UINavigationControllerDelegate>
- (instancetype)initWithVideoArray:(NSArray *)videos currentImageIndex:(int)currentImageIndex imageViewArray:(NSMutableArray *)imageViewArray imageViewFrameArray:(NSMutableArray *)imageViewFrameArray superView:(UICollectionView *)superView;


@property(nonatomic,weak)UICollectionView *superView;
@end
