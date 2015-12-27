//
//  ChatSession.h
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatSession : NSObject

@property(nonatomic,assign) NSInteger Id;
@property(nonatomic,assign) NSString *ChatType;
@property(nonatomic,assign) NSString *SessionJid;
@property(nonatomic,assign) NSString *Title;
@property(nonatomic,assign) NSString *Image;
@property(nonatomic,assign) NSInteger IsTop;
@property(nonatomic,assign) NSString *LastMsg;
@property(nonatomic,assign) NSString *lastFrom;
@property(nonatomic,assign) NSInteger UnReadNum;
@property(nonatomic,assign) NSInteger TimeStamp;

-(instancetype) initWithId:(NSInteger)Id
                  chatType:(NSString *) chatType
                sessionJid:(NSString *) sessionJid
                    title :(NSString *) title
                    isTop :(NSInteger) isTop
                  lastMsg :(NSString *) lastMsg
                 lastFrom :(NSString *) lastFrom
                unReadNum :(NSInteger) unReadNum
                timeStamp :(NSInteger) timeStamp;


+(instancetype) chatSessionId:(NSInteger)Id
                     chatType:(NSString *) chatType
                   sessionJid:(NSString *) sessionJid
                       title :(NSString *) title
                       isTop :(NSInteger) isTop
                     lastMsg :(NSString *) lastMsg
                    lastFrom :(NSString *) lastFrom
                   unReadNum :(NSInteger) unReadNum
                   timeStamp :(NSInteger) timeStamp;
@end
