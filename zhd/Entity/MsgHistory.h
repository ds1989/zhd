//
//  MsgHistory.h
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MsgHistory : NSObject

@property(nonatomic,assign) NSInteger Id;
@property(nonatomic,assign) NSString *MsgType;
@property(nonatomic,assign) NSString *SessionJid;
@property(nonatomic,assign) NSString *Msg;
@property(nonatomic,assign) NSString *SenderJid;
@property(nonatomic,assign) NSString *SenderNickName;
@property(nonatomic,assign) NSString *HandleAction;
@property(nonatomic,assign) NSInteger TimeStamp;


@end
