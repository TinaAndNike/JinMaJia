//
//  OrderViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderModel.h"
#import "OrderCell.h"
@interface OrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}

@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation OrderViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self requestData];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    
}
-(void)requestData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,OrderUrl];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"][@"result"];
        for (NSDictionary *dict in array) {
            OrderModel *model = [[OrderModel alloc]initWithDict:dict];
            [_dataArray addObject:model];
        }
        [self buildUI];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)buildUI
{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREENW, SCREENH) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = SCREENW/3;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[OrderCell class] forCellReuseIdentifier:@"Order_cell"];
    [self.view addSubview: _tableView];
    
    
    self.titleLable.text = @"喊单提醒";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    
   //及时喊单按钮
    UIButton *OrderLeft = [FactoryUI createButtonWithFrame:CGRectMake(20, 20, 100, 20) title:nil titleColor:nil imageName:nil backgroundImageName:@"及时喊单" target:self selector:@selector(OrderLeftButtonClick:)];
    [OrderLeft setImage:[UIImage imageNamed:@"及时喊单02"] forState:UIControlStateSelected];
    [self.view addSubview:OrderLeft];
    
    NSString *text = [NSString stringWithFormat:@"共有数据：%ld条",self.dataArray.count];
    UILabel *dataright = [FactoryUI createLableWithFrame:CGRectMake(200, 20, 100, 20) text:text font:[UIFont systemFontOfSize:13]];
    
    dataright.textColor = [UIColor darkGrayColor];
    [self.view addSubview:dataright];
    
    
    
}
-(void)OrderLeftButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ----tableview数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Order_cell" forIndexPath:indexPath];
    if (self.dataArray.count != 0) {
        cell.orderModel = _dataArray[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
