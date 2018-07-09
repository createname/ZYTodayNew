//
//  ZYWeitoutiaoViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/5.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYWeitoutiaoViewController.h"
#import "ZYEmojiManager.h"
#import "ZYWeitoutiaoCell.h"
#import "ZYNewsModel.h"

@interface ZYWeitoutiaoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZYWeitoutiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYWeitoutiaoCell" bundle:nil] forCellReuseIdentifier:@"ZYWeitoutiaoCell"];
    [self setUpRefresh:@"weitoutiao"];
}
#pragma mark- Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeViewModel.news.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYWeitoutiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYWeitoutiaoCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.newsModel = [self.homeViewModel.news objectAtIndex:indexPath.row];
    ZYWeakSelf(self);
    [cell setDidSelectCell:^(NSInteger index, NSMutableArray *imgUrlArr) {
        [weakself browserImageView:index imgUrlArr:imgUrlArr];
    }];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYNewsModel *model = [self.homeViewModel.news objectAtIndex:indexPath.row];
    return model.weitoutiaoheight;
}

-(void)browserImageView:(NSInteger)index imgUrlArr:(NSMutableArray *)imgUrlArr{
    NSMutableArray *imgArr = [NSMutableArray arrayWithCapacity:0];
    for (ZYThumbImage *thumbImage in imgUrlArr) {
        [imgArr addObject:thumbImage.urlString];
    }
    NSLog(@"imgUrlArr=======:%@",imgArr);
    
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
