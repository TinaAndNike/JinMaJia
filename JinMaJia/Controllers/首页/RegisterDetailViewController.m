//
//  RegisterDetailViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/16.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "RegisterDetailViewController.h"
#import "AgentViewController.h"
@interface RegisterDetailViewController ()<AgentViewControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate>
{
    NSString *username;
    NSString *nickname;
    NSString *gender;
    NSString *qq;
    NSString *gid;
    
    UITextField *Message;
}
@end

@implementation RegisterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;

    [self buildUI];
}
-(void)deliverAgentModel:(AgentModel *)agentModel
{
    AgentModel *model = agentModel;
    _Id = model.Id;
}
-(void)TapGetureClick:(UITapGestureRecognizer *)sender
{
    [Message resignFirstResponder];
}
-(void)buildUI
{
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapGetureClick:)];
    [self.view addGestureRecognizer:tapGest];
    self.view.userInteractionEnabled = YES;
    
    self.view.backgroundColor = RGB(242, 242, 242, 1);
    
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    [self.rightButton setTitle:@"提交" forState:UIControlStateNormal];
    self.rightButton .titleLabel.font = [UIFont systemFontOfSize:12];
    self.rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    [self addRightTaget:@selector(HandButtonClick)];
    
    self.titleLable.text = @"金掌柜";
    
    
    //头部图片
    UIImageView *imageView = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/3) imageName:@"backImage"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIImageView *backView = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, 100, 100) imageName:@"半透明"];

    backView.center = imageView.center;
    [imageView addSubview:backView];
    
    NSArray *HandImageArray = @[@"手掌",@"手掌01",@"手掌02",@"手掌03",@"手掌04",@"手掌05"];
    NSMutableArray *arrayM = [NSMutableArray array];
    for ( int i = 0; i < HandImageArray.count; i ++) {
        UIImage *image = [UIImage imageNamed:HandImageArray[i]];
        [arrayM addObject:image];
        
    }
    UIImageView *HandImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, 50, 50) imageName:@"手掌05"];
    HandImage.center = backView.center;
    [self.view addSubview:HandImage];
    HandImage.animationImages = arrayM;
    HandImage.animationRepeatCount = 1;
    HandImage.animationDuration = 5;
    [HandImage startAnimating];

    
    UIImageView *personMe = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), SCREENW,(SCREENH -  CGRectGetMaxY(imageView.frame))/7) imageName:@"02"];
    [self.view addSubview:personMe];
    
   
    
    
    //循环创建信息图片
    CGFloat X = 0;
    CGFloat Y = CGRectGetMaxY(personMe.frame);
    CGFloat W = SCREENW;
    CGFloat H = personMe.frame.size.height;
    NSArray *imageArray = @[@"用户名",@"昵称",@"账号",@"信息",@"代理商"];
    NSArray *placeHoder = @[@"请输入用户名",@"请输入昵称",@"请输入QQ号",@"",@"请选择代理商"];
    
    for (int i = 0; i <imageArray.count ; i ++) {
        UIImageView *imageViewMessage = [FactoryUI createImageViewWithFrame:CGRectMake(X, Y + H * i, W, H) imageName:imageArray[i]];
        imageViewMessage.userInteractionEnabled = YES;
        [self.view addSubview:imageViewMessage];
        UIImageView *bottom = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(imageViewMessage.frame), SCREENW, SCREENH - CGRectGetMaxY(imageViewMessage.frame)) imageName:@"background01"];
        [self.view addSubview:bottom];
        if (i != 4 ) {
            Message = [[UITextField alloc]initWithFrame:CGRectMake(120,0, SCREENW - 120, imageViewMessage.frame.size.height)];
            Message.delegate = self;
            Message.textAlignment = NSTextAlignmentCenter;
            Message.placeholder = placeHoder[i];
            Message.tag = 200 + i;
            [Message addTarget:self action:@selector(MessageTextClick:) forControlEvents:UIControlEventEditingDidEnd];
            [imageViewMessage addSubview:Message];

        }else
        {
            UIButton *chooseAgent = [FactoryUI createButtonWithFrame:CGRectMake(120, 0, SCREENW - 120, imageViewMessage.frame.size.height) title:@"请选择代理商" titleColor:[UIColor darkGrayColor] imageName:nil backgroundImageName:nil target:self selector:@selector(chooseAgentButtonClick:)];
           
            [imageViewMessage addSubview:chooseAgent];
        }
        if (i == 3) {
            UIButton *chooseAgender = [FactoryUI createButtonWithFrame:CGRectMake(120, 0, SCREENW - 120, imageViewMessage.frame.size.height) title:@"请选择性别" titleColor:[UIColor darkGrayColor] imageName:nil backgroundImageName:nil target:self selector:@selector(chooseAgenderButtonClick:)];
            
            [imageViewMessage addSubview:chooseAgender];
        }
        
        
        
    }
    
    
    

}

#pragma mark -----textfield的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [Message resignFirstResponder];
}
#pragma mark ---性别选择事件
-(void)chooseAgenderButtonClick:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择性别" delegate:self cancelButtonTitle:@"男" destructiveButtonTitle:@"女" otherButtonTitles:nil];
    
    // 显示
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%ld",buttonIndex);
    if (buttonIndex == 0) {
        gender = @"女";
    }else
    {
        gender = @"男";
    }
}




-(void)MessageTextClick:(UITextField *)sender
{
    
    
    NSInteger tag = sender.tag - 200;
    switch (tag) {
        case 0:
        {
            username = sender.text;
        }
            break;
        case 1:
        {
            nickname = sender.text;
        }
            break;
        case 2:
        {
            qq = sender.text;
        }
            break;
        
            
       
            
        default:
            break;
    }

    
    
}
-(void)chooseAgentButtonClick:(UIButton *)sender
{
    AgentViewController *agent = [[AgentViewController alloc]init];
    agent.delegate = self;
//    [self.navigationController pushViewController:agent animated:YES];
    [self presentViewController:agent animated:YES completion:nil];
    
   
}
-(void)HandButtonClick
{
    
    
    
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,RegisterDetailUrl];
    gid = _Id;
//    if ( username.length == 0 ) {
//        NSLog(@"hahahh");
//    }
    
    if (username.length  != 0&& nickname.length != 0&&gender.length !=0&&qq.length !=0&&gid.length != 0 ) {
        
        
    
    
    NSDictionary *dict = @{
                           @"username":username,
                           @"nickname":nickname,
                           @"gender":gender,
                           @"qq":qq,
                           @"gid":gid,
                           
                           };
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.navigationController popToRootViewControllerAnimated:YES];


        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求服务器失败
        [self showUIAlterViewWithStr:@"您的网络有问题，请稍后再试"];
        NSLog(@"错误信息%@",error);
    }];
    
    }else
    {
        [self showUIAlterViewWithStr:@"输入不能为空!"];
    }
    
}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)showUIAlterViewWithStr:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
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
