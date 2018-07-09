//
//  ZYCategoryViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/6/27.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYCategoryViewController.h"
#import "ZYHuoshanCell.h"
#import "SVProgressHUD+ZYSVProgressHUD.h"
#import <Masonry.h>
#import "ZYRefreshHeader.h"
#import "ZYHuoshanViewModel.h"
#import "ZYRefreshFooter.h"
#import "ZYHuoshanVideoViewController.h"
@interface ZYCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)ZYHuoshanViewModel *viewModel;

@property(nonatomic,strong)NSMutableArray *imageViewFrameArray;
@property(nonatomic,strong)NSMutableArray *imageViewArray;
@end

@implementation ZYCategoryViewController
-(NSMutableArray *)imageViewFrameArray{
    if (!_imageViewFrameArray) {
        _imageViewFrameArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _imageViewFrameArray;
}
-(NSMutableArray *)imageViewArray{
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _imageViewArray;
}
-(ZYHuoshanViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [ZYHuoshanViewModel shareHomeViewModel];
    }
    return _viewModel;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat itemWidth = (KScreenWidth - 2) / 2;
        layout.itemSize = CGSizeMake(itemWidth, itemWidth * 1.5);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = DEF_HEX_RGBA(0xf6f6f6, 1);
        [_collectionView registerNib:[UINib nibWithNibName:@"ZYHuoshanCell" bundle:nil] forCellWithReuseIdentifier:@"ZYHuoshanCell"];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [SVProgressHUD configuration];
    [self setRefresh];
}

-(void)setRefresh{
    ZYWeakSelf(self);
    ZYRefreshHeader *header = [ZYRefreshHeader headerWithRefreshingBlock:^{
        [weakself.viewModel loadHuoshanApiNewsFeeds:@"hotsoon_video" tt_from:@"enter_auto" success:^(id msg) {
            [weakself.collectionView.mj_header endRefreshing];
            [weakself.collectionView reloadData];
        } failure:^{
            [weakself.collectionView.mj_header endRefreshing];
        }];
    }];
    [header setAutomaticallyChangeAlpha:YES];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.collectionView.mj_header = header;
    [self.collectionView.mj_header beginRefreshing];
    
//    self.collectionView.mj_footer = [ZYRefreshFooter footerWithRefreshingBlock:^{
//        [weakself.viewModel loadMoreApiNewsFeeds:self.newsTitle.category success:^(id msg) {
//
//            [weakself.collectionView.mj_footer endRefreshing];
//            weakself.collectionView.mj_footer.pullingPercent = 0;
//            [weakself.collectionView reloadData];
//        } failure:^{
//            [weakself.collectionView.mj_header endRefreshing];
//
//        }];
//    }];
//    [self.collectionView.mj_footer setAutomaticallyChangeAlpha: YES];
}

#pragma mark- UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.news.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYHuoshanCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYHuoshanCell" forIndexPath:indexPath];
    cell.videoModel = [self.viewModel.news objectAtIndex:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self getImageViews:indexPath.row];
    ZYHuoshanVideoViewController *vc = [[ZYHuoshanVideoViewController alloc]initWithVideoArray:self.viewModel.news currentImageIndex:(int)indexPath.row imageViewArray:self.imageViewArray imageViewFrameArray:self.imageViewFrameArray superView:self.collectionView];
    vc.superView = self.collectionView;
    self.tabBarController.tabBar.hidden = YES; // 隐藏tabBar
    vc.hidesBottomBarWhenPushed = YES;
    self.navigationController.delegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)getImageViews:(NSInteger)index{
    [self.imageViewArray removeAllObjects];
    [self.imageViewFrameArray removeAllObjects];
    
    
    CGFloat imageWidth = (KScreenWidth - 2) / 2;
    CGFloat imageHeight = imageWidth * 1.5;
    for (int i = 0; i < self.collectionView.visibleCells.count; i++) {
        ZYHuoshanCell *cell = self.collectionView.visibleCells[i];
        UIImageView *imageView = cell.imageView;
        [self.imageViewArray addObject:imageView];
        
        int row=i/2;//行号
        int loc=i%2;//列号
        CGFloat X = imageWidth*loc;
        CGFloat Y = imageHeight*row;
        [self saveWindowFrameWithOriginalFrame:CGRectMake(X, Y + navHeight, imageWidth, imageHeight)];
    }
}

/** 根据图片再view中的位置，算出在window中的位置，并保存 */
- (void)saveWindowFrameWithOriginalFrame:(CGRect)originalFrame
{
    //因为这里恰好在view中的位置就是在window中的位置，所以不需要转frame
    //因为数组不能存结构体，所以存的时候转成NSValue
    NSValue *frameValue = [NSValue valueWithCGRect:originalFrame];
    [self.imageViewFrameArray addObject:frameValue];
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
