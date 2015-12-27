//
//  UserInfo.m
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

-(id) initWithUserName:(NSString *)userName pwd:(NSString *)pwd
{
    if( self =[super init])
    {
        self.UserName = userName;
        self.Pwd = pwd;
    }
    return self;
}


-(id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.UserName = [aDecoder decodeObjectForKey:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    
}
@end
