//
//  ZYHomeRecommendController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYHomeRecommendController.h"
#import "ZYHomeCell.h"
#import "ZYHomeUserCell.h"
#import "ZYTheyAlsoUseCell.h"
#import "ZYNewsModel.h"

@interface ZYHomeRecommendController ()

@end

@implementation ZYHomeRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubView];
}

-(void)initSubView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYHomeCell" bundle:nil] forCellReuseIdentifier:@"ZYHomeCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYHomeUserCell" bundle:nil] forCellReuseIdentifier:@"ZYHomeUserCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYTheyAlsoUseCell" bundle:nil] forCellReuseIdentifier:@"ZYTheyAlsoUseCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    ZYLog(@"self.home.news=========:%@",self.homeViewModel.news);
    return self.homeViewModel.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.homeViewModel.news.count>0) {
        ZYNewsModel *model = [self.homeViewModel.news objectAtIndex:indexPath.row];
        
        switch (model.cell_type) {
            case 32://用户
            {
                ZYHomeUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYHomeUserCell"];
                cell.news = model;
                return cell;
            }
                break;
            case 50://相关关注
            {
                ZYTheyAlsoUseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYTheyAlsoUseCell"];
                cell.theyUse = model.raw_data;
                return cell;
            }
                break;
            default:
            {
                ZYHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYHomeCell"];
                cell.newsModel = model;
                return cell;
            }
                break;
        }
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYNewsModel *model = [self.homeViewModel.news objectAtIndex:indexPath.row];

    switch (model.cell_type) {
        case 32://用户
            return model.contentH;
            break;
        case 50://相关关注
            return 290;
            break;
        default:
            return model.cellHeight;
            break;
    }
    return 0;
}


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
