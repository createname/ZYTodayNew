//
//  ZYButton.h
//  TodayNew
//
//  Created by liqiaona on 2018/7/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYChannelModel.h"
@interface ZYButton : UIButton
@property(nonatomic,strong)ZYChannelModel *model;
@property(nonatomic,weak)UIImageView *deleImageView;

-(instancetype)initWithChannelBlock:(void(^)(ZYButton *button))channelBlock recommondChannelHandleBlock:(void(^)(ZYButton *button))recommondBlock;

- (void)addLongPressBeginBlock:(void(^)(ZYButton * btn))beginBlock longPressMoveBlock:(void(^)(ZYButton * btn,UILongPressGestureRecognizer *ges))moveBlock longPressEndBlock:(void(^)(ZYButton * btn))endBlock;

-(void)reloadData;
@end
