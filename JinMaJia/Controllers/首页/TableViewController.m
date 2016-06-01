//
//  TableViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TableViewController.h"
#import "TableModel.h"

@interface TableViewController ()

@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    
    
}
-(void)requestData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = [NSString stringWithFormat:@"%@%@",ComainURl,TableUrl];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        for (NSDictionary *dict in array) {
            TableModel *model = [[TableModel alloc]initWithDict:dict];
            [_dataArray addObject:model];
            
        }
        [self buildUI];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
-(void)buildUI
{
    self.titleLable.text = @"课程表";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    
    UIImageView *BackImage = [FactoryUI createImageViewWithFrame:CGRectMake(15, 30, SCREENW - 30, SCREENH - 110) imageName:@"表格"];
//    BackImage.center = self.view.center;
    [self.view addSubview:BackImage];
   
    
    
    
    TableModel *model = [[TableModel alloc]init];
   //循环创建lable
   
    CGFloat W = BackImage.frame.size.width/6;
    CGFloat margin = 10;
    CGFloat H = (BackImage.frame.size.height - 130) / 12;
    for (int i = 0; i < self.dataArray.count * 6; i ++) {
        NSInteger h = i / 6;
        NSInteger l = i % 6;
        model = self.dataArray[h];
        NSString *time = [NSString stringWithFormat:@"%@-%@",model.startTime,model.endTime];
        NSArray *title = @[time,model.monday,model.tuesday,model.wednesday,model.thursday,model.friday];
         CGFloat Y = 20 + (H + margin) * h;
        CGFloat X = W * l;
        UILabel *lable = [FactoryUI createLableWithFrame:CGRectMake(X, Y, W, H) text:nil font:[UIFont systemFontOfSize:13]];
        lable.textColor = [UIColor darkGrayColor];
        lable.textAlignment = NSTextAlignmentCenter;
//        lable.backgroundColor = [UIColor yellowColor];
        lable.text = title[l];
        [BackImage addSubview:lable];
        
        
    }
    
    
    
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
