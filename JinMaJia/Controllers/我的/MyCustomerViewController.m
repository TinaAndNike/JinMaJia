//
//  MyCustomerViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/25.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MyCustomerViewController.h"
#import "CustomHeader.h"
#import "CustomGroup.h"
@interface MyCustomerViewController ()<UITableViewDataSource,UITableViewDelegate,CustomHeaderDelegate>
{
    UITableView *_tableView;
    BOOL isVisible;
    NSArray *array;

}
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation MyCustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLable.text = @"我的客服";
    [self requestData];
    [self buildUI];


}
-(void)requestData
{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
//    array = @[@"短期人民币汇率料仍以什么震荡为主？",@"如何优化金融生态环境以及创新信用体系建设？",@"为什么人民币中间价连跌明显，未形成贬值预期？",@"金融营改增 影响现差异化，证券业务受影响？"];
    array = @[
              @{
                  @"content":@"短期人民币汇率料仍以什么震荡为主？"
                  
                  
                  },
              @{
                   @"content":@"如何优化金融生态环境以及创新信用体系建设？"
                  },
              @{
                  @"content":@"为什么人民币中间价连跌明显，未形成贬值预期？"
                  },
              @{
                  @"content":@"金融营改增 影响现差异化，证券业务受影响？"
                  }
              
              ];
    
    for (NSDictionary *dict in array) {
        CustomGroup *group = [[CustomGroup alloc]initWithDict:dict];
        [self.dataArray addObject:group];
    }

}
#pragma mark ----customer代理方法刷新tableview
-(void)gruopHeaderViewDidCllickTitleButton:(CustomHeader *)groupHeaderView
{
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];

}
-(void)buildUI
{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionHeaderHeight = 40;
    _tableView.rowHeight = 100;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableView];
    
    
    
    UIView *topView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/6 + 10)];
    _tableView.tableHeaderView = topView;
    UIImageView *imagetop = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/6) imageName:@"Customerbanner"];
    [topView addSubview:imagetop];
    UIImageView *leftImage = [FactoryUI createImageViewWithFrame:CGRectMake(SCREENW-100, imagetop.frame.size.height/2-25, 50, 50) imageName:@"icon04Customer"];
    [imagetop addSubview:leftImage];
    UIImageView *botom = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(imagetop.frame), SCREENW, 10) imageName:@"customTop"];
    [topView addSubview:botom];
    
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    UIImageView *back = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(_tableView.frame), SCREENW, SCREENH/2+50) imageName:@"CustomContent"];
    _tableView.tableFooterView = back;
    
}
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark---tableview数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CustomGroup *gruop = self.dataArray[section];
    
    if (gruop.isVisible) {
        return 1;
    }else
    {
        return 0;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    NSArray *contenArray = @[@"经过此前连续多个交易日的震荡走软后，周三（5月11日）人民币对美元汇率中间价、即期汇价均出现小幅反弹，整体仍维持在近两个月以来的宽幅震荡区间之内。与此同时，近期人民币离岸汇价与境内即期汇价的倒挂价差仍处于相对高位。分析人士指出，目前市场各方正进一步等待4月金融数据的公布，短期人民币汇率料仍以横向震荡为主。",@"我们需要什么样的信用体系？金融信用建设如何创新？这是每个信用体系参与者都面临的问题。日前，国家发展和改革委员会宏观经济管理编辑部、中宏网、弘安控股联合宣布将于6月18日组织召开首届金融信用建设创新峰会，旨在共同探讨金融信用建设的创新模式，规范引导行业发展方向，期望引起社会各界对信用体系建设、金融创新两个主题的关注和深入讨论。",@"来自中国外汇交易中心的数据显示，5月10日人民币对美元汇率中间价报6.5233，较前一交易日（5月9日）中间价6.5105贬值128点。与此同时，人民币对美元在询价交易系统中收报6.5155元，较前一交易日下跌87个基点。",@"“营改增”后金融行业适用6%的税率，较原来5%的营业税率提高1个百分点。中央财经大学税务学院教授樊勇表示，表面上看，“营改增”后金融行业名义税率提高1个百分点，但这并不代表实际税负会加重。考虑到允许金融企业将外购房产、设备及服务中所含的增值税税金进行抵扣，企业缴纳流转环节的税收不但不会上升，反而会下降。但个别企业由于外购可抵扣项目处于改革不同时点，会存在可抵扣项目少而出现增税的现象。中长期来看，所有企业的税负是下降的。"];
    cell.textLabel.font = [UIFont systemFontOfSize:11];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CustomContent"]];
    cell.textLabel.text = contenArray[indexPath.section];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomGroup *group =self.dataArray[section];
    CustomHeader *header = [CustomHeader groupHeaderViewTableView:tableView];
    header.tag = section;
    header.delegate = self;
    header.content = group;
    
    return header;
    
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
