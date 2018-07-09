//
//  ZYHomeViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/5.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeViewController.h"
#import <SGPagingView.h>
#import <SGPageTitleViewConfigure.h>
#import "ZYHomeViewModel.h"
#import "ZYHomeNewTitle.h"
#import "ZYVideoTableViewController.h"
#import "ZYHomeRecommendController.h"
#import "ZYHomeJokeViewController.h"
#import "ZYHomeImageViewController.h"
#import "ZYTeMaiViewController.h"
#import "ZYChannelView.h"
@interface ZYHomeViewController ()<SGPageTitleViewDelegate,SGPageContentViewDelegate>
@property(nonatomic,strong)ZYHomeViewModel *homeViewModel;
@property(nonatomic,strong)SGPageTitleView *pageTitleView;
@property(nonatomic,strong)SGPageContentView *pageContentView;
@property(nonatomic,strong)UIButton *addChannelButton;
@property(nonatomic,strong)NSMutableArray *titles;
@end

@implementation ZYHomeViewController
-(ZYHomeViewModel *)homeViewModel{
    if (!_homeViewModel) {
        _homeViewModel = [[ZYHomeViewModel alloc]init];
    }
    return _homeViewModel;
}
-(UIButton *)addChannelButton{
    if (!_addChannelButton) {
        _addChannelButton = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth - newsTitleHeight, 0, newsTitleHeight, newsTitleHeight)];
        [_addChannelButton setImage:[UIImage imageNamed:@"add_channel_titlbar_thin_new_16x16_"] forState:UIControlStateNormal];
        [_addChannelButton addTarget:self action:@selector(editChanelClick:) forControlEvents:UIControlEventTouchUpInside];
        UIView *separatorView = [[UIView alloc]initWithFrame:CGRectMake(0, newsTitleHeight - 1, newsTitleHeight, 1)];
        [separatorView setBackgroundColor:DEF_HEX_RGBA(0xf0f0f0, 1)];
        [_addChannelButton addSubview:separatorView];
        
    }
    return _addChannelButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark- initViews
-(void)setSubViews{
    self.view.backgroundColor = DEF_HEX_RGBA(0xffffff, 1);
    [self.view addSubview:self.addChannelButton];
    ZYWeakSelf(self);
    [self.homeViewModel requestHomeNewsTitle:^(NSArray* array) {
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
    self.pageTitleView = [[SGPageTitleView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth - newsTitleHeight, newsTitleHeight) delegate:self titleNames:titleArray configure:configure];
    [self.view addSubview:self.pageTitleView];
    self.titles = array;
    
}

-(void)setUpChildVC:(NSArray *)array{
    for (ZYHomeNewTitle *model in array) {
        
        switch (model.flags) {
            case video: //视频
            {
                ZYVideoTableViewController *videoTableVC = [[ZYVideoTableViewController alloc]init];
                videoTableVC.newsTitle = model;
                [videoTableVC setUpRefresh:model.category];
                [self addChildViewController:videoTableVC];
            }
                break;
            case essayJoke: //段子
            {
                ZYHomeJokeViewController *jokeVC = [[ZYHomeJokeViewController alloc]init];
                [self addChildViewController:jokeVC];
            }
                break;
            case imagePPMM: //街拍
            {
                ZYHomeJokeViewController *imagePPMMVC = [[ZYHomeJokeViewController alloc]init];
                [self addChildViewController:imagePPMMVC];
            }
                break;
            case imageFunny: //趣图
            {
                ZYHomeJokeViewController *imagePPMMVC = [[ZYHomeJokeViewController alloc]init];
                [self addChildViewController:imagePPMMVC];
            }
                break;
            case photos: //图片
            {
                ZYHomeImageViewController *homeImageVC = [[ZYHomeImageViewController alloc]init];
                [homeImageVC setUpRefresh:model.category];
                [self addChildViewController:homeImageVC];
            }
                break;
            case jinritemai: //特卖
            {
                ZYTeMaiViewController *temaiVC = [[ZYTeMaiViewController alloc]init];
                [self addChildViewController:temaiVC];
            }
                break;
           
            default:
            {
                ZYHomeRecommendController *homeTableVC = [[ZYHomeRecommendController alloc]init];
                
                [homeTableVC setUpRefresh:model.category];
                [self addChildViewController:homeTableVC];
            }
                break;
        }
    }
    self.pageContentView = [[SGPageContentView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame), KScreenWidth, CGRectGetHeight(self.view.frame) - newsTitleHeight) parentVC:self childVCs:self.childViewControllers];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
}

-(void)editChanelClick:(UIButton *)button{
    ZYChannelView *view = [[ZYChannelView alloc]initWithFrame:CGRectMake(0, KScreenHeight, KScreenWidth, KScreenHeight)];
    view.homeTitles = self.titles;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    [view show];
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ZYAddCategoryController *vc = [sb instantiateViewControllerWithIdentifier:@"addCategory"];
////    vc.preferredContentSize = CGSizeMake(KScreenWidth, KScreenHeight - (iPhoneX ? 44: 20));
//    vc.homeTitles = self.titles;
//    [self presentViewController:vc animated:YES completion:nil];
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

@end
