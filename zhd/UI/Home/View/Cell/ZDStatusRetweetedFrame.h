//
//  ZDStatusRetweetedFrame.h
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZDStatus;

@interface ZDStatusRetweetedFrame : NSObject

/** 昵称 */
//@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 转发微博模型 */
@property (nonatomic, strong) ZDStatus *retweetedStatus;
/** 相册的frame */
@property (nonatomic, assign) CGRect photosFrame;
/** 自己的frame */
@property (nonatomic, assign) CGRect frame;
@end
