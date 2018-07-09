//
//  ZYChannelModel.h
//  TodayNew
//
//  Created by liqiaona on 2018/7/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYButton;
@interface ZYChannelModel : NSObject
@property (nonatomic , copy)NSString *name;
@property (nonatomic , assign)BOOL isMyChannel;
@property (nonatomic , assign)CGRect frame;
@property (nonatomic , assign)int tag;
@property (nonatomic , assign)BOOL hideDeleBtn;
@property (nonatomic , weak)ZYButton *btn;
@end
