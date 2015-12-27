//
//  ZDLoadMoreFooter.h
//  zhd
//
//  Created by luoyidong on 15/12/21.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDLoadMoreFooter : UIView


+(instancetype) footer;

-(void)beginRefreshing;

-(void)endRefreshing;

@property (nonatomic,assign) BOOL refreshing;

@end
