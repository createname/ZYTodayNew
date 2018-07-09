//
//  ZYHomeImageCollectionView.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeImageCollectionView.h"
#import "ZYHomeImageCell.h"

@interface ZYHomeImageCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end
@implementation ZYHomeImageCollectionView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing =5;
    self.collectionViewLayout = layout;
    [self registerNib:[UINib nibWithNibName:@"ZYHomeImageCell" bundle:nil] forCellWithReuseIdentifier:@"ZYHomeImageCell"];
}

-(void)setImages:(NSMutableArray *)images{
    
    _images = images;
    [self reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYHomeImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYHomeImageCell" forIndexPath:indexPath];
    cell.imagelist = self.images[indexPath.item];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(image3Width, image3Width);
}
@end
