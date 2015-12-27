//
//  UserData.m
//  zhd
//
//  Created by luoyidong on 15/11/19.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginData.h"
#import "LoginInfo.h"

#define UserInfoKey @"UserInfo"
@implementation LoginData


-(void)writeUserDataInDoc:(LoginInfo *)userInfo
{
    //文件的归档
    NSMutableData *data = [NSMutableData data ];
    //创建一个归档类
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:userInfo forKey:UserInfoKey];
    [archiver finishEncoding];
    [archiver release];
    [data writeToFile:[self filePath] atomically:YES];
}

-(LoginInfo *)getUserInfoByDoc
{
    NSMutableData *data = [NSMutableData dataWithContentsOfFile:[self filePath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    LoginInfo *loginInfo = [unarchiver decodeObjectForKey:UserInfoKey];
    return loginInfo;
}

-(NSString *)filePath {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [docPath stringByAppendingPathComponent:@"UserData"];
    
    return path;
}

-(BOOL) IsLogin
{
    NSFileManager *fileMananger = [NSFileManager defaultManager];
    return [fileMananger fileExistsAtPath:[self filePath] isDirectory:NO];
}

@end
