//
//  RateViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "RateViewController.h"
#import "RateModel.h"
#import "RateCell.h"
@interface RateViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation RateViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self requestData];
    
    

}
-(void)requestData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:rateUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        for (NSDictionary *dict in array) {
            RateModel *model = [[RateModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:model];
        }
        [self buildUI];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)buildUI
{
    self.titleLable.text = @"汇率";
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Ratebackground"]];
    
    UILabel *top = [FactoryUI createLableWithFrame:CGRectMake(20, 35, SCREENW - 40, 20) text:@"当日外汇降价人民币汇率" font:[UIFont systemFontOfSize:15]];
    top.textColor = [UIColor darkGrayColor];
    top.backgroundColor = [UIColor redColor];
    top.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:top];
    
    UIImageView *tableImage = [FactoryUI createImageViewWithFrame:CGRectMake(10, CGRectGetMaxY(top.frame) + 5, SCREENW - 20, SCREENW/2) imageName:@"Ratehuilv"];
    [self.view addSubview:tableImage];
    
    _tableView = [UITableView alloc]initWithFrame:CGRectMake(0, GRectGetMaxY(top.frame) + 5, SCREENW, <#CGFloat height#>) style:<#(UITableViewStyle)#>
    
    
    
        
    

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
