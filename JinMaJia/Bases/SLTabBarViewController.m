//
//  SLTabBarViewController.m
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "SLTabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface SLTabBarViewController ()

@end

@implementation SLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self createViewControllers];
    [self createTabBar];
    
}
-(void)createTabBar
{
    NSArray *unselectsImageArray = @[@"ICON08",@"ICON04",@"ICON06",@"hangqing_u",@"ICON02"];
    NSArray *selectsImageArray = @[@"ICON07",@"ICON03",@"ICON05",@"hangqing_p",@"ICON01"];
    NSArray *titleArray = @[@"首页",@"直播",@"学院",@"行情",@"我的"];
    for (int i = 0; i < self.tabBar.items.count; i ++) {
        UIImage *selectsImage = [UIImage imageNamed:selectsImageArray[i]];
        selectsImage = [selectsImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *unselectsImage = [UIImage imageNamed:unselectsImageArray[i]];
        unselectsImage = [unselectsImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = self.tabBar.items[i];
        item = [item initWithTitle:titleArray[i] image:unselectsImage selectedImage:selectsImage];
    
    }
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
}
-(void)createViewControllers
{
    OneViewController *oneVC = [[OneViewController alloc]init];
    UINavigationController *oneNc = [[UINavigationController alloc]initWithRootViewController:oneVC];
    oneVC.view.backgroundColor  = [UIColor whiteColor];
    TwoViewController *twVC = [[TwoViewController alloc]init];
    UINavigationController *twoNc = [[UINavigationController alloc]initWithRootViewController:twVC];
//    twVC.view.backgroundColor = [UIColor orangeColor];

    ThreeViewController *threeVC = [[ThreeViewController alloc]init];
    UINavigationController *threeNc = [[UINavigationController alloc]initWithRootViewController:threeVC];
    threeVC.view.backgroundColor = [UIColor yellowColor];

    FourViewController *fourVC = [[FourViewController alloc]init];
    UINavigationController *fourNc = [[UINavigationController alloc]initWithRootViewController:fourVC];
    fourVC.view.backgroundColor = [UIColor greenColor];
    
    FiveViewController *conditions = [[FiveViewController alloc]init];
    UINavigationController *FiveNc = [[UINavigationController alloc]initWithRootViewController:conditions];
    FiveNc.view.backgroundColor = [UIColor whiteColor];

    self.viewControllers = @[oneNc,twoNc,threeNc,FiveNc,fourNc];
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
