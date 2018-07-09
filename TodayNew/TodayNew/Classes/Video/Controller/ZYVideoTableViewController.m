//
//  ZYVideoTableViewController.m
//  TodayNew
//
//  Created by liqiaona on 2018/5/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYVideoTableViewController.h"
#import "ZYVideoCell.h"
#import <ZFPlayer.h>
#import <Masonry.h>

@interface ZYVideoTableViewController ()<ZYVideoCellDelegate>
@property(nonatomic,strong)ZFPlayerView *player;
@property(nonatomic,strong)ZFPlayerModel *playerModel;
/**
 上一次播放的cell
 */
@property(nonatomic,strong)ZYVideoCell *previousCell;

@end

@implementation ZYVideoTableViewController
-(ZFPlayerView *)player{
    if (!_player) {
        _player = [ZFPlayerView sharedPlayerView];
        _player.stopPlayWhileCellNotVisable = YES;
    }
    return _player;
}
-(ZFPlayerModel *)playerModel{
    if (!_playerModel) {
        _playerModel = [[ZFPlayerModel alloc]init];
    }
    return _playerModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    
}
-(void)initSubViews{
    self.tableView.rowHeight = KScreenWidth * 0.67;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZYVideoCell" bundle:nil] forCellReuseIdentifier:@"ZYVideoCell"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.homeViewModel.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.homeViewModel.news.count > 0) {
        ZYNewsModel *model = [self.homeViewModel.news objectAtIndex:indexPath.row];
        ZYVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYVideoCell"];
        cell.homeViewModel = self.homeViewModel;
        cell.newsModel = model;
        cell.delegate = self;
        return cell;
    }else{
        return nil;
    }
}
#pragma mark- ZYVideoCellDelegate
-(void)videoCell:(ZYVideoCell *)cell playVideoClick:(UIButton *)click{
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if ([cell isKindOfClass:[self.previousCell class]]) {
        [cell showSubViews];
    }else{
        
        ZYWeakSelf(self);
        [self.homeViewModel parseVideoRealURL:cell.newsModel.video_detail_info.video_id success:^(id msg) {
            weakself.previousCell = cell;
            [cell hideSubViews];
            weakself.playerModel.scrollView = weakself.tableView;
            weakself.playerModel.indexPath = indexPath;
            weakself.playerModel.fatherViewTag = weakself.previousCell.bgImageButton.tag;
            weakself.playerModel.videoURL = [NSURL URLWithString:weakself.homeViewModel.realVideo.video_list.video_1.mainURL];
            
            [weakself.player playerControlView:nil playerModel:weakself.playerModel];
            [weakself.player autoPlayTheVideo];
        }];
    }
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
