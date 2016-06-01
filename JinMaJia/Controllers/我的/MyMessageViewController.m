//
//  MyMessageViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/30.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MyMessageViewController.h"

@interface MyMessageViewController ()

@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

-(void)buildUI
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Notifibackground"]];
    
    self.titleLable.text = @"我的消息";
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    
    UIImageView *topImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/2.5) imageName:@"AboutUsImage"];
    [self.view addSubview:topImage];
    
    UIImageView  *introcompany = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(topImage.frame), SCREENW, (SCREENH - CGRectGetMaxY(topImage.frame))/8) imageName:@"MyMesagexiaoxi"];
    [self.view addSubview:introcompany];
    
    UIImageView *contenImage = [FactoryUI createImageViewWithFrame:CGRectMake(20, CGRectGetMaxY(introcompany.frame)+20, SCREENW-40, 150) imageName:@"MyMessagewenan"];
    [self.view addSubview:contenImage];
}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}- (void)didReceiveMemoryWarning {
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
