//
//  MessagePermitViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/30.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MessagePermitViewController.h"
@interface MessagePermitViewController ()
{
    UIImageView *rightImage;
}
@end

@implementation MessagePermitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self buildUI];
}
-(void)buildUI{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.titleLable.text = @"通知设置";
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
    NSArray *imageArray = @[@"zkaiqi",@"yejiankaiqi",@"zguanbi",@"tixing"];
    for (int i = 0; i < imageArray.count; i ++) {
        UIButton *btn = [FactoryUI createButtonWithFrame:CGRectMake(X,Y + H * i , W, H) title:nil titleColor:nil imageName:nil backgroundImageName:imageArray[i] target:self selector:@selector(ClickBtn:)];
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateHighlighted];
        btn.tag = 400 + i;
        if (i == 3) {
            btn.frame = CGRectMake(0,Y + (H+5) * i , W, H-5);
        }
        [self.view addSubview:btn];
        if (i == 2) {
            rightImage = [FactoryUI createImageViewWithFrame:CGRectMake(W - 100,btn.frame.origin.y + 10, 20, 20) imageName:@"dui"];
            [self.view addSubview:rightImage];
        }
        
    }
}
#pragma mark ----点击了那个按钮
-(void)ClickBtn:(UIButton  *)sender
{
    
    NSInteger tag = sender.tag  -400;
    switch (tag) {
        case 0:
        //关闭推送
            rightImage.frame = CGRectMake(SCREENW- 100, sender.frame.origin.y+10, 20, 20);
            [[UIApplication sharedApplication]unregisterForRemoteNotifications];

            break;
        case 1:
        { //只在夜间关闭推送
            rightImage.frame = CGRectMake(SCREENW- 100, sender.frame.origin.y+10, 20, 20);
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"HH"];
            NSString *str = [formatter stringFromDate:[NSDate date]];
            int time = [str intValue];
            if (time>=20||time<=06) {
                NSLog(@"晚上");
                
                [[UIApplication sharedApplication]unregisterForRemoteNotifications];

            }
            else{
                NSLog(@"早上");
            }
       }

            break;
        case 2:
            //开启推送
            rightImage.frame = CGRectMake(SCREENW- 100, sender.frame.origin.y+10, 20, 20);
            [[UIApplication sharedApplication]registerForRemoteNotifications];

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
