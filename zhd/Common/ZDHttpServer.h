//
//  ZDHttpServer.h
//  zhd
//
//  Created by luoyidong on 15/12/27.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDHttpServer : NSObject


+(NSData *) startGetRequest:(NSString *)urlPath;

+(NSData *) startPostRequest:(NSString *)urlPath Param:(NSArray *)param;


@end
