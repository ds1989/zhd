//
//  ZDLoadMoreFooter.m
//  zhd
//
//  Created by luoyidong on 15/12/21.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDLoadMoreFooter.h"

@interface ZDLoadMoreFooter()

@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;


@property (retain, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ZDLoadMoreFooter

+ (instancetype) footer
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZDLoadMoreFooter" owner:nil options:nil] lastObject];
}

-(void)beginRefreshing
{
    self.statusLabel.text = @"正在拼命加载数据....";
    [self.loadingView startAnimating];
    self.refreshing = YES;
}
-(void) endRefreshing
{
    self.statusLabel.text = @"没有更多数据了";
    [self.loadingView stopAnimating];
    self.refreshing = NO;
}


- (void)dealloc {
    [_loadingView release];
    [_statusLabel release];
    [super dealloc];
}
@end
