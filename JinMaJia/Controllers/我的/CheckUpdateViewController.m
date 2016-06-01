//
//  CheckUpdateViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/30.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "CheckUpdateViewController.h"

@interface CheckUpdateViewController ()

@end

@implementation CheckUpdateViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     [self buildUI];
}
-(void)buildUI
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Notifibackground"]];
    
    self.titleLable.text = @"检查更新";
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    UIImageView *topImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/2.5) imageName:@"AboutUsImage"];
    [self.view addSubview:topImage];
    
    
    UIImageView *midlle = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(topImage.frame), SCREENW, SCREENW/5) imageName:@"check"];
    [self.view addSubview:midlle];
    
    UIImageView *logo = [FactoryUI createImageViewWithFrame:CGRectMake(50, 10, midlle.frame.size.height-20, midlle.frame.size.height-20) imageName:@"checkicon"];
    [midlle addSubview:logo];
    
    
    UIImageView *bottom = [FactoryUI createImageViewWithFrame:CGRectMake(logo.frame.origin.x, CGRectGetMaxY(midlle.frame) + 10, 250, 80) imageName:@"checkwenan"];
    [self.view addSubview:bottom];
    
    
    
    UILabel *jin = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(logo.frame) + 10,  5, 50, (midlle.frame.size.height-10)/3) text:@"金掌柜" font:[UIFont systemFontOfSize:15]];
    jin.textColor = [UIColor darkGrayColor];
    [midlle addSubview:jin];
    
    UILabel *banben = [FactoryUI createLableWithFrame:CGRectMake(jin.frame.origin.x, CGRectGetMaxY(jin.frame), 100, jin.frame.size.height) text:@"更新版本：1.1.2" font:[UIFont systemFontOfSize:13]];
    banben.textColor = [UIColor darkGrayColor];
    [midlle addSubview:banben];
    
    UILabel *daxiao = [FactoryUI createLableWithFrame:CGRectMake(jin.frame.origin.x, CGRectGetMaxY(banben.frame), 150, jin.frame.size.height) text:@"安装包大小：100M" font:[UIFont systemFontOfSize:13]];
    daxiao.textColor = [UIColor darkGrayColor];
    [midlle addSubview:daxiao];
    
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
