//
//  FastNewsDetailViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/13.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "FastNewsDetailViewController.h"

@interface FastNewsDetailViewController ()

@end

@implementation FastNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buildUI];
}
-(void)buildUI
{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
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
