//
//  MessageViewController.h
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatSession.h"
@interface MessageViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *chatSessionDataArray;
@property (nonatomic,strong) ChatSession *chatSession;
@end
