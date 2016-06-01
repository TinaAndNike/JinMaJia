//
//  BaseViewController.m
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createRootNav];
}
-(void)createRootNav
{
    
    //给导航栏设置背景图片
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航栏768x133hpx"] forBarMetrics:UIBarMetricsDefault];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //设置导航不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置导航的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //方法一：修改状态栏的颜色(白色)
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //左按钮
    self.leftButton = [FactoryUI createButtonWithFrame:CGRectMake(0, 0, 20, 20) title:nil titleColor:nil imageName:nil backgroundImageName:nil target:nil selector:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
    //标题
    self.titleLable = [FactoryUI createLableWithFrame:CGRectMake(0, 0, 100, 30) text:nil font:[UIFont boldSystemFontOfSize:20]];
    self.titleLable.font = [UIFont systemFontOfSize:25];
    self.titleLable.font = [UIFont boldSystemFontOfSize:25];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = self.titleLable;
    
    //右按钮
    self.rightButton = [FactoryUI createButtonWithFrame:CGRectMake(0, 0, 25, 20) title:nil titleColor:nil imageName:nil backgroundImageName:nil target:nil selector:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    
}
-(void)addLeftTarget:(SEL)selector
{
    [self.leftButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
}
-(void)addRightTaget:(SEL)selector
{
    [self.rightButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
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
