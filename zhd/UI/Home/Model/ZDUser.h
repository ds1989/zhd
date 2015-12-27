//
//  ZDUser.h
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
@class ZDUser;
@interface ZDUser : NSObject

//用户名字
@property (nonatomic , copy) NSString *username;

//用户id
@property (nonatomic , copy) NSString *userId;

//用户头像
@property (nonatomic , copy) NSString *avatarUrl;

//用户等级
@property (nonatomic , assign) int mbrank;

//性别
@property (nonatomic , copy) NSString *gender;



+ (ZDUser *)readLocalUser;
@end
