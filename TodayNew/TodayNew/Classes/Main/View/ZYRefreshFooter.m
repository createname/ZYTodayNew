//
//  ZYRefreshFooter.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYRefreshFooter.h"

@implementation ZYRefreshFooter

-(void)prepare{
    [super prepare];
    self.mj_h = 50;
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 8; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"sendloading_18x18_%d",i]]];
    }
    //空闲状态的图片
    [self setImages:images forState:MJRefreshStateIdle];
    //设置刷新状态的图片
    [self setImages:images forState:MJRefreshStateRefreshing];
    [self setTitle:@"上啦加载数据" forState:MJRefreshStateIdle];
    [self setTitle:@"正在努力加载" forState:MJRefreshStatePulling];
    [self setTitle:@"正在努力加载" forState:MJRefreshStateRefreshing];
    [self setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
}
-(void)placeSubviews{
    [super placeSubviews];
    self.gifView.mj_x = 135;

    self.gifView.mj_y = self.stateLabel.center.y;
}
@end
