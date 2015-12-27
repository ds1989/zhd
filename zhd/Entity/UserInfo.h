//
//  UserInfo.h
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>


-(id) initWithUserName:(NSString *)userName pwd:(NSString *)pwd;
@property (nonatomic,assign) NSInteger Id;

@property(nonatomic,assign) NSInteger UserId;

@property(nonatomic,assign) NSString *UserName;
@property(nonatomic,assign) NSString *NickName;
@property(nonatomic,assign) NSString *RealName;
@property(nonatomic,assign) NSString *UserType;
@property(nonatomic,assign) NSString *Sex;
@property(nonatomic,assign) NSString *Mobile;
@property(nonatomic,assign) NSString *Email;
//备注信息
@property(nonatomic,assign) NSString *Signature;
@property(nonatomic,assign) NSString *Province;
@property(nonatomic,assign) NSString *City;
@property(nonatomic,assign) NSString *Birthday;
//星座信息
@property(nonatomic,assign) NSString *horoscope;
@property(nonatomic,assign) NSString *Pwd;
@end
