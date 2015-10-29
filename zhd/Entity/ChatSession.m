//
//  ChatSession.m
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "ChatSession.h"

@implementation ChatSession

-(instancetype) initWithId:(NSInteger)Id chatType:(NSString *)chatType sessionJid:(NSString *)sessionJid title:(NSString *)title isTop:(NSInteger)isTop lastMsg:(NSString *)lastMsg lastFrom:(NSString *)lastFrom unReadNum:(NSInteger)unReadNum timeStamp:(NSInteger)timeStamp
{
    if(self = [super init])
    {
        _Id = Id;
        _ChatType = chatType;
        _SessionJid = sessionJid;
        _Title = title;
        _IsTop = isTop;
        _LastMsg = lastMsg;
        _lastFrom = lastFrom;
        _UnReadNum = unReadNum;
        _TimeStamp = timeStamp;
        
        
    }
    return self;
}
+(instancetype) chatSessionId:(NSInteger)Id chatType:(NSString *)chatType sessionJid:(NSString *)sessionJid title:(NSString *)title isTop:(NSInteger)isTop lastMsg:(NSString *)lastMsg lastFrom:(NSString *)lastFrom unReadNum:(NSInteger)unReadNum timeStamp:(NSInteger)timeStamp
{
    return [[ChatSession alloc] initWithId:Id chatType:chatType sessionJid:sessionJid title:title isTop:isTop lastMsg:lastMsg lastFrom:lastFrom unReadNum:unReadNum timeStamp:timeStamp];
}

@end
