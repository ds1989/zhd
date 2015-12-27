//
//  LoginInfo.m
//  zhd
//
//  Created by luoyidong on 15/11/22.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "LoginInfo.h"

@implementation LoginInfo

-(id) initWithLoginName:(NSString *)loginName pwd:(NSString *)pwd userId:(NSInteger) userId
{
    if (self=[super init]) {
        self.UserName = loginName;
        self.Pwd = pwd;
        self.UserId = userId;
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.UserName = [aDecoder decodeObjectForKey:@"UserName"];
        self.Pwd = [aDecoder decodeObjectForKey:@"Pwd"];
        self.UserId = [aDecoder decodeIntegerForKey:@"UserId"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
   // [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.UserName forKey:@"UserName"];
    [aCoder encodeObject:self.Pwd forKey:@"Pwd"];
    [aCoder encodeInteger:self.UserId forKey:@"UserId"];
    
}

@end
