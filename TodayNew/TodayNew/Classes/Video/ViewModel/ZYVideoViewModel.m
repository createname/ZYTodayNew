//
//  ZYVideoViewModel.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/19.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideoViewModel.h"
#import "ZYHomeNewTitle.h"
#import <MJExtension.h>

@interface ZYVideoViewModel()
@property(nonatomic,strong)ZYNetwortTool *networtTool;
@end
@implementation ZYVideoViewModel

-(ZYNetwortTool *)networtTool{
    if (!_networtTool) {
        _networtTool = [ZYNetwortTool request];
    }
    return _networtTool;
}

/**
 顶部新闻标题
 */
-(void)loadVideoCategoies:(success)success{
    [self.networtTool loadVideoApiCategoies:^(id msg) {

        NSArray *array = [ZYHomeNewTitle mj_objectArrayWithKeyValuesArray:msg];
        success(array);
    } failure:^{
        
    }];
}
@end
