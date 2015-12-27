//
//  ZDStatusFrame.m
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusFrame.h"
#import "ZDStatusDetailFrame.h"
#import "ZDStatus.h"

@implementation ZDStatusFrame

-(void)setStatus:(ZDStatus *)status
{
    _status = status;
    
    [self setupStatusDetailFrame];
    [self setupStatusToolbarFrame];
    
    self.cellHeight = CGRectGetMaxY(self.statusToolbarFrame);
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = ZDScreenWidth;
    CGFloat h = CGRectGetMaxY(self.statusToolbarFrame);
    self.frame = CGRectMake(x,y, w, h);
    
    
}


-(void) setupStatusDetailFrame
{
    ZDStatusDetailFrame *dtailFrame = [[ZDStatusDetailFrame alloc] init];
    dtailFrame.status = self.status;
    
    self.statusDetailFrame = dtailFrame;
}

-(void) setupStatusToolbarFrame
{
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.statusDetailFrame.frame);
    CGFloat toolbarW = ZDScreenWidth;
    CGFloat toolbarH = DSStatusToolbarWidth;
    
    self.statusToolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
}
@end
