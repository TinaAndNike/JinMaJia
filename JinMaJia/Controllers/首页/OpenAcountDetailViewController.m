//
//  OpenAcountDetailViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/19.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "OpenAcountDetailViewController.h"

@interface OpenAcountDetailViewController ()

@end

@implementation OpenAcountDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
}
-(void)buildUI
{
    
    
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
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
