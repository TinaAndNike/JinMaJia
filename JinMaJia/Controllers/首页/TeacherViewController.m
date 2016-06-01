//
//  TeacherViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/17.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TeacherViewController.h"
#import "TeacherModelFrame.h"
#import "TeacherCell.h"
#import "TeacherModel.h"
@interface TeacherViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation TeacherViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.titleLable.text = @"老师";
    
    [self requestData];

    
    

}
#pragma mark ----tableview的代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherModelFrame *modelFrame = self.dataArray[indexPath.row];
    return modelFrame.RowHeight;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TeacherModelFrame *modelFrame =  _dataArray[indexPath.row];
    
    NSString *rID = @"teacher_cell";
    TeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:rID];
    if (cell == nil) {
        cell = [[TeacherCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:rID];
    }
   
        cell.teacherModelFrame = modelFrame;
        cell.backgroundColor = [UIColor clearColor];
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
-(void)requestData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *arrayModels = [NSMutableArray array];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,TeacherUrl];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        
        for (NSDictionary *dic in array) {
            TeacherModel *model = [[TeacherModel alloc]initWithDict:dic];
            TeacherModelFrame *modelFrame = [[TeacherModelFrame alloc]init];
            modelFrame.Teachermodel = model;
            [arrayModels addObject:modelFrame];
        }
        
        
        _dataArray = arrayModels;
        [self buildUI];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];

        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)buildUI
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 200;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTeacher"]];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
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
