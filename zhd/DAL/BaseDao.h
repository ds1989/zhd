//
//  BaseDao.h
//  zhd
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "DBHelper.h"


@interface BaseDao : NSObject
{
    sqlite3 *db;
}

@property(nonatomic,strong) NSString *dbFilePath;

-(BOOL) openDB;
@end
