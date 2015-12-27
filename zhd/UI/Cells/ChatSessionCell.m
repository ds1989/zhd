//
//  ChatSessionCell.m
//  zhd
//
//  Created by robbert on 15-10-26.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "ChatSessionCell.h"
#import "ChatSession.h"

@implementation ChatSessionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self addAllViews];
    }
    return self;
}

- (void) addAllViews
{
    self.contactImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    _contactImageView.backgroundColor = [UIColor blackColor];
  //  _contactImageView.layer.cornerRadius = 10;
    [self.contentView addSubview:_contactImageView];
    
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_contactImageView.frame.size.width + 20, 10, 200, 30)];
    _nameLabel.text = @"小八。";
    _nameLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [self.contentView addSubview:_nameLabel];
    
    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + 30, 300, 30)];
    _infoLabel.text = @"关注“固原广电网络的萨芬嘎嘎嘎法规法规挨个发嘎嘎”";
    _infoLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    _infoLabel.numberOfLines = 0;
    [self.contentView addSubview:_infoLabel];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(335, _nameLabel.frame.origin.y, 100, 30)];
    _dateLabel.text = @"15/8/31";
    _dateLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    [self.contentView addSubview:_dateLabel];
}

-(void) setChatSession:(ChatSession *)chatSession
{
    _nameLabel.text = chatSession.Title;
    _infoLabel.text = chatSession.LastMsg;
//    _dateLabel.text =[self getDateFormat:chatSession.TimeStamp];
    _dateLabel.text = @"2015-10-27";
    _contactImageView.image = [UIImage  imageNamed:chatSession.lastFrom];;
    
}
-(NSString *) getDateFormat:(int) timstamp
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:[NSString stringWithFormat:@"%d",timstamp]]; //------------将字符串按formatter转成nsdate
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring
    return nowtimeStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
