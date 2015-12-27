//
//  RootViewController.m
//  zhd
//
//  Created by luoyidong on 15/11/18.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "RootViewController.h"

#import "MainViewController.h"
#import "MessageViewController.h"
#import "AddViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"
#import "LoginViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addAllChildView];

}


-(void) addAllChildView
{
    
    //设置根视图控制器
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.tabBarItem.title=@"首页";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_company_home"];
    [mainVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_company_home_select"]];
    // UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    messageVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_dynamic"];
    [messageVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_dynamic_selected"]];
    messageVC.tabBarItem.title = @"消息";
    
    
    
    AddViewController *addVC = [[AddViewController alloc] init];
    addVC.tabBarItem.title = @"添加";
    [self addCenterButtonWithImage:[UIImage imageNamed:@"middleImage"] highlightImage:nil];
    //UINavigationController *addNC =  [[UINavigationController alloc] initWithRootViewController:addVC];
    
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    
    discoverVC.tabBarItem.title = @"发现";
    //UINavigationController *discoverNC =  [[UINavigationController alloc] initWithRootViewController:discoverVC];
    
    MeViewController *meVC = [[MeViewController alloc] init];
    meVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mine_oringin"];
    [meVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mine_selected"]];
    meVC.tabBarItem.title=@"我的";
    
    self.viewControllers = @[mainVC,messageVC,addVC,discoverVC,meVC];
    //[self setViewControllers:arr];
}

//添加中间按钮
- (void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
