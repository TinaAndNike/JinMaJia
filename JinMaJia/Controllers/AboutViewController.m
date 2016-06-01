//
//  AboutViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/9.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "AboutViewController.h"
#import "AdvantageViewController.h"
#import "CompanyIntroduceViewController.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self buildUI];
    
    
}
-(void)buildUI
{
    self.titleLable.text = @"关于我们";
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    
    UIImageView *topImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/2.5) imageName:@"AboutUsImage"];
    [self.view addSubview:topImage];
    UIButton *company = [FactoryUI createButtonWithFrame:CGRectMake(0, CGRectGetMaxY(topImage.frame), SCREENW, (SCREENH - CGRectGetMaxY(topImage.frame))/8 ) title:nil titleColor:nil imageName:nil backgroundImageName:@"公司介绍" target:self selector:@selector(CompanyButtonClick:)];
    [self.view addSubview:company];
    
    UIButton *Advantage = [FactoryUI createButtonWithFrame:CGRectMake(0, CGRectGetMaxY(company.frame), SCREENW, company.frame.size.height ) title:nil titleColor:nil imageName:nil backgroundImageName:@"意见反馈" target:self selector:@selector(AdvantageButtonClick:)];
    [self.view addSubview:Advantage];
    
    UIImageView *bottomImage =[FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(Advantage.frame), SCREENW, SCREENH-CGRectGetMaxY(Advantage.frame)) imageName:@"backAboutUs"];
    [self.view addSubview:bottomImage];

    
                                                                    

}
-(void)CompanyButtonClick:(UIButton *)sender
{
    CompanyIntroduceViewController *intro = [[CompanyIntroduceViewController alloc]init];
    intro.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:intro animated:YES];
}
-(void)AdvantageButtonClick:(UIButton *)sender
{
    AdvantageViewController *advantage = [[AdvantageViewController alloc]init];
    [self.navigationController pushViewController:advantage animated:YES];
}
                                    
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
