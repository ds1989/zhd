//
//  MainViewController.m
//  zhd
//
//  Created by robbert on 15-10-12.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "MainViewController.h"
#import "MessageViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self addAllViews];
    }
    return self;
}

-(void) addAllViews
{
   
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image: [UIImage imageNamed:@"iconfont-message"] tag:100];
}

//
//
//-(void) loadView
//{
//    distanceBetweenButton = 6.0;
//    UIView *baseView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//    baseView.backgroundColor = [UIColor purpleColor];
//    self.view = baseView;
//    [baseView release];
//    
//    //添加tab 导航
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
//    titleView.backgroundColor = [UIColor orangeColor];
//    UIButton *btnDynamic =[UIButton buttonWithType:UIButtonTypeCustom];
//    [btnDynamic setSelected:YES];
////    [btnDynamic setFont:[UIFont systemFontOfSize:15.0]];
//    [btnDynamic setTitle:@"动态" forState:UIControlStateNormal];
//    [btnDynamic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnDynamic setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
//    [btnDynamic setTag:0];
//    currentTag = [btnDynamic tag];
//    [btnDynamic addTarget:self action:@selector(changeMainControl:) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    UIButton *btnSquare =[UIButton buttonWithType:UIButtonTypeCustom];
////    [btnSquare setFont:[UIFont systemFontOfSize:15.0]];
//    [btnSquare setTitle:@"广场" forState:UIControlStateNormal];
//    [btnSquare setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnSquare setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
//    [btnSquare setTag:1];
//    currentTag = [btnDynamic tag];
//    [btnSquare addTarget:self action:@selector(changeMainControl:) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    UIButton *btnMyAct =[UIButton buttonWithType:UIButtonTypeCustom];
////    [btnMyAct setFont:[UIFont systemFontOfSize:15.0]];
//    [btnMyAct setTitle:@"我的活动" forState:UIControlStateNormal];
//    [btnMyAct setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnMyAct setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
//    [btnMyAct setTag:2];
//    [btnMyAct addTarget:self action:@selector(changeMainControl:) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    [titleView addSubview:btnMyAct];
//    [btnMyAct release];
//    
//    //下划线
//    CGFloat underineX = (titleView.frame.size.width - distanceBetweenButton*2)/3;
//    UIView *underLinveView = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.frame.size.height, underineX, 2)];
////    [underLinveView setBackgroundColor:[[UIColor alloc]  initWithCoder:0x00AAEE ]];
//    [underLinveView setTag:3];
//    [titleView addSubview:underLinveView];
//    
//    
//    btnDynamic.translatesAutoresizingMaskIntoConstraints = NO;
//    btnSquare.translatesAutoresizingMaskIntoConstraints = NO;
//    btnMyAct.translatesAutoresizingMaskIntoConstraints = NO;
//    underLinveView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    
//    NSArray *vfls = [NSArray arrayWithObjects:
//                     @"V:|-0-[btnDynamic]-0-|",
//                     @"H:|-0-[btnDynamic]",
//                     @"V:|-0-[btnSquare]-0-|",
////                     @"[btnDynamic]-distance-[btnSquare(==btnDynamic)]",
////                     @"V:|-0-[btnMyAct]-0|",
////                     @"[btnDynamic]-distance-[btnMyAct(==btnDynamic)]",
//                     nil];
//   // [titleView addConstraint:[NSLayoutConstraint constraintWithItem:btnDynamic attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeWidth multiplier:0.34 constant:-distanceBetweenButton]];
//    
//
//    NSDictionary *metrics = @{@"tHeight":[[NSNumber alloc] initWithFloat:titleView.frame.size.height],@"distance":[[NSNumber alloc] initWithFloat:distanceBetweenButton]};
//    NSDictionary *views = @{@"btnDynamic":btnDynamic,@"btnSquare":btnSquare,@"btnMyAct":btnMyAct};
//    
//    for (int i=0; i<[vfls count]; i++) {
//       
////       [titleView addConstraints:[NSLayoutConstraint
////                          constraintsWithVisualFormat:[vfls objectAtIndex:i]
////                          options:NSLayoutFormatAlignAllBaseline
////                          metrics:metrics
////                          views:views
////                          ]];
//    }
//    
//    [titleView setNeedsUpdateConstraints];
//    
//    
//    
//    
//    [self.navigationItem setTitleView:titleView];
////    self.navigationItem.titleView = titleView;
//    [titleView release];
//
////    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
////    [button setTitle:@"push" forState:UIControlStateNormal];
////    [button setFrame:CGRectMake(90, 100, 140, 35)];
////    [button  addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
////    [self.view addSubview:button];
////    [button release];
////    
////    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(study)];
////    self.navigationItem.leftBarButtonItem = leftItem;
////    [leftItem release];
////    
////    [self.navigationItem setTitle:@"main"];
////    UIButton *item = [UIButton buttonWithType:UIButtonTypeRoundedRect];
////    [item setTitle:@"test" forState:UIControlStateNormal];
////    [item setFrame:CGRectMake(0,0, 60, 40)];
////    [item addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
////    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:item];
////    self.navigationItem.rightBarButtonItem = rightItem;
////    [rightItem release];
//    };



#pragma mark - Target Action




-(void) pushVC
{
    MessageViewController *MessageView = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:MessageView animated:YES];
    [MessageView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.text = self.title;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
   // [self loadData];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
