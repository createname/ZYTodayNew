//
//  ZYRefreshHeader.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYRefreshHeader.h"

@implementation ZYRefreshHeader

-(void)prepare{
    [super prepare];
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i < 16; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%d",i]];
        [images addObject:image];
    }
    //空闲状态的图片
    [self setImages:images forState:MJRefreshStateIdle];
    //设置刷新状态的图片
    [self setImages:images forState:MJRefreshStateRefreshing];
    [self setTitle:@"下拉推荐" forState:MJRefreshStateIdle];
    [self setTitle:@"松开推荐" forState:MJRefreshStatePulling];
    [self setTitle:@"推荐中" forState:MJRefreshStateRefreshing];
}

- (void)placeSubviews{
    [super placeSubviews];
    self.gifView.contentMode = UIViewContentModeCenter;
    self.gifView.frame = CGRectMake(0, 4, self.mj_w, 25);
    self.stateLabel.font = [UIFont systemFontOfSize:12];
    self.stateLabel.frame = CGRectMake(0, 35, self.mj_w, 14);
}

@end
