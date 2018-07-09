//
//  ZYHuoshanVideoViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/3.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHuoshanVideoViewController.h"
#import "ZYNewsModel.h"
#import "ZYHuoshanVideoCell.h"
#import "YYPhotoBrowserTranslation.h"
#import <Masonry.h>
@interface ZYHuoshanVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong) YYPhotoBrowserTranslation *translation;//转场动画管理者

@property(nonatomic,assign)int index;
@property(nonatomic,strong)NSMutableArray<ZYNewsModel *> *videos;
@property(nonatomic,strong)NSMutableArray *imageViewFrameArray;
@property(nonatomic,strong)NSMutableArray *imageViewArray;
@end

@implementation ZYHuoshanVideoViewController

- (YYPhotoBrowserTranslation *)translation
{
    if (!_translation)
    {
        _translation = [[YYPhotoBrowserTranslation alloc] init];
        _translation.collectionView = (UICollectionView *)self.superView;
        _translation.photoBrowserMainScrollView = (UIView *)self.collectionView;
        _translation.imageViewArray = self.imageViewArray;
        _translation.imageViewFrameArray = self.imageViewFrameArray;
        _translation.currentIndex = self.index;//这个参数要最后赋值，因为他的setter中用到了上面的参数
    }
    return _translation;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(KScreenWidth, KScreenHeight);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"ZYHuoshanVideoCell" bundle:nil] forCellWithReuseIdentifier:@"ZYHuoshanVideoCell"];
        [_collectionView setContentOffset:CGPointMake(self.index *KScreenWidth, 0) animated:NO];
        _collectionView.hidden = YES;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _collectionView;
}
-(instancetype)initWithVideoArray:(NSArray *)videos currentImageIndex:(int)currentImageIndex imageViewArray:(NSMutableArray *)imageViewArray imageViewFrameArray:(NSMutableArray *)imageViewFrameArray superView:(UICollectionView *)superView{
    
    if (self = [super init]) {
        
        self.superView = superView;
        self.videos = [videos copy];
        self.index = currentImageIndex;
        self.imageViewArray = imageViewArray;
        self.imageViewFrameArray = imageViewFrameArray;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubViews];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)setSubViews{
    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.hidden = YES;
    
}

-(void)backClick{
   [self.navigationController setNavigationBarHidden:NO];
    self.translation.backImageFrame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);//赋值给转场管理对象做动画
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)dealloc{
    NSLog(@"控制器销毁");
}
#pragma mark- UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.videos.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYHuoshanVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYHuoshanVideoCell" forIndexPath:indexPath];
    
    cell.model = self.videos[indexPath.row];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    self.presentingViewController.tabBarController.tabBar.hidden = NO; // 先获取弹出视图的视图控制器，再修改隐藏属性
    [self backClick];
}

#pragma mark- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.translation.currentIndex = scrollView.contentOffset.x/KScreenWidth;
}

#pragma mark- UIViewControllerTransitioningDelegate(转场动画代理)

- (id)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        self.translation.photoBrowserShow = YES;
        return self.translation;
    }else{
        self.translation.photoBrowserShow = NO;
        return self.translation;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.translation.photoBrowserShow = YES;
    return self.translation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{

    self.translation.photoBrowserShow = NO;
    return self.translation;
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
