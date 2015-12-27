//
//  UserData.h
//  zhd
//
//  Created by luoyidong on 15/11/19.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginInfo.h"

@interface LoginData : NSObject

-(void)writeUserDataInDoc:(LoginInfo *)userInfo;

-(LoginInfo *)getUserInfoByDoc;

-(BOOL) IsLogin;

@end
