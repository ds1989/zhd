//
//  ZDStatusFrame.h
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZDStatus,ZDStatusDetailFrame;

@interface ZDStatusFrame : NSObject


//Feed模型
@property (nonatomic , strong) ZDStatus *status;

//Feed detail frame
@property (nonatomic , strong) ZDStatusDetailFrame *statusDetailFrame;

//工具条frame
@property (nonatomic , assign) CGRect statusToolbarFrame;

//cell高度
@property (nonatomic , assign) CGFloat cellHeight;


//cell frame
@property (nonatomic , assign) CGRect frame;
@end
