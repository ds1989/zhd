//
//  ZDStatusDetailFrame.h
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZDStatus,ZDStatusOriginalFrame,ZDStatusRetweetedFrame;

@interface ZDStatusDetailFrame : NSObject

// 1.自己的frame
@property (nonatomic , assign) CGRect frame;

// 2.数据
@property (nonatomic , strong) ZDStatus *status;

// 3.转发Feed frame
@property (nonatomic ,strong) ZDStatusRetweetedFrame *retweetedFrame;

// 4.原始Feed frame
@property (nonatomic , strong) ZDStatusOriginalFrame *originalFrame;

@end
