//
//  ZYNewsModel.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYNewsModel.h"
#import "NSString+Size.h"
#import "ZYTransformTool.h"
#import "ZYImageList.h"
#import "ZYThumbImage.h"
#import "ZYUserCard.h"
#import "ZYEmojiManager.h"
#import "ZYCalculateTool.h"

@implementation ZYNewsModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"image_list":[ZYImageList class],@"large_image_list":[ZYLargeImage class],@"thumb_image_list":[ZYThumbImage class],@"user_cards":[ZYUserCard class]};
}

-(NSMutableAttributedString *)attributeConten{
    if (self.content.length > 0) {
        ZYEmojiManager *emojiManager = [[ZYEmojiManager alloc]init];
        return [emojiManager showEmoji:self.content font:[UIFont systemFontOfSize:16]];
        
    }else{
        return nil;
    }
}

-(float)collectionViewH{
    return [ZYCalculateTool collectionViewHeight:(int)self.thumb_image_list.count];
}
-(float)contentH{
    
    return [self.content labelSizeHeight:16 width:KScreenWidth - 30];
}

-(float)titleH{
    if (self.video_duration != 0 && self.video_style == 0) {//右侧有图
        return [self.title labelSizeHeight:17 width:KScreenWidth * 0.72 - 30];
    }
    return [self.title labelSizeHeight:17 width:KScreenWidth - 30];
}

-(float)weitoutiaoheight{
    float height = 120;
    height += self.contentH > 150 ? 150 : self.contentH;
    height += self.collectionViewH;
    return height;
}

-(float)imageCellHeight{
    return KScreenWidth * 9 /16 + self.titleH + 50;
}
-(float)cellHeight{
    
    float height = 61 + self.titleH;
    
    if (self.video_duration != 0 && self.video_style == 2) {

        height += KScreenWidth * 0.5;
        return height;
    }
    
    
    if (self.label_style == 3 && self.sub_title.length>0) {//是广告
        height += 40;
    }
    
    if (self.middle_image.url.length > 1 && (self.image_list.count == 0 || self.image_list)) {
        return 95;
    }else{
        if (self.image_list.count > 0) {
            if (self.image_list.count == 1) {
                return 95;
            }else{
                height += image3Width;
            }
        }
    }
    
    
    return height;
}

-(NSString *)publishTime{
    return [ZYTransformTool timeConvertString:self.publish_time];
}
-(NSString *)createTime{
    return [ZYTransformTool timeConvertString:self.create_time];
}

-(NSString *)videoDuration{
    return [ZYTransformTool secondConverVideoDuration:self.video_duration];
}

-(NSString *)commentCount{
    return [ZYTransformTool numConverString:self.comment_count];
}

-(NSString *)readCount{
    return [ZYTransformTool numConverString:self.read_count];
}
//-(NSMutableAttributedString *)attributeConten{
////    self.emojiManager
//}
@end
