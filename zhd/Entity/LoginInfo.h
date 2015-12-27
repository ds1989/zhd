//
//  LoginInfo.h
//  zhd
//
//  Created by luoyidong on 15/11/22.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfo : NSObject<NSCoding>

-(id) initWithLoginName:(NSString *)loginName pwd:(NSString *)pwd userId:(NSInteger) userId;
@property(nonatomic,assign) NSInteger UserId;
@property(nonatomic,assign) NSString *UserName;
@property(nonatomic,assign) NSString *Pwd;
@end
