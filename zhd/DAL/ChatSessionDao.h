//
//  ChatSessionDao.h
//  zhd
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "BaseDao.h"
#import "ChatSession.h"
@interface ChatSessionDao : BaseDao

//插入数据
-(int) InsertChatSession:(ChatSession*)model;
-(int) ModifiChatSession:(ChatSession*)model;
-(ChatSession*)findSessionBy:(NSString*)sessionID;
-(NSMutableArray*) GetAllSessions;
+(ChatSessionDao*)shareManager;
-(int) DeleteChatSession:(NSInteger) Id;
@end
