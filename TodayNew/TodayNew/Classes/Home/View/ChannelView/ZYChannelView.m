//
//  ZYChannelView.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/7.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYChannelView.h"
#import "ZYHomeNewTitle.h"
#import "ZYHomeViewModel.h"
#import "ZYChannelTitleView.h"
#import "ZYButton.h"
#import "ZYChannelModel.h"
#import <Masonry.h>
#import "UIView+LBFrame.h"

static CGFloat itemSpace = 10;
static CGFloat lineSpace = 10;
static int column = 4;
static CGFloat labelHeight = 40;
@interface ZYChannelView()
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)ZYHomeViewModel *viewModel;
@property(nonatomic,strong)ZYChannelTitleView *titleView1;
@property(nonatomic,strong)ZYChannelTitleView *titleView2;
@property(nonatomic,assign)BOOL isEdit;
@property(nonatomic,strong)NSMutableArray *categories;
@property(nonatomic,weak)ZYChannelModel *divisionModel;

@end
@implementation ZYChannelView
-(NSMutableArray *)categories{
    if (!_categories) {
        _categories = [NSMutableArray arrayWithCapacity:0];
    }
    return _categories;
}

-(ZYChannelTitleView *)titleView1{
    if (!_titleView1) {
        ZYWeakSelf(self);
        _titleView1 = [[[NSBundle mainBundle] loadNibNamed:@"ZYChannelTitleView" owner:self options:nil] firstObject];
        _titleView1.frame = CGRectMake(0, 0, KScreenWidth, 50);
        [_titleView1 setBlockEdit:^(UIButton *btn) {
            weakself.isEdit = btn.selected;
            [weakself editBtn:btn.selected];
        }];
        
    }
    return _titleView1;
}
-(ZYChannelTitleView *)titleView2{
    if (!_titleView2) {
        _titleView2 = [[[NSBundle mainBundle] loadNibNamed:@"ZYChannelTitleView" owner:self options:nil] firstObject];
        _titleView2.editBtn.hidden = YES;
        [_titleView2.titleLabel setTitle:@"频道推荐" forState:UIControlStateNormal];
        [_titleView2.subTitleLabel setTitle:@"点击添加频道" forState:UIControlStateNormal];
    }
    return _titleView2;
}
-(ZYHomeViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [ZYHomeViewModel shareHomeViewModel];
    }
    return _viewModel;
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]init];
        _topView.layer.cornerRadius = 8;
        _topView.clipsToBounds = YES;
        _topView.backgroundColor = [UIColor whiteColor];
        UIButton *close = [[UIButton alloc]init];
        [close setImage:[UIImage imageNamed:@"close_sdk_login_night_14x14_"] forState:UIControlStateNormal];
        [close addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:close];
        ZYWeakSelf(self);
        [close mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(weakself.topView);
            make.left.equalTo(@(10));
        }];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor blackColor];
        [_topView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(weakself.topView);
            make.height.mas_equalTo(1);
        }];
    }
    return _topView;
}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}
-(instancetype)init{
    if ([super init]) {
        [self setSubViews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setSubViews];
    }
    return self;
}

-(void)setSubViews{

    [self addSubview:self.topView];
   
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(iPhoneX?44:22));
        make.left.right.equalTo(self);
        make.height.mas_equalTo(50);
    }];
    
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).with.offset(-10);
        make.left.right.bottom.equalTo(self);
    }];
    [self.scrollView addSubview:self.titleView1];
    [self.scrollView addSubview:self.titleView2];
   
    ZYWeakSelf(self);
    [self.viewModel loadHomeCategoryRecommend:^{
        [weakself configData];
    }];
    
}

-(void)configData{
   
    [self.categories removeAllObjects];
    if (self.homeTitles.count > 0 && self.viewModel.categories.count > 0) {
        
        for (int i = 0 ; i < self.homeTitles.count; i ++ ) {
            ZYHomeNewTitle *newTitle = [self.homeTitles objectAtIndex:i];
            ZYChannelModel *model = [[ZYChannelModel alloc]init];
            model.name = newTitle.name;
            model.isMyChannel = YES;
            [self.categories addObject:model];
        }
        
        for (int i = 0 ; i < self.viewModel.categories.count; i ++ ) {
            ZYHomeNewTitle *newTitle = [self.viewModel.categories objectAtIndex:i];
            ZYChannelModel *model = [[ZYChannelModel alloc]init];
            model.name = newTitle.name;
            model.isMyChannel = NO;
            [self.categories addObject:model];
        }
        [self refreshFrame];
    }
}

-(void)refreshFrame{
    for (int i = 0; i < self.categories.count; i++) {
        ZYChannelModel *model = self.categories[i];
        model.tag = i;
        if (model.isMyChannel) {
            model.frame = [self channelButtonFrame:i];
            self.divisionModel = model;
        }
    }
    
    self.titleView2.top = CGRectGetMaxY(self.divisionModel.frame) + lineSpace;
    self.titleView2.hidden = NO;
    
    for (int i = 0; i < self.categories.count; i++) {
    
        ZYChannelModel *model = self.categories[i];

        if (!model.isMyChannel) {
            int index = i - self.divisionModel.tag - 1; // 从0开始tag
            model.frame = [self recommendButtonFrame:index];
            
        }
    }
    ZYWeakSelf(self);
    for (ZYChannelModel *model in self.categories) {
        ZYButton *button = [[ZYButton alloc]initWithChannelBlock:^(ZYButton *button) {
            if (!button.deleImageView.hidden) {
                [weakself removeBtn:button];
            }
        } recommondChannelHandleBlock:^(ZYButton *button) {
            if (weakself.isEdit) {
                
                [weakself addButton:button];
            }
        }];
        [button addLongPressBeginBlock:^(ZYButton *btn) {
            [weakself.scrollView addSubview:btn];
        } longPressMoveBlock:^(ZYButton *btn, UILongPressGestureRecognizer *ges) {
            [weakself adjustCenterForBtn:btn withGes:ges];
        } longPressEndBlock:^(ZYButton *btn) {
            [weakself resetBtnFrame:btn];
        }];
        button.model = model;
        if (button.model.name.length > 2) {
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
        }
        if (model.tag == self.categories.count - 1) {
            self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(model.frame) + 50);
        }
        [self.scrollView addSubview:button];
    }
}

-(void)setDivisionModel:(ZYChannelModel *)divisionModel{
    _divisionModel = divisionModel;
    [self refreshTitleView2Frame];
}

-(void)refreshTitleView2Frame{
    if (!self.titleView2.hidden) {
        [UIView animateWithDuration:0.25 animations:^{
            self.titleView2.frame= CGRectMake(0, CGRectGetMaxY(self.divisionModel.frame)+lineSpace, CGRectGetWidth(self.frame), 50);
        }];
    }
}

/**
 点击编辑按键
 */
-(void)editBtn:(BOOL)isEdit{
    
    for (int i = 0; i < self.categories.count; i++) {
        ZYChannelModel *model = self.categories[i];
        model.tag = i;
        if (model.isMyChannel) {
            model.hideDeleBtn = !isEdit;
        }
    }
    [self refreshBtn];
}
/**
 删除按键
 */
-(void)removeBtn:(ZYButton *)button{
    [self.categories removeObject:button.model];
    [self.categories insertObject:button.model atIndex:self.divisionModel.tag];
    button.model.isMyChannel = NO;
    int divisionIndex = self.divisionModel.tag - 1;
    for (int i = 0; i <self.categories.count; i++) {
        ZYChannelModel *model = self.categories[i];
        model.tag = i ;
        if (model.isMyChannel) {
            model.frame = [self channelButtonFrame:i];
            model.hideDeleBtn = NO;
        }else{
            int index = i - self.divisionModel.tag - 1;
            model.frame = [self recommendButtonFrame:index];
            model.hideDeleBtn = YES;
        }
        if (i == divisionIndex) {
            self.divisionModel = model;
        }
    }
    [self refreshBtn];
}

/**
 添加按钮
 */
-(void)addButton:(ZYButton *)addBtn{

    [self.categories removeObject:addBtn.model];
    [self.categories insertObject:addBtn.model atIndex:self.divisionModel.tag + 1];
    addBtn.model.isMyChannel = YES;
    int divisionIndex = self.divisionModel.tag + 1;
    BOOL btnSelect = !self.titleView1.editBtn.selected;
   
    for (int i = 0; i < self.categories.count; i++) {
       
        
        ZYChannelModel *model = self.categories[i];
        model.tag = i;
        if (model.isMyChannel) {
            model.frame = [self channelButtonFrame:i];
            model.hideDeleBtn = btnSelect;
           
        }else{
            int index = i - self.divisionModel.tag -1;
            model.frame = [self recommendButtonFrame:index];
            model.hideDeleBtn = YES;
        }
        if ( i == divisionIndex) {
            self.divisionModel = model;
        }
    }
    [self refreshBtn];
}


/**
 刷新按钮的frame
 */
-(void)refreshBtn{
    for (ZYChannelModel *model in self.categories) {
        [UIView animateWithDuration:0.25 animations:^{
            model.btn.frame = model.frame;
        }];
        model.btn.deleImageView.hidden = model.hideDeleBtn;
        [model.btn reloadData];
    }
}


/**
 移动按键
 */
-(void)adjustCenterForBtn:(ZYButton *)btn withGes:(UILongPressGestureRecognizer *)ges{
    CGPoint newPoint = [ges locationInView:self];
    btn.center = newPoint;
    ZYWeakSelf(self);
    [self newLocationTagForBtn:btn locationBlock:^(ZYChannelModel *targetModel) {
        if (weakself.divisionModel == btn.model) {
            ZYChannelModel *divisionModel = self.categories[btn.model.tag - 1];
            weakself.divisionModel = divisionModel;
        }else if (weakself.divisionModel == targetModel){
            weakself.divisionModel = btn.model;
        }
        [weakself.categories removeObject:btn.model];
        [weakself.categories insertObject:btn.model atIndex:targetModel.tag];
        
        for (int i = 0; i < weakself.categories.count; i++) {
            
            ZYChannelModel *model = self.categories[i];
            model.tag = i;
            if (model.isMyChannel && model != btn.model) {
                model.frame = [self channelButtonFrame:i];
               
            }
        }
        
        for (int i = 0 ; i < weakself.categories.count; i++) {
            ZYChannelModel *model = weakself.categories[i];
            if (model.isMyChannel && model != btn.model) {
                [UIView animateWithDuration:0.25 animations:^{
                    model.btn.frame = model.frame;
                }];
            }
        }
    }];
}

- (void)newLocationTagForBtn:(ZYButton *)moveBtn locationBlock:(void(^)(ZYChannelModel* targetModel))locationBlock{
    ZYChannelModel *moveModel = moveBtn.model;
    CGPoint moveBtnCenter = moveBtn.center;
    NSMutableArray *models = [[NSMutableArray alloc]initWithArray:self.categories];
    for (ZYChannelModel *model in models) {
        if (model != moveModel && model.isMyChannel) {
            if (CGRectContainsPoint(model.frame,moveBtnCenter)) {
                locationBlock(model);
            }
        }
    }
}

/**
 重置按键frame
 */
- (void)resetBtnFrame:(ZYButton *)btn {
    ZYChannelModel *model = btn.model;
    model.frame = [self channelButtonFrame:btn.model.tag];
    
    [UIView animateWithDuration:0.25 animations:^{
        btn.frame = model.frame;
    }];
        
}

-(CGRect)channelButtonFrame:(int)index{
    CGFloat width = (self.frame.size.width - itemSpace *(column + 1))/column;
    CGFloat row = index / column;
    CGFloat col = index % column;
    CGFloat X = itemSpace + (itemSpace + width)*col;
    CGFloat Y = itemSpace + (itemSpace + labelHeight)*row;
    return CGRectMake(X, CGRectGetMaxY(self.titleView1.frame) + lineSpace +Y, width, labelHeight);
}

-(CGRect)recommendButtonFrame:(int)index{
    CGFloat width = (self.frame.size.width - itemSpace *(column + 1))/column;
    CGFloat row = index / column;
    CGFloat col = index % column;
    CGFloat X = itemSpace + (itemSpace + width)*col;
    CGFloat Y = itemSpace + (itemSpace + labelHeight)*row;
    return CGRectMake(X, CGRectGetMaxY(self.divisionModel.frame) + CGRectGetMaxY(self.titleView1.frame) + Y, width, labelHeight);
}

-(void)show{
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finished) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5] ;
    }];
}
-(void)hide{
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, KScreenHeight, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)closeClick{
    [self hide];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    if (y < 0) {
//        self.frame = CGRectMake(0, -y, self.frame.size.width, self.frame.size.height);
//        [self hide];
    }
}

@end
