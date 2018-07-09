//
//  ZYButton.m
//  TodayNew
//
//  Created by liqiaona on 2018/7/9.
//  Copyright © 2018年 ZY. All rights reserved.
//

#import "ZYButton.h"
#import <Masonry.h>
#import <MJRefresh.h>
//设置按钮的阴影
static UIBezierPath *pathForBtn(ZYButton *btn){
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = btn.bounds.size.width;
    float height = btn.bounds.size.height;
    float x = btn.bounds.origin.x;
    float y = btn.bounds.origin.y;
    float addWH = 2;
    
    CGPoint topLeft = btn.bounds.origin;
    CGPoint topMiddle = CGPointMake(x+(width / 2), y - addWH);
    CGPoint topRight = CGPointMake(x + width, y);
    
    CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
    
    CGPoint bottomRight  = CGPointMake(x+width,y+height);
    CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
    CGPoint bottomLeft   = CGPointMake(x,y+height);
    
    CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
    [path moveToPoint:topLeft];
    [path addQuadCurveToPoint:topRight controlPoint:topMiddle];
    [path addQuadCurveToPoint:bottomRight controlPoint:rightMiddle];
    [path addQuadCurveToPoint:bottomLeft controlPoint:bottomMiddle];
    [path addQuadCurveToPoint:topLeft controlPoint:leftMiddle];
    return path;
}

static inline void configMyChannelBg(ZYButton *btn){
    btn.backgroundColor = globalBackgroundColor;
    btn.layer.shadowOffset = CGSizeMake(0, 0);
    btn.layer.shadowOpacity = 0;
    btn.layer.shadowColor = nil;
    btn.layer.shadowPath = nil;
}

static inline void configRecommondBg(ZYButton *btn){
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.shadowOffset = CGSizeMake(1, 1);//偏移量
    btn.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    btn.layer.shadowPath = pathForBtn(btn).CGPath;
}


@interface ZYButton()
@property (nonatomic , copy)void (^myChannelBlock)(ZYButton *btn);

@property (nonatomic , copy)void (^recommondBlock)(ZYButton *btn);

@property (nonatomic , copy)void (^beginBlock)(ZYButton *btn);

@property (nonatomic , copy)void (^moveBlock)(ZYButton *btn,UILongPressGestureRecognizer *ges);

@property (nonatomic , copy)void (^endBlock)(ZYButton *btn);
@end
@implementation ZYButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"closeicon_repost_18x18_"]];
        _deleImageView = imageView;
        [self addSubview:_deleImageView];
        [_deleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(18);
            make.right.top.equalTo(self);
        }];
        imageView.hidden = YES;
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]init];
        longPress.minimumPressDuration = 0.25f;//触发长按事件时间为：秒
        [longPress addTarget:self action:@selector(btnLong:)];
        [self addGestureRecognizer:longPress];
        self.layer.cornerRadius = 4;
        //防止圆角卡顿
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return self;
}

-(instancetype)initWithChannelBlock:(void (^)(ZYButton *))channelBlock recommondChannelHandleBlock:(void (^)(ZYButton *))recommondBlock{
    if (self = [super init]) {
        _recommondBlock = recommondBlock;
        _myChannelBlock = channelBlock;
    }
    return self;
}

-(void)addLongPressBeginBlock:(void (^)(ZYButton *))beginBlock longPressMoveBlock:(void (^)(ZYButton *, UILongPressGestureRecognizer *))moveBlock longPressEndBlock:(void (^)(ZYButton *))endBlock{
    _beginBlock = beginBlock;
    _endBlock = endBlock;
    _moveBlock = moveBlock;
}

-(void)setModel:(ZYChannelModel *)model{
    _model = model;
    self.frame = model.frame;
    model.btn = self;
    if (model.isMyChannel) {
        [self setTitle:model.name forState:UIControlStateNormal];
        configMyChannelBg(self);
    }else{
        [self setTitle:[NSString stringWithFormat:@"＋%@",model.name] forState:UIControlStateNormal];
        configRecommondBg(self);
    }
}
-(void)reloadData{
    if (_model.isMyChannel) {
        [self setTitle:self.model.name forState:UIControlStateNormal];
        configMyChannelBg(self);
    }else{
        [self setTitle:[NSString stringWithFormat:@"＋%@",self.model.name] forState:UIControlStateNormal];
        configRecommondBg(self);
    }
}

-(void)btnClick:(ZYButton *)btn{
    
    if (btn.model.isMyChannel) {
        if (_myChannelBlock) {
            _myChannelBlock(btn);
        }
    }else{
        if (_recommondBlock) {
            _recommondBlock(btn);
        }
    }
}

- (void)btnLong:(UILongPressGestureRecognizer *)ges {
    if (self.model.isMyChannel == NO || self.deleImageView.hidden == YES) {
        return;
    }
    if (ges.state == UIGestureRecognizerStateBegan) {
        CGPoint center = self.center;
        [UIView animateWithDuration:0.25 animations:^{
            self.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
            self.center = center;
        }];
    }else if (ges.state == UIGestureRecognizerStateChanged){
        if (_moveBlock) {
            _moveBlock(self,ges);
        }
    }else if (ges.state == UIGestureRecognizerStateEnded){
        if (_endBlock) {
            _endBlock(self);
        }
    }else if (ges.state == UIGestureRecognizerStateCancelled){
        if (_endBlock) {
            _endBlock(self);
        }
    }
}
@end

