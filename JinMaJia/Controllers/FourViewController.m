//
//  FourViewController.m
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "FourViewController.h"
#import "AboutViewController.h"
#import "AppDelegate.h"
#import "MyCell.h"
#import "LoginViewController.h"
#import "MyCustomerViewController.h"
#import "NotificationViewController.h"
#import "CheckUpdateViewController.h"
#import "MyMessageViewController.h"
@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    //头部视图
    UIImageView *imageView;
}
//图标
@property(nonatomic,strong)NSArray *logoArray;

@end

@implementation FourViewController

-(void)viewWillAppear:(BOOL)animated
{
    //判断是否登录成功，如果登录成功换掉头部的图片
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str =  [defaults objectForKey:@"LOGIN"];
    if ([str isEqualToString:@"OK"]) {
        imageView.image = [UIImage imageNamed:@"Customerbanner"];
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    [self initData];
    [self resetNav];
    
    [self buidUI];
}
#pragma mark - 初始化数组
-(void)initData
{
    self.logoArray = @[@"客服my",@"消息",@"设置",@"backGroundYwo",@"缓存",@"我们",@"更新",@"bottomSortO"];
 
    //注销和接受推送消息
//    [[UIApplication sharedApplication]unregisterForRemoteNotifications];
//    [[UIApplication sharedApplication]registerForRemoteNotifications];
    
    
}



#pragma mark - 设置标题
-(void)resetNav
{
    self.titleLable.text = @"我的";
    
    
}
#pragma mark - 创建UI
-(void)buidUI
{
   
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource  =self;
    _tableView.rowHeight = SCREENH/14;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = RGB(242, 242, 242, 1);
    
    
    UIView *topView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/6
                                                                +10) ];
    _tableView.tableHeaderView = topView;
     imageView = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/6) imageName:@"MyTopImage"];
       [topView addSubview:imageView];
    //给图片添加手势
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapTopImageView:)];
    tapGest.numberOfTapsRequired = 1;
    [topView addGestureRecognizer:tapGest];
    
    UIImageView *backGrundOne = [FactoryUI createImageViewWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), SCREENW, 10) imageName:@"backGroundOne"];
    [topView addSubview:backGrundOne];
    

    //去掉多余线条
    _tableView.tableFooterView = [[UIView alloc]init];
   

    
    
    
}
#pragma mark --添加顶部图片触发的方法
-(void)TapTopImageView:(UITapGestureRecognizer *)sender
{
    
    //判断是否登录成功，如果登录成功换掉头部的图片
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str =  [defaults objectForKey:@"LOGIN"];
    if ([str isEqualToString:@"OK"]) {
        return;
    }else{
        //没登录的时候登录
        LoginViewController *login = [[LoginViewController alloc]init];
        login.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:login animated:YES];

    }

    
}

#pragma mark - tableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.logoArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
       
        if (indexPath.row == 2 || indexPath.row == 3) {
          
        }
        
    }
  
        cell.logoImage.image = [UIImage imageNamed:self.logoArray[indexPath.row]];

   
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
       //我的客服
        MyCustomerViewController *custom = [[MyCustomerViewController alloc]init];
        [self.navigationController pushViewController:custom animated:YES];
        
    }
    else if (indexPath.row == 1){
       //我的消息
        MyMessageViewController *message = [[MyMessageViewController alloc]init];
        message.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:message animated:YES];
    }
    else if (indexPath.row == 2){
       //通知设置
        NotificationViewController *notification = [[NotificationViewController alloc]init];
        notification.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:notification animated:YES];
        
    }
    else if (indexPath.row == 4){
        //清理缓存
        [self folderSizeWithPath:[self getPath]];

        
    }else if (indexPath.row == 5){
        //关于我们
        AboutViewController *about = [[AboutViewController alloc]init];
        about.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:about animated:YES];
    }else if (indexPath.row == 6){
        //检查更新
        CheckUpdateViewController *check = [[CheckUpdateViewController alloc]init];
        check.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:check animated:YES];
    }
    
    
}
#pragma mark-计算缓存文件的大小
//首先找到缓存文件的路径
-(NSString *)getPath
{
    //缓存实质存在于沙盒目录下，libray路径下的cache文件夹
    NSString *path =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    return path;
}
//计算缓存文件夹的大小
-(CGFloat)folderSizeWithPath:(NSString *)path

{
    //初始化文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    CGFloat folderSize = 0.0;
    if ([fileManager fileExistsAtPath:path]) {
        //获取文件夹下所有文件
        NSArray *fileArray = [fileManager subpathsAtPath:path];
        for (NSString *fileName in fileArray) {
            //获取每个文件的路径
            NSString *filePath = [path stringByAppendingPathComponent:fileName];
            //计算每个文件的大小
            CGFloat fileSize = [fileManager attributesOfItemAtPath:filePath error:nil].fileSize;//字节
            //换算单位并且计算所有文件的大小总和
            folderSize += fileSize / 1024.0/1024.0;
            
            
        }
        //删除缓存文件
        [self deleteFileWithFolderSize:folderSize];
        
        return folderSize;
    }
    return 0;
    
}
//弹出对话框提示用户当前有多少缓存，询问用户是否确认删除
-(void)deleteFileWithFolderSize:(CGFloat )folderSize
{
    if (folderSize > 0.01) {
        
        
        UIAlertController *alert = [UIAlertController  alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"当前缓存为：%.2fM",folderSize] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self clearCacheAtPath:[self getPath]];
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }else
    {
        
        
        UIAlertController *alertT = [UIAlertController  alertControllerWithTitle:@"提示" message:@"当前无缓存" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionT = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertT addAction:actionT];
        [self presentViewController:alertT animated:YES completion:nil];
    }
    
}
-(void)clearCacheAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        //获取所有文件
        NSArray *fileArray = [fileManager subpathsAtPath:path];
        for (NSString *fileName in fileArray) {
            //可以过滤掉不想删除的文件格式
            if ([fileName hasPrefix:@".mp3"]) {
                NSLog(@"不删除");
            }else
            {
                //清理
                //获取每个文件的路径
                NSString *filePath = [path stringByAppendingPathComponent:fileName];
                //删除
                [fileManager removeItemAtPath:filePath error:nil];
            }
        }
    }
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
