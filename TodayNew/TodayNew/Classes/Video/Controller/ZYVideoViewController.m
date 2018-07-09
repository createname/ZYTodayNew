//
//  ZYVideoViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/5.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideoViewController.h"
#import <SGPagingView.h>
#import <SGPageTitleViewConfigure.h>
#import "ZYVideoTableViewController.h"
#import "ZYVideoViewModel.h"

@interface ZYVideoViewController ()<SGPageTitleViewDelegate,SGPageContentViewDelegate>
@property(nonatomic,strong)SGPageTitleView *pageTitleView;
@property(nonatomic,strong)SGPageContentView *pageContentView;
@property(nonatomic,strong)ZYVideoViewModel *videoViewModel;
@end

@implementation ZYVideoViewController
-(ZYVideoViewModel *)videoViewModel{
    if (!_videoViewModel) {
        _videoViewModel = [[ZYVideoViewModel alloc]init];
    }
    return _videoViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];
}
#pragma mark- initViews
-(void)setSubViews{
    self.view.backgroundColor = DEF_HEX_RGBA(0xffffff, 1);
   
    ZYWeakSelf(self);
    [self.videoViewModel loadVideoCategoies:^(NSArray* array) {
        [weakself setTitleView:array];
        [weakself setUpChildVC:array];
    }];
    
    
}

-(void)setTitleView:(NSArray *)array{
    NSMutableArray *titleArray = [NSMutableArray arrayWithCapacity:0];
    for (ZYHomeNewTitle* model in array) {
        [titleArray addObject:model.name];
    }
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = [UIColor blackColor];
    configure.titleSelectedColor = globalRedColor;
    configure.indicatorColor = [UIColor clearColor];
    self.pageTitleView = [[SGPageTitleView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, newsTitleHeight) delegate:self titleNames:titleArray configure:configure];
    [self.view addSubview:self.pageTitleView];
    
}

-(void)setUpChildVC:(NSArray *)array{
    for (ZYHomeNewTitle *model in array) {
        ZYVideoTableViewController *videoTableVC = [[ZYVideoTableViewController alloc]init];
        videoTableVC.newsTitle = model;
        [videoTableVC setUpRefresh:model.category];
        [self addChildViewController:videoTableVC];
    }
    self.pageContentView = [[SGPageContentView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), KScreenWidth, CGRectGetHeight(self.view.frame) - newsTitleHeight) parentVC:self childVCs:self.childViewControllers];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
}

#pragma mark- SGPageTitleViewDelegate,SGPageContentViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}
-(void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
@end
