//
//  ZDStatus.m
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatus.h"
#import "ZDUser.h"

@implementation ZDStatus

+(ZDStatus *) transfer
{
    ZDStatus *status = [[ZDStatus alloc] init];
    status.created_at = @"2010-10-10";
    status.comments_count = 2;
    status.idstr = @"1234";
    status.text = @"asdfaaaaaaaaaaa";
    status.source = @"空";
    
    status.comments = [[NSArray alloc] initWithObjects:@"ab",@"bc", nil];
    
    status.reposts_count = 3;
    
    status.comments_count = 4;
    
    status.attitudes_count = 5;
    
   // NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    //[attr addAttribute:NSFontAttributeName value:<#(nonnull id)#> range:<#(NSRange)#>]
    
    status.attributedText =[[NSAttributedString alloc] initWithString:@"asdfasdf"];
    
    status.pic_urls = [[NSArray alloc] initWithObjects:@"123",@"12", nil];
    
    status.digusers = [[NSArray alloc] initWithObjects:@"空", nil];
   // ZDUser *zdUser = [[ZDUser alloc] init];
    
    status.user =[ZDUser readLocalUser];
    
    
    return status;
}
@end
