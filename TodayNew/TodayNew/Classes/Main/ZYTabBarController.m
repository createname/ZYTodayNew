//
//  ZYTabBarController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/4.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYTabBarController.h"
#import "ZYHomeViewController.h"
#import "ZYVideoViewController.h"
#import "ZYRedpackageViewController.h"
#import "ZYWeitoutiaoViewController.h"
#import "ZYHuoshanViewController.h"
#import "ZYNavigationController.h"
#import "ZYCategoryViewController.h"
@interface ZYTabBarController ()

@end

@implementation ZYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setChildViewController:[ZYHomeViewController new] title:@"首页" imageName:@"home"];
    [self setChildViewController:[ZYVideoViewController new] title:@"西瓜视频" imageName:@"video"];
    [self setChildViewController:[ZYWeitoutiaoViewController new] title:@"微头条" imageName:@"weitoutiao"];
    [self setChildViewController:[ZYCategoryViewController new] title:@"小视频" imageName:@"huoshan"];
    [self setTabBar];
}

-(void)setTabBar{

    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.shadowImage = [UIImage new];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: RGB(213, 51, 57)} forState:UIControlStateSelected];
    
}

-(void)setChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_tabbar_32x32_",imageName]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_tabbar_press_32x32_",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ZYNavigationController *nav = [[ZYNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    
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
