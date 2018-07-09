//
//  ZYVideo.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideo.h"

@implementation ZYVideo
-(NSString *)mainURL{

    NSData *decodeData = [[NSData alloc]initWithBase64EncodedString:self.main_url options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    return [[NSString alloc]initWithData:decodeData encoding:NSUTF8StringEncoding];
}
@end
