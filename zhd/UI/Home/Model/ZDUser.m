//
//  ZDUser.m
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDUser.h"

@implementation ZDUser


+(ZDUser *)readLocalUser
{
    ZDUser *user = [[ZDUser alloc] init];
    
    user.userId= @"123";
    user.username=@"浮云东";
    
    return user;
}

@end
