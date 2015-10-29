//
//  ChatSessionCell.h
//  zhd
//
//  Created by robbert on 15-10-26.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatSession;

@interface ChatSessionCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *infoLabel;
@property (nonatomic,strong) UIImageView *contactImageView;
@property (nonatomic,strong) ChatSession *chatSession;

@end
