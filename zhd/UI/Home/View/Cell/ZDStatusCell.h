//
//  ZDStatusCellTableViewCell.h
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZDStatusFrame,ZDStatusdetail,ZDStatusDetailView;


@protocol ZDStatusCellDelegate <NSObject>

-(void) didCommentButtonClicked:(UIButton *) button indexPath:(NSIndexPath *)indexpath;
-(void) didLikeButtonClicked:(UIButton *) button indexPath:(NSIndexPath *)indexpath;
-(void) didMessageButtonClicked:(UIButton *)button indexPath:(NSIndexPath *)indexpath;
-(void) didShareButtonClicked:(UIButton *)button indexPath:(NSIndexPath *)indexpath;

@end

@interface ZDStatusCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic , strong) ZDStatusFrame *statusFrame;

@property (nonatomic , assign) ZDStatusDetailView *detailView;

@property (nonatomic , strong) id<ZDStatusCellDelegate>delegate;

@property (nonatomic , strong) NSIndexPath *indexpath;


@end
