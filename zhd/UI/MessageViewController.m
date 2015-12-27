//
//  MessageViewController.m
//  quhuodong
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "MessageViewController.h"
#import "ChatSessionCell.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self addAllView];
    }
    return self;
}
-(void) addAllView
{
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"信息" image:[UIImage imageNamed:@"iconfont-message"] tag:100];
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[[self tableView] setcontent]
    self.title = @"信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.text = self.title;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    [self loadData];
    
}
-(void) loadData
{
    ChatSession *session1 = [ChatSession  chatSessionId:1 chatType:@"1" sessionJid:@"1234" title:@"A发了信息过来" isTop:1 lastMsg:@"发送内容" lastFrom:@"weichat1" unReadNum:3 timeStamp:12345];
    ChatSession *session2 = [ChatSession  chatSessionId:1 chatType:@"1" sessionJid:@"1234" title:@"A发了信息过来" isTop:1 lastMsg:@"发送内容" lastFrom:@"weichat2" unReadNum:3 timeStamp:12345];
    ChatSession *session3 = [ChatSession  chatSessionId:1 chatType:@"1" sessionJid:@"1234" title:@"A发了信息过来" isTop:1 lastMsg:@"发送内容" lastFrom:@"weichat3" unReadNum:3 timeStamp:12345];
    ChatSession *session4 = [ChatSession  chatSessionId:1 chatType:@"1" sessionJid:@"1234" title:@"A发了信息过来" isTop:1 lastMsg:@"发送内容" lastFrom:@"weichat4" unReadNum:3 timeStamp:12345];
    ChatSession *session5 = [ChatSession  chatSessionId:1 chatType:@"1" sessionJid:@"1234" title:@"A发了信息过来" isTop:1 lastMsg:@"发送内容" lastFrom:@"weichat5" unReadNum:3 timeStamp:12345];
    
    [self.chatSessionDataArray addObject:session1];
    [self.chatSessionDataArray addObject:session2];
    [self.chatSessionDataArray addObject:session3];
    [self.chatSessionDataArray addObject:session4];
    [self.chatSessionDataArray addObject:session5];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.chatSessionDataArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"weChat";
    ChatSessionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell)
    {
        cell = [[ChatSessionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    ChatSession *chatSession = self.chatSessionDataArray[indexPath.row];
    cell.chatSession = chatSession;
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 70;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *) chatSessionDataArray
{
    if(!_chatSessionDataArray)
    {
        self.chatSessionDataArray = [NSMutableArray array];
    }
    return _chatSessionDataArray;
}
@end
