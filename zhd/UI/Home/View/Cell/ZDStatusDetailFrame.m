//
//  ZDStatusDetailFrame.m
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusDetailFrame.h"
#import "ZDStatusOriginalFrame.h"
#import "ZDStatus.h"

@implementation ZDStatusDetailFrame

-(void)setStatus:(ZDStatus *)status
{
    _status = status;
    
    //计算原始feed的frame
    ZDStatusOriginalFrame *originalFrame = [[ZDStatusOriginalFrame alloc] init];
    originalFrame.status = status;
    
    self.originalFrame = originalFrame;
    
    //计算转发feed的frame
    CGFloat h = CGRectGetMaxY(originalFrame.frame);
    
    //计算自己的frame
    CGFloat x = 0;
    CGFloat y = DSStatusCellMargin;
    CGFloat w = ZDScreenWidth;
    self.frame = CGRectMake(x, y, w, h);
}

@end
