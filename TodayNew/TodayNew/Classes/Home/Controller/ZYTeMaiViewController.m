//
//  ZYTeMaiViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYTeMaiViewController.h"
#import <WebKit/WebKit.h>

@interface ZYTeMaiViewController ()
@property(nonatomic,strong)WKWebView *webView;
@end

@implementation ZYTeMaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:configuration];
    [self.view addSubview:self.webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.maila88.com/mailaIndex?mailaAppKey=GDW5NMaKQNz81jtW2Yuw2P"]];
    [self.webView loadRequest:request];
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
