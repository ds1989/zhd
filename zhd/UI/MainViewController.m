//
//  MainViewController.m
//  zhd
//
//  Created by robbert on 15-10-12.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "MainViewController.h"
#import "MessageViewController.h"
#import "ZDTitleButtom.h"
#import "ZDStatusCell.h"
#import "ZDLoadMoreFooter.h"
#import "ZDStatusFrame.h"
#import "ZDStatus.h"
#import "ZDUser.h"


@interface MainViewController () //<UIActionSheetDelegate,ZDStatusCellDelegate>


@property (nonatomic,strong) NSMutableArray *loadedObjects;
@property (nonatomic,strong) NSMutableArray *needLoadArr;
@property (nonatomic,assign) ZDLoadMoreFooter *footer;
@property (nonatomic,strong) NSArray *statusesFrame;
@property (nonatomic,assign) ZDTitleButtom *titleButton;




@end

@implementation MainViewController

//-(NSMutableArray *)statusesFrame
//{
//    if (_statusesFrame == nil) {
//        _statusesFrame = [NSMutableArray array];
//    }
//    return _statusesFrame;
//}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //[self addAllViews];
    }
    return self;
}

-(void) addAllViews
{
   
   // self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image: [UIImage imageNamed:@"iconfont-message"] tag:100];
}


-(void) addnewStatues
{
    ZDStatusFrame *newStatusFrame = [[ZDStatusFrame alloc] init];
    
    [newStatusFrame setStatus:[ZDStatus transfer]];
  

    
    self.statusesFrame  = [[NSArray alloc]  initWithObjects:newStatusFrame,newStatusFrame, nil];
    //[self.statusesFrame addObject: newStatusFrame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.title = @"首页";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
//    label.text = self.title;
//    label.textColor = [UIColor whiteColor];
//    self.navigationItem.titleView = label;
    
    //self.statusesFrame =
    
    [self addnewStatues];
    
    //1、设置导航栏
    [self setupNavigationItem];
    
    //2、删除分割线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    
    
    //3.刷新控件
  //  self.tableView.backgroundColor =  ZDGlobleTableViewBackgroundColor;
    
    //4.监听更多按钮呗点击通知
//    [[NSNotificationCenter defaultCenter] addobser]
    
}

-(void)setupNavigationItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithBackgroundImageName:@"navigationbar_friendsearch"
                                                                          highBackgroudImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendsearch)];
    
     self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithBackgroundImageName:@"navigationbar_pop" highBackgroudImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
}

-(void) setupCenterTitle
{
    //创建导航中间标题按钮
    ZDTitleButtom *titleButton = [[ZDTitleButtom alloc] init];
    titleButton.height = DSNavigationItemOfTitleViewHeight;
    
    //设置文字
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    
    //设置图标
    UIImage *mainImage = [[UIImage imageWithName:@"main_badge"] scaleImageWithSize:CGSizeMake(10, 10)];
    [titleButton setImage:mainImage forState:UIControlStateNormal];
    
    //设置背景
    [titleButton setBackgroundImage:[UIImage resizableImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    //监听点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    //self.titleButton = titleButton;
    
}

-(void)setupReFresh
{
    //1.添加下拉帅新
    UIRefreshControl *refreshCOntroller = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:refreshCOntroller];
    
    //2.监听状态
    [refreshCOntroller addTarget:self action:@selector(null) forControlEvents:UIControlEventValueChanged];
    
    
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.footer.hidden = self.statusesFrame.count ==0;
    
    return self.statusesFrame.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDStatusCell *cell = [ZDStatusCell cellWithTableView:tableView];
    cell.statusFrame = self.statusesFrame[indexPath.row];
    cell.delegate = self;
    cell.indexpath = indexPath;
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDStatusFrame *statusFrame = self.statusesFrame[indexPath.row];
    return statusFrame.cellHeight;
}



- (void)didCommentButtonClicked:(UIButton *)button indexPath:(NSIndexPath *)indexpath {
    
    
    
    
    
}

- (void)didLikeButtonClicked:(UIButton *)button indexPath:(NSIndexPath *)indexpath {
}

- (void)didMessageButtonClicked:(UIButton *)button indexPath:(NSIndexPath *)indexpath {
    
    
}


- (void)didShareButtonClicked:(UIButton *)button indexPath:(NSIndexPath *)indexpath {
    
   
}

-(void) refreshControlStateChange:(UIRefreshControl *)refreshControl
{
    //加载最新的数据
   // [self lo]
}


- (void)pop
{
    NSLog(@"--扫一扫--");
}
- (void)friendsearch
{
    NSLog(@"--好友搜索--");
}


#pragma mark - Target Action


-(void) pushVC
{
    MessageViewController *MessageView = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:MessageView animated:YES];
    [MessageView release];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
