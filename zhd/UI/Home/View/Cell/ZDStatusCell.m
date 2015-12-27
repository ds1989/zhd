//
//  ZDStatusCellTableViewCell.m
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusCell.h"
#import "ZDStatusToolbar.h"
#import "ZDStatusDetailView.h"
#import "ZDStatusFrame.h"



@interface ZDStatusCell()

@property (nonatomic , assign) ZDStatusToolbar *toolbar;
@property (nonatomic , assign) BOOL drawed;

@end


@implementation ZDStatusCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"statusCell";
    ZDStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[ZDStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        //添加feed具体内容
        [self setupDetailView];
        
        [self setupToolbar];
    }
    return self;
}

-(void)setupDetailView
{
    ZDStatusDetailView *detailView = [[ZDStatusDetailView  alloc] init];
    [self.contentView addSubview:detailView];
    self.detailView = detailView;
}

-(void)setupToolbar
{
    ZDStatusToolbar *toolbar = [[ZDStatusToolbar alloc] init];
    [toolbar.commentsBtn addTarget:self action:@selector(commentsBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolbar.attitudesBtn addTarget:self action:@selector(attitudesBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolbar.messageBtn addTarget:self action:@selector(messageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolbar.repostsBtn addTarget:self action:@selector(shareBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:toolbar];
    self.toolbar = toolbar;
}

- (void)commentsBtnClicked:(UIButton *)sender{
    
    if ([_delegate respondsToSelector:@selector(didCommentButtonClicked:indexPath:)]){
        [_delegate didCommentButtonClicked:sender indexPath:self.indexpath];
    }
}

- (void)attitudesBtnClicked:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(didLikeButtonClicked:indexPath:)]){
        [_delegate didLikeButtonClicked:sender indexPath:self.indexpath];
    }
}

- (void)messageBtnClicked:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(didMessageButtonClicked:indexPath:)]){
        [_delegate didMessageButtonClicked:sender indexPath:self.indexpath];
    }
}


- (void)shareBtnClicked:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(didShareButtonClicked:indexPath:)]){
        
        [_delegate didShareButtonClicked:sender indexPath:self.indexpath];
    }
}

-(void) setStatusFrame:(ZDStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    self.detailView.detailFrame = statusFrame.statusDetailFrame;
    self.toolbar.frame = statusFrame.statusToolbarFrame;
    self.toolbar.status = statusFrame.status;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
