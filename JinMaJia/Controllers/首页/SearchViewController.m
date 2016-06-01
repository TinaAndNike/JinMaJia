//
//  SearchViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/27.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"
#import "SearchModel.h"
@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UISearchBar *_search;
    UITableView *_tableView;
    NSString *_content;
}
@property (nonatomic,strong) NSMutableArray *searchArr;//搜索结果

@end

@implementation SearchViewController

-(void)viewWillDisappear:(BOOL)animated
{
    _search.hidden = YES;
    [_search resignFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    _search = [[UISearchBar alloc]initWithFrame:CGRectMake(60, 12, SCREENW-120, 20)];
    _search.delegate =self;
    [self.navigationController.navigationBar addSubview:_search];
    
}

-(void)requestData
{
    
   
    self.searchArr = [NSMutableArray arrayWithCapacity:0];
    
    
 

    NSString *text = _search.text;
    if ([text isEqualToString:@""]) {
        text = @"";
    }else
    {
        text = _content;
    }
    
    NSString *pathOne = [NSString stringWithFormat:@"%@%@",ComainURl,TicketUrl];
    NSString *path = [NSString stringWithFormat:pathOne,_search.text];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *message = responseObject[@"message"];
        NSDictionary *dict = responseObject[@"data"][0][@"data"];
        if ([message isEqualToString:@"成功"]) {
            SearchModel *model = [[SearchModel alloc]init];
            
            
                [model setValuesForKeysWithDictionary:dict];

                [self.searchArr addObject:model];
           
        }
        
        [self buildUI];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)buildUI
{
   
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[SearchCell class] forCellReuseIdentifier:@"SearchCell"];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}
#pragma mark---tableview代理方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _content = _search.text;
    [self requestData];
    [_tableView reloadData];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_search resignFirstResponder];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchArr.count;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 55;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
        SearchCell*cell=[tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
        if (self.searchArr.count) {
            
            cell.searchModel = self.searchArr[indexPath.row];
        }
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;

        return cell;
    
        
    
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
