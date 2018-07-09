//
//  ZYHomeTableViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeTableViewController.h"
#import "SVProgressHUD+ZYSVProgressHUD.h"
#import <MJRefreshStateHeader.h>
#import <SVProgressHUD.h>
#import "ZYRefreshHeader.h"
#import "ZYRefreshFooter.h"

@interface ZYHomeTableViewController ()

@end

@implementation ZYHomeTableViewController

-(ZYHomeViewModel *)homeViewModel{
    if (!_homeViewModel) {
        _homeViewModel = [[ZYHomeViewModel alloc]init];
    }
    return _homeViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD configuration];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = DEF_HEX_RGBA(0xf6f6f6, 1);
    self.tableView.separatorColor = DEF_HEX_RGBA(0xf0f0f0, 1);
    
}

-(void)setUpRefresh:(NSString *)category{
    ZYWeakSelf(self);
    ZYRefreshHeader *header = [ZYRefreshHeader headerWithRefreshingBlock:^{
        [weakself.homeViewModel loadApiNewsFeeds:category tt_from:@"pull" success:^(id msg) {
            [weakself.tableView.mj_header endRefreshing];
            [weakself.tableView reloadData];
            
        } failure:^{
            [weakself.tableView.mj_header endRefreshing];

        }];
    }];

    [header setAutomaticallyChangeAlpha:YES];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [ZYRefreshFooter footerWithRefreshingBlock:^{
        [weakself.homeViewModel loadMoreApiNewsFeeds:category success:^(id msg) {
            
            [weakself.tableView.mj_footer endRefreshing];
            weakself.tableView.mj_footer.pullingPercent = 0;
            [weakself.tableView reloadData];
        } failure:^{
            [weakself.tableView.mj_header endRefreshing];
            
        }];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
