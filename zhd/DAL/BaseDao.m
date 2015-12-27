//
//  BaseDao.m
//  zhd
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "BaseDao.h"

@implementation BaseDao

-(id)init
{
    self = [super init];
    if(self)
    {
        self.dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        DBHelper *dbhelper = [DBHelper new];
        [dbhelper initDB];
    }
    return self;
}

-(BOOL) openDB
{
    NSLog(@"dbFilePath =%@",self.dbFilePath);
    if(sqlite3_open([self.dbFilePath UTF8String], &db) !=SQLITE_OK)
    {
        sqlite3_close(db);
        NSLog(@"数据库打开失败.");
        return false;
    }
    return true;
}

@end
