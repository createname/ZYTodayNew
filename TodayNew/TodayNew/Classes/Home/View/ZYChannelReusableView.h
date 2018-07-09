//
//  ZYChannelReusableView.h
//  TodayNew
//
//  Created by liqiaona on 2018/7/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYChannelReusableView : UICollectionReusableView
@property(nonatomic,copy)void(^blockEdit)(UIButton *btn) ;
@end
