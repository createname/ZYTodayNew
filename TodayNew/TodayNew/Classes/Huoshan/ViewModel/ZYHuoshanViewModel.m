//
//  ZYHuoshanViewModel.m
//  TodayNew
//
//  Created by liqiaona on 2018/6/27.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHuoshanViewModel.h"
#import "ZYNewsModel.h"
#import <MJExtension.h>

@interface ZYHuoshanViewModel()
@property(nonatomic,strong)ZYNetwortTool *networtTool;
@end
@implementation ZYHuoshanViewModel
-(NSMutableArray *)news{
    if (!_news) {
        _news = [[NSMutableArray alloc]init];
    }
    return _news;
}
-(ZYNetwortTool *)networtTool{
    if (!_networtTool) {
        _networtTool = [ZYNetwortTool request];
    }
    return _networtTool;
}

+(instancetype)shareHomeViewModel{
    static ZYHuoshanViewModel *viewModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewModel = [[ZYHuoshanViewModel alloc]init];
    });
    return viewModel;
}

-(void)requestNavTitle:(void (^)(id))block{
    [self.networtTool loadHuoshanApiCategoies:^(id msg) {
//        NSLog(@"msg=======:%@",msg);
        NSMutableArray *array = nil;
        
        array = [ZYHomeNewTitle mj_objectArrayWithKeyValuesArray:[msg objectForKey:@"data"]];
        int type = 0;
        if (array.count == 0) {
            
            ZYHomeNewTitle *home = [[ZYHomeNewTitle alloc]init];
            home.name = @"推荐";
            home.category = @"hotsoon_video";
            [array addObject:home];
        }else{
            
            for (ZYHomeNewTitle *model in array) {
                model.flags = type;
                type++;
            }
        }
        
        block(array);
    } failure:^{
        
    }];
}

-(void)loadHuoshanApiNewsFeeds:(NSString *)category tt_from:(NSString *)ttfrom success:(success)success failure:(faile)failure{
    ZYWeakSelf(self);
    [self.networtTool loadHUoshanApiNewsFeeds:category tt_from:ttfrom success:^(NSTimeInterval time, id msg) {
//        ZYLog(@"msg======:%@",msg);
        for (NSDictionary *dic in msg) {
            
            ZYNewsModel *model = [ZYNewsModel mj_objectWithKeyValues:[dic objectForKey:@"content"]];
            
            [weakself.news addObject:model];
            
        }
        weakself.maxBehotTime = time;
        success(nil);
    } failure:^{
        failure();
    }];
}
@end
