//
//  LoginViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/16.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "LoginViewController.h"
#import "TwoViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>{
    UITextField *_userNameTextField;
    UITextField *_passwordTextField;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.titleLable.text = @"金掌柜";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    //1.添加用户名和密码输入框
    [self addUserNameAndPasswordTextFieldToView];
    //2.添加登录注册按钮
    [self addLoginAndRegisterButtonToView];

}
-(void)addLoginAndRegisterButtonToView
{
    
    CGFloat loginX = _passwordTextField.frame.origin.x;
    CGFloat loginY = CGRectGetMaxY(_passwordTextField.frame) + 60;
    CGFloat loginW = _passwordTextField.frame.size.width;
    CGFloat loginH = _passwordTextField.frame.size.height;
    //登录按钮
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(loginX, loginY, loginW, loginH)];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"立即登录"] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    loginButton.backgroundColor = RGB(174, -0, 1, 1);
    loginButton.layer.cornerRadius = 6;
    loginButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    //创建忘记密码和注册帐号两个按钮
    UIButton *CreatePwd = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(_passwordTextField.frame) + 5, CGRectGetMaxY(_passwordTextField.frame) + 5, 60, 30)];
    [CreatePwd setTitle:@"忘记密码" forState:UIControlStateNormal];
    CreatePwd.titleLabel.font = [UIFont systemFontOfSize:13];
    [CreatePwd setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [CreatePwd setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [CreatePwd addTarget:self action:@selector(CreatePwdButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CreatePwd];
    
    UIButton *RegisterAccount = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_passwordTextField.frame)- 65, CGRectGetMinY(CreatePwd.frame), 60, 30)];
    [RegisterAccount setTitle:@"注册帐号" forState:UIControlStateNormal];
    RegisterAccount.titleLabel.font = [UIFont systemFontOfSize:13];
    [RegisterAccount setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [RegisterAccount setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [RegisterAccount addTarget:self action:@selector(RegisterButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:RegisterAccount];
    
    self.view.userInteractionEnabled = YES;
    
    
}
#pragma mark - 点击了登录按钮
-(void)clickLoginButton
{
    //1.获取用户输入的信息
    NSString *userName = _userNameTextField.text;
    NSString *password = _passwordTextField.text;
    //2.校验
    if ([userName isEqualToString:@""]||[password isEqualToString:@""]) {
        [self showUIAlterViewWithStr:@"用户名和密码不能输入空"];
    }
    //3.获取拼接参数
    NSDictionary *dict = @{
                           @"username":userName,
                           @"password":password,
                           };
    //4.请求服务器ttp://10.0.8.8/sns/my/login.php
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,LoginUrl];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求服务器成功
        NSDictionary *dct = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *code = dct[@"status"];
        
        if ([code isEqualToString:@"ok"]) {
            //存储用户名和密码
            
            [self showUIAlterViewAboutSuccedWithStr:@"登录成功!"];
            //登录成功(进入主界面)
            //纪录是否登录
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:@"OK" forKey:@"LOGIN"];
            
            
            //            TwoViewController *homeVC = [[TwoViewController alloc]init];
            //            homeVC.hidesBottomBarWhenPushed = NO;
            //            [self.navigationController pushViewController:homeVC animated:YES];
            
        }else
        {
            //登录失败
            NSString *mess = dct[@"message"];
            [self showUIAlterViewWithStr:mess];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求服务器失败
        [self showUIAlterViewWithStr:@"您的网络有问题，请稍后再试"];
        NSLog(@"错误信息%@",error);
        
    }];
    
}
-(void)showUIAlterViewWithStr:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

-(void)showUIAlterViewAboutSuccedWithStr:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

//注册帐号
-(void)RegisterButtonClick
{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
//忘记密码事件
-(void)CreatePwdButtonClick
{
    
}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonClick
{
    
}
#pragma mark ---- textField代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    return YES;
}
#pragma mark - 触摸背景来关闭虚拟键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

-(void)addUserNameAndPasswordTextFieldToView
{
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    [self.rightButton setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [self addRightTaget:@selector(rightButtonClick)];

    
    CGFloat nameX = 50;
    CGFloat nameY = SCREENH/5;
    CGFloat nameW = SCREENW - 2 * nameX;
    CGFloat nameH = SCREENH/12;
    NSInteger fontOfSize = 30;
    //用户名输入框
    _userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(nameX, nameY, nameW, nameH)];
    _userNameTextField.backgroundColor = [UIColor clearColor];
    _userNameTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    _userNameTextField.layer.borderWidth = 2.0;
    _userNameTextField.font = [UIFont systemFontOfSize:fontOfSize];
    _userNameTextField.layer.cornerRadius = 6;
    _userNameTextField.delegate = self;
    [_userNameTextField becomeFirstResponder];
    //设置文本框最右边又个图片
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _userNameTextField.leftView = bigView;
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    leftImage.image = [UIImage imageNamed:@"icon"];
    [bigView addSubview:leftImage];
    _userNameTextField.leftView = bigView;
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;

    _userNameTextField.placeholder = @"｜用户登录";
    [_userNameTextField setValue:[UIFont boldSystemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];

    [self.view addSubview:_userNameTextField];
    
    //密码输入框
    CGFloat passwordY = CGRectGetMaxY(_userNameTextField.frame)+30;
    _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(nameX, passwordY, nameW, nameH)];
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    _passwordTextField.layer.borderWidth = 2.0;
    _passwordTextField.font = [UIFont systemFontOfSize:fontOfSize];
    _passwordTextField.layer.cornerRadius = 6;
    _passwordTextField.font = [UIFont systemFontOfSize:fontOfSize];
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    [_passwordTextField becomeFirstResponder];
    //设置文本框最右边又个图片
    UIView *bigViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _passwordTextField.leftView = bigViewTwo;
    UIImageView *leftImageTwo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    leftImageTwo.image = [UIImage imageNamed:@"iconPass"];
    [bigViewTwo addSubview:leftImageTwo];
    _passwordTextField.leftView = bigViewTwo;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    _passwordTextField.placeholder = @"｜请输入密码";
    [_passwordTextField setValue:[UIFont boldSystemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_passwordTextField];
    
    
    //添加顶部图片
    UIImageView *topImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENW/2-30, CGRectGetMinY(_userNameTextField.frame)-70, 60, 60)];
    topImage.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:topImage];

    
//    //监听键盘的弹出事件
//    //1.创建一个NSNotificationCenter对象
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    
//    //2.监听键盘弹出的通知
//    //参数1:监听者是当前控制器
//    //参数2:监听者的监听到信息的时候调用的方法
//    //参数3:要监听信息的名称
//    //参数4:信息的发送者
//    [center addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

    
}
#pragma mark - 解决虚拟键盘挡住UITextField的方法
- (void)keyboardWillShow:(NSNotification *)noti
{
    //键盘输入的界面调整
    //键盘的高度
    float height = 216.0;
    CGRect frame = self.view.frame;
    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);
    [UIView beginAnimations:@"Curl"context:nil];//动画开始
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    [self.view setFrame:frame];
    [UIView commitAnimations];
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
