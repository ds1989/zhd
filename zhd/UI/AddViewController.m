//
//  AddViewController.m
//  zhd
//
//  Created by robbert on 15-10-20.
//  Copyright (c) 2015年 robbert. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) loadView
{
    
    UIView *baseView = [[UIView alloc] initWithFrame:[[UIScreen  mainScreen] applicationFrame]];
    self.view = baseView;
    [super loadView];
    
    
    
    //add addfunction
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"添加";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.text = self.title;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
