//
//  AgentViewController.m
//  登录
//
//  Created by 周哥哥 on 16/5/5.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "AgentViewController.h"
#import "AgentModel.h"
#import "AFNetworking.h"
@interface AgentViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation AgentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self requestData];
    
   
}
-(void)requestData
{
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,AgentUrl];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * array = responseObject[@"data"];
        for (NSDictionary *dict  in array) {
            AgentModel *model = [[AgentModel alloc]initWithDict:dict];
            [_dataArray addObject:model];
        }
         [self buildUI];
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)buildUI
{
    _tableView= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rID = @"agent_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rID];
    }
    if (_dataArray.count != 0) {
        AgentModel *model = _dataArray[indexPath.row];
        cell.textLabel.text=  model.agentName;
        cell.textLabel.textColor = [UIColor blackColor];

    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{

    

        if ([_delegate respondsToSelector:@selector(deliverAgentModel:)]) {
            [_delegate deliverAgentModel:_dataArray[indexPath.row]];
        }

       
            [self dismissViewControllerAnimated:YES completion:nil];
        


    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
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
