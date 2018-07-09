//
//  ZYDongtaiCollectionView.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/22.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYDongtaiCollectionView.h"
#import "LBPhotoBrowserManager.h"
#import "ZYDongtaiCollectionViewCell.h"
#import "ZYCalculateTool.h"
#import "ZYLargeImage.h"
@interface ZYDongtaiCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end
@implementation ZYDongtaiCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.delegate = self;
        self.dataSource =self;
        self.backgroundColor = [UIColor clearColor];
        [self setScrollEnabled:NO];
        [self registerNib:[UINib nibWithNibName:@"ZYDongtaiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZYDongtaiCollectionViewCell"];
    }
    return self;
}

#pragma mark- UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.thumImages.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYDongtaiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYDongtaiCollectionViewCell" forIndexPath:indexPath];
    if (self.thumImages.count > 0) {
        cell.thumImage = [self.thumImages objectAtIndex:indexPath.row];
    }
    cell.isPostSmallVideo = self.isPostSmallVideo;
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.isDongtaiDetail ?[ZYCalculateTool detailCollectionViewCellSize:self.thumImages] : [ZYCalculateTool collectionViewCellSize:self.thumImages.count];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isWeitoutiao) {
        [self getImageViews:indexPath.row];
    }else{
        
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

/**
 展示图片
 */
-(void)getImageViews:(NSInteger)index{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < self.visibleCells.count; i++) {
        ZYLargeImage *thumbImage = _largeImages[i];
       
        ZYDongtaiCollectionViewCell *cell = self.visibleCells[i];
        UIImageView *imageView = cell.thumbImageView;
        LBPhotoWebItem *itemm = [[LBPhotoWebItem alloc]
                                 initWithURLString:thumbImage.urlString frame:imageView.frame placeholdImage:imageView.image placeholdSize:imageView.frame.size];
        [items addObject:itemm];
        
    }
    [[LBPhotoBrowserManager defaultManager]addCollectionViewLinkageStyle:UICollectionViewScrollPositionCenteredHorizontally cellReuseIdentifier:@"ZYDongtaiCollectionViewCell"];
    [[LBPhotoBrowserManager defaultManager]showImageWithWebItems:items selectedIndex:index fromImageViewSuperView:self].lowGifMemory = YES;
}
@end
