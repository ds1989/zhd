//
//  DBHelper.m
//  zhd
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper


-(void) initDB
{
    NSString *configTablePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DBConfig" ofType:@"plist"];
    NSLog(@"configTablePath = %@",configTablePath);
    
    NSDictionary *configTable = [[NSDictionary alloc] initWithContentsOfFile:configTablePath];
    
    //从配置文件获取数据库版本号
    NSNumber *dbConfigVersion = [configTable objectForKey:@"DB_VERSION"];
    if(dbConfigVersion==nil)
    {
        dbConfigVersion = [NSNumber numberWithInt:0];
    }
    //从数据库dbVersionInfo表记录返回的数据库版本号
    int versionNumber = [self dbVersionNubmer];
    
    //版本号不一致
    if([dbConfigVersion intValue] != versionNumber)
    {
        NSString *dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        if(sqlite3_open([dbFilePath UTF8String], &db) != SQLITE_OK)
        {
            sqlite3_close(db);
            NSAssert(NO,@"数据库打开失败.");
        }else
        {
            NSLog(@"数据库升级.....");
            char *err;
            NSString *createtablePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"create_load" ofType:@"sql"];
            
            NSString *sql = [[NSString alloc] initWithContentsOfFile:createtablePath encoding:NSUTF8StringEncoding error:nil];
            if(sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err)!=SQLITE_OK)
            {
                NSLog(@"数据库审计失败原因：%@",[NSMutableString stringWithCString:err encoding:NSUTF8StringEncoding]);
            }
            //把当前版本号写回到文件中
            //把当前版本号写回到文件中
            NSString* usql = [[NSString alloc] initWithFormat: @"update  DBVersionInfo set version_number = %i", [dbConfigVersion intValue]];
            if (sqlite3_exec(db,[usql UTF8String],NULL,NULL,&err) != SQLITE_OK) {
                NSLog(NO,@"更新DBVersionInfo数据失败。");
            }
            
            sqlite3_close(db);
        }
    }
}

- (int) dbVersionNubmer
{
    NSString* dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
    
    int versionNubmer = -1;
    
    if (sqlite3_open([dbFilePath UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(NO,@"数据库打开失败。");
    } else {
        NSString* sql = @"create table if not exists DBVersionInfo ( version_number int );";
        if (sqlite3_exec(db,[sql UTF8String],NULL,NULL,NULL) != SQLITE_OK) {
            NSLog(NO,@"创建表失败。");
        }
        
        NSString* qsql = @"select version_number from DBVersionInfo";
        
        sqlite3_stmt *statement;
		//预处理过程
		if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
			if (sqlite3_step(statement) == SQLITE_ROW) { //有数据情况
                NSLog(@"有数据情况");
                versionNubmer = sqlite3_column_int(statement, 0);
			} else {//无数据情况，插入数据
                NSLog(@"无数据情况");
                NSString* csql = @"insert into DBVersionInfo (version_number) values(-1)";
                if (sqlite3_exec(db,[csql UTF8String],NULL,NULL,NULL) != SQLITE_OK) {
                    NSLog(NO,@"插入数据失败。");
                }
            }
		}
		
		sqlite3_finalize(statement);
		sqlite3_close(db);
    }
    
    return versionNubmer;
}




+(NSString *)applicationDocumentsDirectoryFile:(NSString *)fileName
{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:fileName];
    return path;
}
@end
