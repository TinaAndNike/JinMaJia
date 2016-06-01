//
//  NotificationViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/27.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "NotificationViewController.h"
#import "MessagePermitViewController.h"
#import "SLPlaySound.h"
@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buildUI];

}
-(void)buildUI
{
    self.titleLable.text = @"通知设置";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Notifibackground"]];
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    UIImageView *imageView = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/6) imageName:@"MyTopImage"];
    [self.view addSubview:imageView];
    //判断是否登录成功，如果登录成功换掉头部的图片
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str =  [defaults objectForKey:@"LOGIN"];
    if ([str isEqualToString:@"OK"]) {
        imageView.image = [UIImage imageNamed:@"Customerbanner"];
    }

    
    CGFloat X = 0;
    CGFloat Y = CGRectGetMaxY(imageView.frame);
    CGFloat W = SCREENW;
    CGFloat H =  SCREENW/10;
    NSArray *rightImageArray = @[@"Notificationicon",@"Notificationicon",@"",@"jiantou",@""];
    NSArray *imageArray = @[@"shengyin",@"zhendong",@"wenan",@"miandarao",@"tishi"];
    for (int i = 0; i < 5; i ++) {
        UIImageView *contetImage = [[UIImageView alloc]initWithFrame:CGRectMake(X, Y + H * i, W, H)];
        contetImage.image = [UIImage imageNamed:imageArray[i]];
        if (i == 3) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapMessagePermit:)];
            [contetImage addGestureRecognizer:tap];

        }
                contetImage.userInteractionEnabled = YES;
        [self.view addSubview:contetImage];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENW-100, 5, 45, contetImage.frame.size.height - 10)];
        [btn setImage:[UIImage imageNamed:rightImageArray[i]] forState:UIControlStateNormal];

        if (i == 0||i ==1) {
            [btn setImage:[UIImage imageNamed:@"kaiqi"] forState:UIControlStateSelected];
        }
        if (i == 3) {
            btn.frame = CGRectMake(SCREENW - 60, 10, 10, contetImage.frame.size.height - 20);
        }
        btn.tag = 200 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [contetImage addSubview:btn];
        
        
        
        
    }
    
}
#pragma mark -----功能消息免打扰
-(void)TapMessagePermit:(UITapGestureRecognizer *)sender
{
    
    MessagePermitViewController *permit = [[MessagePermitViewController alloc]init];
            [self.navigationController pushViewController:permit animated:YES];
            
    
}
#pragma mark ----声音开关按钮
-(void)btnClick:(UIButton *)sender
{
    NSInteger tag = sender.tag - 200;
    switch (tag) {
        case 0:
        {
            sender.selected = !sender.selected;
            if (sender.selected == YES) {
                NSLog(@"开声音");
                SLPlaySound *playsound = [[SLPlaySound alloc]initForPlayingSoundEffectWith:@"sound.caf"];
                [playsound play];
            }
            
        }
            
            
            break;
        case 1:
        {
            sender.selected = !sender.selected;

            if (sender.selected == YES) {
                NSLog(@"开震动");
                
                SLPlaySound *playsound = [[SLPlaySound alloc]initForPlayingVibrate];
                [playsound play];
            }


        }
            
            break;
         
            default:
            break;
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
