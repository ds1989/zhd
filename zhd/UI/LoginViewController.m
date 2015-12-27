//
//  LoginViewController.m
//  zhd
//
//  Created by luoyidong on 15/11/9.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "LoginViewController.h"
#import "TabViewUCViewPager.h"
#import "UIColor+Hex.h"
#import "RootViewController.h"
#import "LoginData.h"
#import "LoginInfo.h"

#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
@interface LoginViewController ()
{
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    CGFloat controlWidth = kWidth*3/5;
    
    CGFloat controlHeight = 30;
   // CGFloat inputHeight = 34;
    UIColor *titleColor = [UIColor grayColor];
    UIColor *titleSelectedColor = [UIColor grayColor];
    UIView *viewPager = [[UIView alloc] initWithFrame:CGRectMake(kWidth/5 ,
                                                                 [[UIScreen mainScreen] bounds].size.height/10,
                                                                 controlWidth,
                                                                 kHeight-20)];
    
    UIView *pageControl = [[UIView alloc] initWithFrame:CGRectMake(0, 0, controlWidth, 34)];
    //pageControl.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];
    //pageControl.tintColor = [UIColor blackColor];
    //创建菜单按钮下划线
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, pageControl.frame.size.height-1, pageControl.frame.size.width,1)];
    label.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    label.tag = 200;
    
    [pageControl addSubview:label];
    [label release];
    
    UILabel *selectedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, pageControl.frame.size.height -3, pageControl.frame.size.width/2, 3)];
    selectedLabel.backgroundColor = [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1];
    selectedLabel.tag = 300;
    [pageControl addSubview:selectedLabel];
    [selectedLabel release];
    //当不显示下划线的时候讲 frame。size.height =0；
    CGRect pageFrame = pageControl.frame;
    pageFrame.size.width = controlWidth/2;
    
    //创建菜单按钮
    UIButton *btnTabLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTabLogin setFrame:pageFrame];
    btnTabLogin.tag = 101;
    [btnTabLogin setTitleColor:titleColor forState:UIControlStateNormal];
    [btnTabLogin setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    //[btnTabLogin setBackgroundColor:[UIColor blackColor]];
    [btnTabLogin setTitle:@"登陆" forState:UIControlStateNormal];
    
    btnTabLogin.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnTabLogin addTarget:self action:@selector(tabBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [pageControl addSubview:btnTabLogin];
    //[btnTabLogin release];
    
    pageFrame.origin.x = controlWidth/2;
    UIButton *btnTabRegister = [[UIButton alloc] initWithFrame:pageFrame];
    btnTabRegister.tag =102;
    [btnTabRegister setTitleColor:titleColor forState:UIControlStateNormal];
    [btnTabRegister setTitleColor:titleSelectedColor forState:UIControlStateSelected];
   // [btnTabRegister setBackgroundColor:[UIColor blackColor]];
    [btnTabRegister setTitle:@"注册" forState:UIControlStateNormal];
    btnTabRegister.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnTabRegister addTarget:self action:@selector(tabBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [pageControl addSubview:btnTabRegister];
    //[btnTabRegister release];
    
    pageFrame.size.width = controlWidth;
    pageFrame.origin.x = 0;
    pageFrame.origin.y = pageFrame.origin.y +54;
    pageFrame.size.height = controlHeight;
    self.txtName = [[UITextField alloc] initWithFrame:pageFrame];
    [self.txtName setPlaceholder:@"用户名"];
    [self setTextFieldCss:self.txtName];
    [viewPager addSubview:self.txtName];

    
    pageFrame.origin.y = pageFrame.origin.y+40;
    self.txtPwd = [[UITextField alloc] initWithFrame:pageFrame];

    [self.txtPwd setSecureTextEntry:YES];
    [self.txtPwd setPlaceholder:@"密码"];
    [self setTextFieldCss:self.txtPwd];
     [self setTextViewBolder:self.txtPwd];
    [viewPager addSubview:self.txtPwd];
    

   
    pageFrame.origin.y =pageFrame.origin.y +40;
    
    //pageFrame.origin.y = pageFrame.origin.y;
    UIButton *btnLogin = [[UIButton alloc] initWithFrame:pageFrame];
    btnLogin.tag = 104;
    [btnLogin setBackgroundColor:[UIColor grayColor]];
    [btnLogin setTitle:@"登陆" forState:UIControlStateNormal];
    btnLogin.titleLabel.font = [UIFont systemFontOfSize:14];
     [btnLogin.layer setCornerRadius:8.0];
    //btnLogin.titleLabel.textColor = [UIColor blackColor];
    [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [viewPager addSubview:btnLogin];
    [btnLogin release];
    
    
    self.txtRepeadPwd = [[UITextField alloc] initWithFrame:pageFrame];
 
    [self.txtRepeadPwd setSecureTextEntry:YES];
    self.txtRepeadPwd.tag = 105;
    [self setTextFieldCss:self.txtRepeadPwd];
    [self.txtRepeadPwd setPlaceholder:@"重复密码"];
    [viewPager addSubview:self.txtRepeadPwd];
    
    
    //注册
    pageFrame.origin.y = pageFrame.origin.y +40;
    //UIButton *btnRegister = [[UIButton alloc] initWithFrame:pageFrame];
    
    UIButton *btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnRegister setFrame:pageFrame];
    [btnRegister.layer setCornerRadius:8.0];
    btnRegister.tag = 106;
    [btnRegister setBackgroundColor:[UIColor grayColor]];
    [btnRegister setTitle:@"注册" forState:UIControlStateNormal];
    [btnRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [viewPager addSubview:btnRegister];
     [btnRegister addTarget:self action:@selector(registerData:) forControlEvents:UIControlEventTouchUpInside];
    //[btnRegister release];
    
    UILabel *forgetPwdLabel = [[UILabel alloc] initWithFrame:pageFrame];
    [forgetPwdLabel setText:@"忘记密码"];
    [forgetPwdLabel setTextColor:[UIColor grayColor]];
    forgetPwdLabel.font = [UIFont systemFontOfSize:14.0];
    [viewPager addSubview:forgetPwdLabel];
    
    pageFrame.origin.y = pageFrame.origin.y+60;
    pageFrame.size.height = 200;
  
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:pageFrame];
    imageView.tag = 107;
    imageView.image = [UIImage imageNamed:@"logo_name"];
    [viewPager addSubview:imageView];
    [imageView release];
    [viewPager addSubview:pageControl];
    [pageControl release];
    
    [self.view addSubview:viewPager];
    [viewPager release];
    
    [self setTabIndex:0];
    //[self.view setBackgroundColor:[UIColor blackColor]];
    
}

-(void) setTextFieldCss:(UITextField *)sender
{
    [sender setBackgroundColor:[UIColor whiteColor]];
    [sender setTextColor:[UIColor grayColor]];
    [sender setKeyboardType:UIKeyboardTypeDefault];
    [sender setBorderStyle:UITextBorderStyleNone];
    [sender.layer setCornerRadius:5.0];
    sender.font = [UIFont systemFontOfSize:14];
    sender.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    //设置显示模式为永远显示(默认不显示)
    sender.leftViewMode = UITextFieldViewModeAlways;
}

//按钮的点击事件
- (void)tabBtnClicked:(UIButton *)sender
{
    UILabel *selectedLabel = (UILabel *)[self.view viewWithTag:300];
    CGRect frame = selectedLabel.frame;
    frame.origin.x = sender.frame.origin.x;
    selectedLabel.frame = frame;
    
    if(sender.tag==101)
        [self setTabIndex:0];
    else
        [self setTabIndex:1];
}

-(void)setTabIndex:(NSInteger) index
{
    BOOL isHidden = YES;
    if(index==0)
    {
        UIView *viewImage = [self.view viewWithTag:107 ];
        CGRect frame = viewImage.frame;
        frame.origin.y = frame.origin.y -20;
        viewImage.frame = frame;
        
    }else
    {
        isHidden = NO;
        UIView *viewImage = [self.view viewWithTag:107 ];
        CGRect frame = viewImage.frame;
        frame.origin.y = frame.origin.y +20;
        viewImage.frame = frame;
        
    }
    
    for (NSInteger i=0; i<3; i++) {
        UIView *view = [self.view viewWithTag:104+i];
        view.hidden = isHidden;
    }
    
    UIView *view = [self.view viewWithTag:104];
    
    if(index==0)
    {
        view.hidden = NO;
    }else
    {
        view.hidden = YES;
    }

}
-(void) setTextViewBolder:(UITextField *) sender
{
    sender.layer.borderColor = [UIColor colorWithHexString:@"#888888"];
    
    sender.layer.borderWidth = 3.0;
    
    sender.layer.cornerRadius = 8.0f;
    
    [sender.layer setMasksToBounds:YES];
}

#pragma mark --配置视图

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)login:(UIButton *)sender
{
    LoginData *data = [[LoginData alloc] init];
    
    [data writeUserDataInDoc:[[LoginInfo alloc] initWithLoginName:@"a" pwd:@"b" userId:3]];

    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示write"
                         
                                                  message:[NSString stringWithFormat:@"userName: %@ pwd :%@",self.txtName.text,self.txtPwd.text]
                         
                                                 delegate:nil
                         
                                        cancelButtonTitle:@"确定"
                         
                                        otherButtonTitles:nil];
    
    [alert show];
//    RootViewController *root =[[RootViewController alloc] init];
//    
//    [self presentViewController:root animated:NO completion:^(void){}];
}
-(void)registerData:(UIButton *)sender
{
     LoginData *data = [[LoginData alloc] init];
    
    LoginInfo *userInfo = [data getUserInfoByDoc];
    
    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示get"
                         
                                                  message:[NSString stringWithFormat:@"userName: %@ pwd :%@",userInfo.UserName,userInfo.Pwd]
                         
                                                 delegate:nil
                         
                                        cancelButtonTitle:@"确定"
                         
                                        otherButtonTitles:nil];
    
    [alert show];
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
