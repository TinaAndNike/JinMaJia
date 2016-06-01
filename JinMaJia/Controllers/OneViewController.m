//
//  OneViewController.m
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "OneViewController.h"
#import "SLButton.h"
#import "MainCell.h"
#import "MainModel.h"
#import "FastNewsDetailViewController.h"
#import "WeiPanViewController.h"
#import "TwoViewController.h"
#import "LoginViewController.h"
#import "TeacherViewController.h"
#import "OrderViewController.h"
#import "TableViewController.h"
#import "OpenAcountViewController.h"
#import "TicketViewController.h"
#import "RateViewController.h"
@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    Carousel *_cyclingPlaying;
}
//数据源
@property(nonatomic,strong)NSMutableArray *dataArray;
//轮播图数据源
@property(nonatomic,strong)NSMutableArray *caroulArray;

@end

@implementation OneViewController

-(void)viewWillAppear:(BOOL)animated
{
    //快讯请求 为了能实时刷新
    [self requestData];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLable.text = @"金掌柜";
    
    //开户按钮
    UIButton *OpenAccount = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 25)];
    [OpenAccount setBackgroundImage:[UIImage imageNamed:@"开户74x44hpx"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:OpenAccount];
    self.navigationItem.rightBarButtonItem = leftItem;
    [OpenAccount addTarget:self action:@selector(ClickOpenAccount) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}
-(void)requestData
{
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"keywords":@"原油沥青现货白银黄金"};
    NSString *Path = [NSString stringWithFormat:@"%@%@",ComainURl,FastNewsUrl];
    [manager GET:Path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        for (NSDictionary *dict in array) {
            MainModel *model = [[MainModel alloc]initWithDict:dict];
            [_dataArray addObject:model];
        }
        //搭建tableview
        [self buildUI];
        //搭建头部轮播图
        [self buildTopView];
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}
-(void)buildTopView
{
    //头部大view创建
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/3*2-20)];
    topView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = topView;
    topView.userInteractionEnabled = YES;
    //  轮播图创建
    UIView *caroulView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, topView.frame.size.height/2-30)];
    caroulView.backgroundColor = [UIColor greenColor];
    [topView addSubview:caroulView];
    _cyclingPlaying = [[Carousel alloc]initWithFrame:CGRectMake(0, 0, SCREENW, caroulView.frame.size.height)];
    _cyclingPlaying.pageControlPositionType = YES;
    _cyclingPlaying.infiniteLoop = YES;
    _cyclingPlaying.pageControlPositionType = PAGE_CONTROL_POSITION_TYPE_RIGHT;
//    [_cyclingPlaying setImageUrlArray:_caroulArray];
    
//    按钮循环创建
    CGFloat margin = 2;
     NSArray *ImageArray = @[@"直播",@"客服",@"喊单",@"股票",@"老师",@"课程表",@"微盘",@"汇率"];
    CGFloat btnMaxY = 0.0;
    for (int i = 0; i < ImageArray.count; i ++) {
        //第一排按钮Y值
        CGFloat binY = CGRectGetMaxY(caroulView.frame);;
        CGFloat btnW = (SCREENW - 5 * margin)/ 4;
        CGFloat btnH = (CGRectGetMaxY(topView.frame)-CGRectGetMaxY(caroulView.frame)-32)/2;
        NSLog(@"%f",self.view.frame.size.width);
        NSInteger h = i / 4;
        NSInteger l = i % 4;
        
        CGFloat btnY = binY + (btnH + margin) * h;
        CGFloat btnX = margin + (margin + btnW) * l;
        SLButton *btn = [[SLButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        btn.backgroundColor = [UIColor yellowColor];
        
        
        //去除按钮点击时候的阴影颜色
        btn.adjustsImageWhenHighlighted = NO;
        
        [btn setBackgroundImage:[UIImage imageNamed:ImageArray[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        btn.tag = 100 + i;
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        //给按钮添加点击事件
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:btn];
        btnMaxY = CGRectGetMaxY(btn.frame);
        
    }

    
    
    
       //快讯的创建
    UIImageView *FastNews = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"快讯"] highlightedImage:UIControlStateNormal];
    FastNews.frame = CGRectMake(0, btnMaxY, SCREENW, 30);
    [topView addSubview:FastNews];
    
}
#pragma mark---点击哪个按钮事件
-(void)clickBtn:(UIButton *)sender
{
    NSInteger tag = sender.tag - 100;
    switch (tag) {
        case 0:
        {
            //直播
            //先登录
            //判断是否登录成功，如果登录成功就直接跳转到直播界面
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *login =  [defaults objectForKey:@"LOGIN"];
            if ([login isEqualToString:@"OK"]) {
                //登录成功了
                TwoViewController *two = [[TwoViewController alloc]init];
                [self.navigationController pushViewController:two animated:NO];
                
                
            }else{

               LoginViewController *login = [[LoginViewController alloc]init];
              login.hidesBottomBarWhenPushed = YES;
              [self.navigationController pushViewController:login animated:YES];
            }
            
        }
            break;
        case 1:
        {
            //客服
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您没有安装手机QQ，请安装手机QQ后重试，或用PC进行操作" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
      
            break;
        case 2:
        { //先登录
            //喊单
            //判断是否登录成功，如果登录成功就直接跳转到喊单界面
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *login =  [defaults objectForKey:@"LOGIN"];
            if ([login isEqualToString:@"OK"]) {
                //登录成功了
                OrderViewController *order = [[OrderViewController alloc]init];
//                order.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:order animated:YES];
                
                
            }else{

            LoginViewController *login = [[LoginViewController alloc]init];
            login.hidesBottomBarWhenPushed = YES;

            [self.navigationController pushViewController:login animated:YES];
            }
            
        }
            break;
        case 3:
        {
            //股票
            TicketViewController *ticket = [[TicketViewController alloc]init];
            [self.navigationController pushViewController:ticket animated:YES];
            
        }
            
            break;
        case 4:
        {
            //老师
            TeacherViewController *teacher = [[TeacherViewController alloc]init];
            teacher.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:teacher animated:YES];
        }
            break;
        case 5:
        {
            
            
            //先登录
            //判断是否登录成功，如果登录成功就直接跳转到课程表界面
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *login =  [defaults objectForKey:@"LOGIN"];
            if ([login isEqualToString:@"OK"]) {
                //登录成功了
                TableViewController *table = [[TableViewController alloc]init];
//                table.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:table animated:YES];
                
                
            }else{

            LoginViewController *login = [[LoginViewController alloc]init];
            login.hidesBottomBarWhenPushed = YES;

            [self.navigationController pushViewController:login animated:YES];
            }
            
        }
            break;
        case 6:
        {
            //微盘
            WeiPanViewController *wepan = [[WeiPanViewController alloc]init];
            wepan.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:wepan animated:YES];

        }
            
            break;
        case 7:
        {
            RateViewController *rate = [[RateViewController alloc]init];
            rate.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:rate animated:YES];
        }
            
            break;
        default:
            break;
    }
}
#pragma mark ----调用QQ的方法
- (BOOL)joinGroup:(NSString *)groupUin key:(NSString *)key{
    NSString *urlStr = [NSString stringWithFormat:@"mqqapi://card/show_pslcard?src_type=internal&version=1&uin=6481427ed9be2a6b6df78d95f2abf8a0ebaed07baefe3a2bea8bd847cb9d84ed&card_type=group&source=external"];
    NSURL *url = [NSURL URLWithString:urlStr];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://wpa.qq.com/msgrd?v=3&uin=812088438&site=qq&menu=yes"]];
        return YES;
    }
    else return NO;
}


-(void)buildUI
{
    _caroulArray = [NSMutableArray arrayWithCapacity:0];
    
    _tableView = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, SCREENW, SCREENH) style:UITableViewStylePlain];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[MainCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}
#pragma mark -- 开户按钮点击事件
-(void)ClickOpenAccount
{

    
    //判断是否登录成功，如果登录成功就直接跳转到开户界面
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login =  [defaults objectForKey:@"LOGIN"];
    if ([login isEqualToString:@"OK"]) {
        //登录成功了
        OpenAcountViewController *open = [[OpenAcountViewController alloc]init];
        open.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:open animated:YES];
        
        
    }else{
    
    //先登录
    LoginViewController *login = [[LoginViewController alloc]init];
    login.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:login animated:YES];
    }
}
#pragma mark -----tableview的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"底纹"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_dataArray.count != 0) {
        cell.model = _dataArray[indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    FastNewsDetailViewController *detail = [[FastNewsDetailViewController alloc]init];
    MainModel *model = _dataArray[indexPath.row];
    detail.url = model.url;
    [self.navigationController pushViewController:detail animated:YES];
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
