//
//  ZYADButton.h
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface ZYADButton : NSObject
@property(nonatomic,copy)NSString *descriptions;
@property(nonatomic,copy)NSString *download_url;
@property(nonatomic,copy)NSString *web_url;
@property(nonatomic,copy)NSString *app_name;
@property(nonatomic,copy)NSString *track_url;
@property(nonatomic,copy)NSString *click_track_url;
@property(nonatomic,copy)NSString *button_text;
@property(nonatomic,copy)NSString *open_url;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *package;
@property(nonatomic,copy)NSString *appleid;
@property(nonatomic,copy)NSString *web_title;
@property(nonatomic,assign)int Id;
@property(nonatomic,assign)int ui_type;
@property(nonatomic,assign)int display_type;
@property(nonatomic,assign)int hide_if_exists;
@end
