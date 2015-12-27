//
//  ZDHttpServer.m
//  zhd
//
//  Created by luoyidong on 15/12/27.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDHttpServer.h"

@implementation ZDHttpServer

+(NSData *) startGetRequest:(NSString *)urlPath
{
    NSURL *url = [NSURL URLWithString:urlPath];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    
    //NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    return data;
}

+(NSData *) startPostRequest:(NSString *)urlPath Param:(NSArray *)param
{
    NSURL *url = [NSURL URLWithString:urlPath];
    
    NSString *post = [param componentsJoinedByString:@"&"];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:postData];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    return data;
}

@end
