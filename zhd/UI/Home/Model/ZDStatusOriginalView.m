//
//  ZDStatusOriginalView.m
//  zhd
//
//  Created by luoyidong on 15/12/16.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusOriginalView.h"
#import "ZDStatusLabel.h"
#import "ZDStatusUserHeadView.h"
#import "ZDStatusPhotosView.h"
#import "ZDStatusOriginalFrame.h"
#import "ZDUser.h"
#import "ZDStatus.h"

@interface ZDStatusOriginalView()

//昵称
@property (nonatomic, assign) UILabel *nameLabel;
//正文
@property (nonatomic,assign)  ZDStatusLabel *textLabel;
//来源
@property (nonatomic,assign) UILabel *sourceLabel;

//时间
@property (nonatomic,assign) UILabel *timeLabel;

//头像
@property (nonatomic,assign) ZDStatusUserHeadView *iconView;

//会员图标
@property (nonatomic,assign) UIImageView *vipView;

//更多图标
@property (nonatomic,assign) UIButton *moreBtn;

//配图
@property (nonatomic,assign) ZDStatusPhotosView *phptosView;
@end

@implementation ZDStatusOriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //两个属性设置背景色时候用到
        self.userInteractionEnabled = YES;
        self.opaque = YES;
        
        //昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = DSStatusOriginalNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        //正文
        ZDStatusLabel *textLabel = [[ZDStatusLabel alloc] init];
        
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        //时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = DSColor(242, 153, 92);
        timeLabel.font = DSStatusOriginalTimeFont;
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        
        //来源
        UILabel *sourceLabel = [[UILabel alloc] init];
        sourceLabel.textColor = DSColor(113, 113, 113);
        
        sourceLabel.font = DSStatusOriginalSourceFont;
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        //头像
        ZDStatusUserHeadView *iconView = [[ZDStatusUserHeadView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //会员图标
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.contentMode = UIViewContentModeCenter;
        [self addSubview:vipView];
        
        //更对按钮
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setImage:[UIImage imageNamed:@"timeline_icon_more"] forState:UIControlStateNormal];
        [moreBtn setImage:[UIImage imageNamed:@"timeline_icon_more_highlighted"] forState:UIControlStateHighlighted];
        [moreBtn addTarget:self action:@selector(moreBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
        self.moreBtn = moreBtn;
        moreBtn.adjustsImageWhenDisabled = NO;
        [self addSubview:moreBtn];
        
        //配图
        ZDStatusPhotosView *photosView = [[ZDStatusPhotosView alloc] init];
        [self addSubview:photosView];
        self.phptosView = photosView;
        
    }
    return self;
}

-(void)setOriginalFrame:(ZDStatusOriginalFrame *)originalFrame
{
    _originalFrame = originalFrame;
    self.frame = originalFrame.frame;
    
    //取出数据
    ZDStatus *status = originalFrame.status;
    
    //取出用户数据
    ZDUser *user = status.user;
    
    //昵称
    self.nameLabel.text = user.username;
    self.nameLabel.frame = originalFrame.nameFrame;
    
    //正文
    
    self.textLabel.attributeText = status.attributedText;
    self.textLabel.frame = originalFrame.textFrame;
    
    //时间
    NSString *time = status.created_at;
    self.timeLabel.text = time;
    CGFloat timeX =CGRectGetMinX(self.nameLabel.frame);
    CGFloat timeY = CGRectGetMaxY(self.nameLabel.frame) +DSStatusCellInset*0.5;
    CGSize timeSize = [time sizeWithFont:DSStatusOriginalTimeFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.timeLabel.frame = (CGRect){{timeX,timeY},timeSize};
    
    //来源
    self.sourceLabel.text = status.source;
    CGFloat sourceX = CGRectGetMaxX(self.timeLabel.frame) +DSStatusCellInset;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:DSStatusOriginalTimeFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.sourceLabel.frame = (CGRect){{ sourceX,sourceY},sourceSize};
    
    //头像
    self.iconView.frame = originalFrame.iconFrame;
    [self.iconView setImage:[UIImage imageNamed:@"avatar_default_small"]];
   //有问题
    
    //配图
    if (status.pic_urls.count) {
        self.phptosView.frame = originalFrame.photosFrame;
        self.phptosView.picUrls = status.pic_urls;
        self.phptosView.hidden = NO;
    }else
    {
        self.phptosView.hidden = YES;
    }
}

@end
