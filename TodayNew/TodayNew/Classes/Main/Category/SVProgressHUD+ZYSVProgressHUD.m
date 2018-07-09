//
//  SVProgressHUD+ZYSVProgressHUD.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/8.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "SVProgressHUD+ZYSVProgressHUD.h"

@implementation SVProgressHUD (ZYSVProgressHUD)
+(void)configuration{
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setBackgroundColor:RGB(0, 0, 0)];
}
@end
