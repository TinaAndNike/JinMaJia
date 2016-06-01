//
//  RegisterViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/16.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterDetailViewController.h"
#import "NSString+CZNSStringExt.h"
@interface RegisterViewController ()<UITextFieldDelegate>{
    UITextField *_userNameTextField;
    UITextField *_passwordTextField;
    UITextField *_testPassword;
    NSString *_getPwd;
}


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLable.text = @"金掌柜";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.tabBarController.tabBar.hidden = YES;
    //1.添加用户名和密码输入框
    [self addUserNameAndPasswordTextFieldToView];
    //2.添加登录注册按钮
    [self addLoginAndRegisterButtonToView];


}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonClick
{
    
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
    //设置文本框最右边又个图片
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _userNameTextField.leftView = bigView;
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    leftImage.image = [UIImage imageNamed:@"icon"];
    [bigView addSubview:leftImage];
    _userNameTextField.leftView = bigView;
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _userNameTextField.delegate = self;
    _userNameTextField.placeholder = @"｜注册账户";
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
    //设置文本框最右边又个图片
    UIView *bigViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _passwordTextField.leftView = bigViewTwo;
    UIImageView *leftImageTwo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    leftImageTwo.image = [UIImage imageNamed:@"iconPass"];
    [bigViewTwo addSubview:leftImageTwo];
    _passwordTextField.leftView = bigViewTwo;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.delegate = self;
    _passwordTextField.placeholder = @"｜创建密码";
    [_passwordTextField setValue:[UIFont boldSystemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_passwordTextField];
    
    
    //创建获取验证码
    _testPassword = [[UITextField alloc]initWithFrame:CGRectMake(_passwordTextField.frame.origin.x, CGRectGetMaxY(_passwordTextField.frame) + 20, _passwordTextField.frame.size.width-110, _passwordTextField.frame.size.height+10)];
    _testPassword.layer.borderWidth = 2.0;
    _testPassword.layer.cornerRadius = 6;
    _testPassword.layer.borderColor = [[UIColor whiteColor] CGColor];
    _testPassword.backgroundColor = [UIColor clearColor];
    _testPassword.delegate = self;
    [self.view addSubview:_testPassword];
    UIButton * getPwd = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_testPassword.frame) + 10, _testPassword.frame.origin.y, 100, _testPassword.frame.size.height)];
    [getPwd setBackgroundImage:[UIImage imageNamed:@"verification"] forState:UIControlStateNormal];
    [getPwd addTarget:self action:@selector(GetpwdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getPwd];
    
    
    
    //添加顶部图片
    UIImageView *topImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENW/2-30, CGRectGetMinY(_userNameTextField.frame)-70, 60, 60)];
    topImage.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:topImage];
    
    
    
}
//获取验证码点击事件
-(void)GetpwdButtonClick:(UIButton *)sender
{
    
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,MessagePwdUrl];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"telephone":_userNameTextField.text,
                           
                           };
    
    //判断手机号码是否符合要求
    NSString *phoneNum = _userNameTextField.text;
    NSString *message = [phoneNum valiMobile:phoneNum];
    
    if (message.length == 0) {
       // 符合要求
    
        [manager GET:path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //http:192.168.0.108:8080/jmj/sms/tel_code/telephone = 15256587705
            //请求服务器成功
            
            [self showUIAlterViewWithStr:responseObject[@"message"]];
            _getPwd = responseObject[@"data"];
            NSLog(@"%@",_getPwd);
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //请求服务器失败
            [self showUIAlterViewWithStr:@"您的网络有问题，请稍后再试"];
            NSLog(@"错误信息%@",error);
            
        }];

        
        
        
        
    }
else
    {
        [self showUIAlterViewWithStr:message];
    }

    
    
    
}
-(void)addLoginAndRegisterButtonToView
{
    
    CGFloat loginX = _passwordTextField.frame.origin.x;
    CGFloat loginY = CGRectGetMaxY(_testPassword.frame) + 60;
    CGFloat loginW = _passwordTextField.frame.size.width;
    CGFloat loginH = _passwordTextField.frame.size.height;
    //注册按钮
    UIButton *RegisternButton = [[UIButton alloc]initWithFrame:CGRectMake(loginX, loginY, loginW, loginH)];
    [RegisternButton setBackgroundImage:[UIImage imageNamed:@"register"] forState:UIControlStateNormal];
    [RegisternButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    RegisternButton.backgroundColor = RGB(174, -0, 1, 1);
    RegisternButton.layer.cornerRadius = 6;
    RegisternButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [RegisternButton addTarget:self action:@selector(clickRegisternButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:RegisternButton];
    
    
    
    
}
#pragma mark -----textfield的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_testPassword resignFirstResponder];
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    return YES;
}
#pragma mark - 触摸背景来关闭虚拟键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_testPassword resignFirstResponder];
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

-(void)clickRegisternButton
{
//    RegisterDetailViewController *homeVC = [[RegisterDetailViewController alloc]init];
//    [self.navigationController pushViewController:homeVC animated:YES];

    //1.获取用户输入的信息
    NSString *userName = _userNameTextField.text;
    NSString *password = _passwordTextField.text;
    NSString *testPwd =  _testPassword.text;
    //2.校验
    if ([userName isEqualToString:@""]||[password isEqualToString:@""]||[testPwd isEqualToString:@""]) {
        [self showUIAlterViewWithStr:@"信息不能输入空"];
    }else{
        _getPwd = testPwd;
    //3.获取拼接参数
    NSDictionary *dict = @{
                           @"telephone":userName,
                           @"password":password,
                           @"tel_code":_getPwd,
                           };
        
    //4.请求服务器ttp://10.0.8.8/sns/my/login.php
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,registerUrl];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //登录成功(进入主界面)
//            RegisterDetailViewController *homeVC = [[RegisterDetailViewController alloc]init];
//            [self.navigationController pushViewController:homeVC animated:YES];
        //请求服务器成功
        NSDictionary *dct = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *code = dct[@"status"];
        
        if ([code isEqualToString:@"ok"]) {

            NSString *mess = dct[@"message"];
            [self showUIAlterViewAboutSuccedWithStr:mess];

           
            
        }

       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求服务器失败
        [self showUIAlterViewWithStr:@"您输入有误!"];
        NSLog(@"错误信息%@",error);
        
    }];
    }
    
}
-(void)showUIAlterViewWithStr:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    //    UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    //    [alterView show];
}
-(void)showUIAlterViewAboutSuccedWithStr:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //登录成功(进入主界面)
        RegisterDetailViewController *homeVC = [[RegisterDetailViewController alloc]init];
        [self.navigationController pushViewController:homeVC animated:YES];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
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
