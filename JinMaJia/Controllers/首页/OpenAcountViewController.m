//
//  OpenAcountViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/19.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "OpenAcountViewController.h"
#import "OpenAcountDetailViewController.h"
@interface OpenAcountViewController ()

@end

@implementation OpenAcountViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buildUI];

}
-(void)buildUI
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundOpenAcount"]];
    
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    UIImageView *topImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/3) imageName:@"Acountbanner"];
    topImage.userInteractionEnabled = YES;
    [self.view addSubview:topImage];
    UIButton *btnOpenAcount = [FactoryUI createButtonWithFrame:CGRectMake(100, topImage.frame.size.height-topImage.frame.size.height/6, SCREENW - 200, topImage.frame.size.height/6) title:nil titleColor:nil imageName:nil backgroundImageName:@"立即开户" target:self selector:@selector(OpenAcountButtonClick)];
    [topImage addSubview:btnOpenAcount];
    UIImageView *middleImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(topImage.frame), SCREENW, topImage.frame.size.height/5) imageName:@"保驾护航"];
    [self.view addSubview:middleImage];
    
    UIImageView *bottomImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(middleImage.frame), SCREENW, SCREENH - CGRectGetMaxY(middleImage.frame)) imageName:@"background01openAcountBot"];
    [self.view addSubview:bottomImage];
    
    
    
    
}
-(void)OpenAcountButtonClick
{
    OpenAcountDetailViewController *detail = [[OpenAcountDetailViewController alloc]init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
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
