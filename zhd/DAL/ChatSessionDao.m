//
//  ChatSessionDao.m
//  zhd
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "ChatSessionDao.h"

@implementation ChatSessionDao

static ChatSessionDao *shareManager = nil;

+(ChatSessionDao*)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[super alloc] init];
    });
    return shareManager;
}

-(int) DeleteChatSession:(NSInteger)Id
{
    if([self openDB])
    {
        NSString *str = @"Delete chat_session where id=?";
        sqlite3_stmt *statement;
        //预处理
        if(sqlite3_prepare_v2(db, [str UTF8String], -1, &statement, NULL))
        {
            sqlite3_bind_int(statement,1,Id);
           
            if(sqlite3_step(statement)!=SQLITE_DONE)
            {
              
                NSAssert(NO,@"删除会话失败");
            }
        }
       sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;
}

-(NSMutableArray*) GetAllSessions
{
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    if([self openDB]){
    NSString *sqlCmd = @"SELECT id,chat_type,session_jid,title,image,is_top,last_msg,last_from,unread_num,timestamp FROM chat_session ";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sqlCmd UTF8String], -1, &statement, NULL )==SQLITE_OK)
    {
             
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            ChatSession* chatSession = [[ChatSession alloc] init];
            chatSession.Id = (NSInteger)sqlite3_column_int(statement, 0);
            chatSession.ChatType = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 1)] ;
            chatSession.SessionJid = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 2)] ;
            chatSession.Title = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 3)] ;
            chatSession.Image = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 4)] ;
            chatSession.IsTop = (NSInteger)sqlite3_column_int(statement, 5) ;
            chatSession.LastMsg = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 6)] ;
            chatSession.lastFrom = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 7)] ;
            chatSession.UnReadNum = (NSInteger)sqlite3_column_int(statement, 8) ;
            chatSession.TimeStamp = (NSInteger)sqlite3_column_int(statement, 9) ;
            [listData addObject:chatSession];
            
        }
        
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    }
    return  listData;
}

-(ChatSession *)findSessionBy:(NSString *)sessionID
{
    NSString *sqlCmd = @"SELECT id,chat_type,session_jid,title,image,is_top,last_msg,last_from,unread_num,timestamp FROM chat_session WHERE session_id=?";
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sqlCmd UTF8String], -1, &statement, NULL )==SQLITE_OK)
    {
        sqlite3_bind_text(statement, 1, [sessionID UTF8String], -1, NULL);
        
        if(sqlite3_step(statement)==SQLITE_ROW)
        {
             ChatSession* chatSession = [[ChatSession alloc] init];
            chatSession.Id = (NSInteger)sqlite3_column_int(statement, 0);
            chatSession.ChatType = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 1)] ;
            chatSession.SessionJid = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 2)] ;
            chatSession.Title = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 3)] ;
            chatSession.Image = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 4)] ;
            chatSession.IsTop = (NSInteger)sqlite3_column_int(statement, 5) ;
            chatSession.LastMsg = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 6)] ;
            chatSession.lastFrom = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 7)] ;
            chatSession.UnReadNum = (NSInteger)sqlite3_column_int(statement, 8) ;
            chatSession.TimeStamp = (NSInteger)sqlite3_column_int(statement, 9) ;
            
            sqlite3_finalize(statement);
            sqlite3_close(db);
            return  chatSession;
        }
       
        
       
    }
  
    return nil;
}

-(int) ModifiChatSession:(ChatSession *)model
{
    if([self openDB])
    {
        char *err;
        sqlite3_exec(db, "BEGIN IMMEDIATE TRANSACTION", NULL, NULL, &err);
        
        if(sqlite3_exec(db, "UPDATE chat_session set is_top =0", NULL, NULL, &err)!=SQLITE_OK)
        {
            sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
            NSAssert(NO, @"修改置顶失败");
        }
        
        NSString *sqlStr = @"UPDATE chat_session SET is_top=?,last_msg=?,last_from=?,unread_num=?,timestamp=? WHERE session_jid=? ";
        sqlite3_stmt *statement;
        //预处理
        if(sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL))
        {
            sqlite3_bind_int(statement, 1, 1);
            sqlite3_bind_text(statement, 2, [model.LastMsg UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.lastFrom UTF8String], -1, NULL);
            sqlite3_bind_int(statement, 4, model.UnReadNum);
            sqlite3_bind_int(statement, 5, model.TimeStamp);
              sqlite3_bind_text(statement, 6, [model.SessionJid UTF8String], -1, NULL);
            if(sqlite3_step(statement)!=SQLITE_DONE)
            {
                sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
                NSAssert(NO,@"修改数据失败");
            }
        }
        sqlite3_exec(db, "COMMIT TRANSACTION", NULL, NULL, &err);
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;

}

-(int) InsertChatSession:(ChatSession *)model
{
    if([self openDB])
    {
        NSString *sqlStr = @"INSERT INTO chat_session(chat_type,session_jid,title,image,is_top,last_msg,last_from,unread_num,timestamp) VALUES(?,?,?,?,?,?,?,?,?)";
        sqlite3_stmt *statement;
        //预处理
        if(sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL))
        {
            sqlite3_bind_text(statement, 1, [model.ChatType UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.SessionJid UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.Title UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.Image UTF8String], -1, NULL);
            sqlite3_bind_int(statement, 5, model.IsTop);
            sqlite3_bind_text(statement, 6, [model.LastMsg UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 7, [model.lastFrom UTF8String], -1, NULL);
            sqlite3_bind_int(statement, 8, model.UnReadNum);
            sqlite3_bind_int(statement, 9, model.TimeStamp);
            
            if(sqlite3_step(statement)!=SQLITE_DONE)
            {
                NSAssert(NO,@"添加数据失败");
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;
}
@end
