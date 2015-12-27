//
//  ZDStatusToolbar.h
//  zhd
//
//  Created by luoyidong on 15/12/8.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZDStatus;

@interface ZDStatusToolbar : UIImageView


@property (nonatomic , strong) ZDStatus *status;

@property (nonatomic , assign) UIButton *repostsBtn;
@property (nonatomic , assign) UIButton *commentsBtn;
@property (nonatomic , assign) UIButton *attitudesBtn;
@property (nonatomic , assign) UIButton *messageBtn;

@end
