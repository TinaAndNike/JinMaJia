//
//  TicketViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/25.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TicketViewController.h"
#import "SearchViewController.h"
#import "TicketCell.h"
#import "TicketModel.h"
@interface TicketViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_search;
    UITableView *_tableView;
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation TicketViewController
-(void)viewWillDisappear:(BOOL)animated
{
    _search.hidden = YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    _search.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self buildUI];
    [self requestData];
    
    


}
-(void)requestData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    AFHTTPRequestOperationManager  *manageer = [AFHTTPRequestOperationManager manager];
    
    [manageer GET:TicketFirst parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *dataArray = responseObject[@"result"][@"data"][@"data"];
        
        for (NSDictionary *dict in dataArray) {
            TicketModel *model = [[TicketModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:model];
        }
        
        [self addTableView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)addTableView
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 55;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[TicketCell class] forCellReuseIdentifier:@"Ticket_cell"];
    
    [self.view addSubview:_tableView];
}
-(void)buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    
    _search = [FactoryUI createButtonWithFrame:CGRectMake(60, 12, SCREENW-120, 25) title:nil titleColor:nil imageName:nil backgroundImageName:@"gupiaoserach-1(1)" target:self selector:@selector(SearchButtonImageClick)];
    [self.navigationController.navigationBar addSubview:_search];
    
    
    //右按钮
    [self.rightButton setImage:[UIImage imageNamed:@"gupiaoicon (1)"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"ggupiaoicon0"] forState:UIControlStateHighlighted];
    [self addRightTaget:@selector(SerchButtonClick)];
    
    
    //细节图片
    
    
    
    
    
}
-(void)SearchButtonImageClick
{
    SearchViewController *search = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
}
-(void)SerchButtonClick
{
    SearchViewController *search = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];

}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark----tableview数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TicketCell*cell=[tableView dequeueReusableCellWithIdentifier:@"Ticket_cell" forIndexPath:indexPath];
    if (self.dataArray.count) {
        
        cell.ticketModel = self. dataArray[indexPath.row];
        NSLog(@"%ld",indexPath.row);
    }
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
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
