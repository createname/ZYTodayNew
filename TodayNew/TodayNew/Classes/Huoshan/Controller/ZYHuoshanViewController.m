//
//  ZYHuoshanViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/5.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHuoshanViewController.h"
#import "ZYHomeNewTitle.h"
#import "ZYHuoshanViewModel.h"
#import <SGPagingView.h>
#import <SGPageTitleViewConfigure.h>
#import "ZYCategoryViewController.h"
@interface ZYHuoshanViewController ()<SGPageTitleViewDelegate,SGPageContentViewDelegate>
@property(nonatomic,strong)SGPageTitleView *pageTitleView;
@property(nonatomic,strong)SGPageContentView *pageContentView;
@property(nonatomic,strong)ZYHuoshanViewModel *viewModel;
@end

@implementation ZYHuoshanViewController
-(ZYHuoshanViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [ZYHuoshanViewModel shareHomeViewModel];
    }
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self setSubViews];
}
#pragma mark- init
-(void)setSubViews{

    self.view.backgroundColor = DEF_HEX_RGBA(0xffffff, 1);
    ZYWeakSelf(self);
    [self.viewModel requestNavTitle:^(NSArray* array) {
        if (array.count > 0) {
            
            [weakself setTitleView:array];
            [weakself setUpChildVC:array];
        }
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
    self.pageTitleView = [[SGPageTitleView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 44) delegate:self titleNames:titleArray configure:configure];
    self.pageTitleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = self.pageTitleView;
    
}

-(void)setUpChildVC:(NSArray *)array{
    for (ZYHomeNewTitle *model in array) {
        ZYCategoryViewController *vc = [[ZYCategoryViewController alloc]init];
        vc.newsTitle = model;
        [self addChildViewController:vc];
    }
    self.pageContentView = [[SGPageContentView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, CGRectGetHeight(self.view.frame) ) parentVC:self childVCs:self.childViewControllers];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
