//
//  ZYCalculateTool.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/21.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYCalculateTool.h"
#import "ZYThumbImage.h"

@implementation ZYCalculateTool

/**
 计算高度
 */
+(float)collectionViewHeight:(int)count{
    if (count >0 && count < 3) {
        return image2Width;
    }else if (count == 3){
        return image3Width + 5;
    }else if (count >3 && count < 7){
        return (image3Width + 5) * 2;
    }else if (count >6 && count <10){
        return (image3Width + 5) * 3;
    }else{
        return 0;
    }
    
}

/**
 计算宽度
 */
+(CGFloat)collectionViewWidth:(NSInteger)count{
    if (count == 2 || count == 1) {
        return (image2Width + 5) * 2;
    }else if (count > 2 && count != 4){
        return (KScreenWidth - 30);
    }else if (count == 4){
        return (image3Width + 5) * 2;
    }else{
        return 0;
    }
}

/**
 计算详情里collectionviewcell的大小
 */
+(CGSize)detailCollectionViewCellSize:(NSMutableArray *)thumbImages{
    if (thumbImages.count == 1) {
        ZYThumbImage *thumbImage = [thumbImages firstObject];
        CGFloat height = (KScreenWidth - 38) * thumbImage.height / thumbImage.width;
        return CGSizeMake(KScreenWidth - 38, height);
    }else if (thumbImages.count == 2 || thumbImages.count == 4){
        CGFloat image2W = (KScreenWidth - 35) * 0.5;
        return CGSizeMake(image2W, image2W);
    }else if (thumbImages.count >2 && thumbImages.count !=4){
        return CGSizeMake(image3Width, image3Width);
    }else{
        return CGSizeZero;
    }
}

/**
 计算collectionviewcell的大小
 */
+(CGSize)collectionViewCellSize:(NSInteger)count {
    if (count == 1 || count == 2) {
        return CGSizeMake(image2Width, image2Width);
    }else if (count >2 && count <=9){
        return CGSizeMake(image3Width, image3Width);
    }else{
        return CGSizeZero;
    }
}
@end
