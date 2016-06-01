//
//  TwoViewController.m
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TwoViewController.h"
#import <PlayerSDK/PlayerSDK.h>
@interface TwoViewController ()<GSPPlayerManagerDelegate>
{
    GSPPlayerManager *_playerManager;
    CGRect videoViewRect;//记录videoView的原始尺寸
    BOOL hasOrientation;
    GSPVideoView *_videoView;
    UIButton *PlayBtn;
    GSPJoinParam *joinParam;
    //双击
    UITapGestureRecognizer *tapGestureRecognizer;
    //单击
    UITapGestureRecognizer *StoptapGestureRecognizer;
}


@end

@implementation TwoViewController
{
    int i;
}
-(void)viewWillAppear:(BOOL)animated
{

    PlayBtn.hidden = NO;
     [_videoView addSubview:PlayBtn];
}
-(void)viewWillDisappear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [_playerManager leave];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buidUI];

    

    
}
-(void)buidUI
{
      self.titleLable.text = @"直播";

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundTeacher"]];

    
    UIImageView *backImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/2-50) imageName:@"bannerLive"];
    backImage.userInteractionEnabled = YES;
    [self.view addSubview:backImage];
    PlayBtn = [FactoryUI createButtonWithFrame:CGRectMake(0, 0, SCREENW/5, SCREENW/5) title:nil titleColor:nil imageName:nil backgroundImageName:@"播放ICON" target:self selector:@selector(PlayBtnClick:)];
    PlayBtn.center = backImage.center;
    [backImage addSubview:PlayBtn];
    
  
    UIImageView *content = [FactoryUI createImageViewWithFrame:CGRectMake(50, CGRectGetMaxY(backImage.frame)+25, SCREENW - 100, SCREENH/2-100) imageName:@"contentLive"];
//    content.backgroundColor = [UIColor redColor];

    [self.view addSubview:content];

    
}
-(void)PlayBtnClick:(UIButton *)sender
{
    // 设置视频播放管理类
    _playerManager = [[GSPPlayerManager alloc] init];
    _playerManager.delegate = self;
    [_playerManager enableVideo:YES];
    [_playerManager enableAudio:YES];
    
    //设置直播参数
    joinParam = [[GSPJoinParam alloc] init];
    joinParam.domain = [@"yxhcorp.gensee.com" stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    joinParam.serviceType = GSPServiceTypeWebcast;
    joinParam.roomNumber = [@"40663758" stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    joinParam.nickName = [@"ios" stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    joinParam.watchPassword = [@"" stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    joinParam.thirdToken = @"dd020436921d43a79dcf6965415179f8";
    joinParam.oldVersion = NO;
    
    
    
    i = 0;
    
    hasOrientation = NO;
    
    
    CGFloat y = [[UIApplication sharedApplication]statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    [_playerManager enableVideo:YES];
    [_playerManager enableAudio:YES];
    //适配iOS6
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        y = 0;
    }
    
    //Video View
    videoViewRect = CGRectMake(0, 0, SCREENW, SCREENH/2-50);
    
    
    // 创建视频播放view
    _videoView = [[GSPVideoView alloc]initWithFrame:videoViewRect];
    [self.view addSubview:_videoView];
    _playerManager.videoView = _videoView;
    
    //加入直播
        [_playerManager joinWithParam:joinParam];
    
    //双击 全屏
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rotationVideoView:)];
    tapGestureRecognizer.numberOfTapsRequired = 2;
    [_videoView addGestureRecognizer:tapGestureRecognizer];
    
    //单击
   StoptapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stopGetgTap:)];
    StoptapGestureRecognizer.numberOfTapsRequired = 1;
    [_videoView addGestureRecognizer:StoptapGestureRecognizer];
    //防止两个手势的产生冲突
    [StoptapGestureRecognizer requireGestureRecognizerToFail:tapGestureRecognizer];
    
   

}
-(void)stopGetgTap:(UITapGestureRecognizer *)sender
{
    
    [_videoView addSubview:PlayBtn];
    [_playerManager leave];
    
    
}

- (void)rotationVideoView:(UIGestureRecognizer *)gestureRecognizer {
    [_playerManager joinWithParam:joinParam];

    [PlayBtn removeFromSuperview];
    
    [self.view endEditing:YES];//收起键盘
    //强制旋转
    if (!hasOrientation) {
        PlayBtn.hidden = YES;

        [UIView animateWithDuration:0.5 animations:^{
            self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
            self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            _videoView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
            _videoView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
            hasOrientation = YES;
            //            self.chatView.hidden = YES;
            [self.navigationController setNavigationBarHidden:YES animated:NO];
            self.tabBarController.tabBar.hidden = YES;

            //            [[UIApplication sharedApplication] setStatusBarHidden:YES];
        }];
    } else {

        PlayBtn.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.transform = CGAffineTransformInvert(CGAffineTransformMakeRotation(0));
            self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            _videoView.frame = videoViewRect;
            hasOrientation = NO;
            

            //            self.chatView.hidden = NO;
            //            [[UIApplication sharedApplication] setStatusBarHidden:NO];
            self.navigationController.navigationBarHidden = NO;
            self.tabBarController.tabBar.hidden = NO;

        }];
    }
}
-(BOOL)shouldAutorotate
{
    return NO;
}
- (void)hideKeyboard {
    [self.view endEditing:YES];
}

-(void)dealloc
{
    [_playerManager leave];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
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
