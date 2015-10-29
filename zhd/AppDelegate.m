//
//  AppDelegate.m
//  zhd
//
//  Created by robbert on 15-10-7.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MessageViewController.h"
#import "AddViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //设置根视图控制器
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNC = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    AddViewController *addVC = [[AddViewController alloc] init];
    UINavigationController *addNC =  [[UINavigationController alloc] initWithRootViewController:addVC];
    
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    UINavigationController *discoverNC =  [[UINavigationController alloc] initWithRootViewController:discoverVC];
    
    MeViewController *meVC = [[MeViewController alloc] init];
    UINavigationController *meNC =  [[UINavigationController alloc] initWithRootViewController:meVC];
    
    NSArray *arr = @[mainNC,messageNC,addNC,discoverNC,meNC];
    
    UITabBarController *tabBC = [UITabBarController new];
    tabBC.viewControllers = arr;
    mainVC.tabBarItem.badgeValue = @"1";
    
    tabBC.tabBar.tintColor = [UIColor colorWithRed:70/225 green:170/225 blue:0 alpha:1.0];
    
    //[[UINavigationBar appearance] setB]
    
    //[[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    
    self.window.rootViewController = tabBC;
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
