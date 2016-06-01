//
//  AdvantageViewController.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/26.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "AdvantageViewController.h"

@interface AdvantageViewController ()<UITextViewDelegate>
{
    UITextView *_textField;
    UILabel *placeLable;
}
@end

@implementation AdvantageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  
    [self buildUI];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
}
-(void)buildUI
{
    self.titleLable.text = @"意见反馈";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *topImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/2.5) imageName:@"AboutUsImage"];
    [self.view addSubview:topImage];

    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self addLeftTarget:@selector(backButtonClick)];
    
    UIImageView *advantageImage = [FactoryUI createImageViewWithFrame:CGRectMake(30, CGRectGetMaxY(topImage.frame)+20, SCREENW-60, SCREENW/2+20) imageName:@"意见fason"];
    advantageImage.userInteractionEnabled  =YES;
    [self.view addSubview:advantageImage];
    
    UIButton *finishBtn = [FactoryUI createButtonWithFrame:CGRectMake(advantageImage.frame.origin.x, CGRectGetMaxY(advantageImage.frame), advantageImage.frame.size.width, 30) title:nil titleColor:nil imageName:nil backgroundImageName:@"完成" target:self selector:@selector(FinishButtonClick)];
    [self.view addSubview:finishBtn];
    
    _textField = [[UITextView alloc]initWithFrame:CGRectMake(1,  25, advantageImage.frame.size.width-2, advantageImage.frame.size.height - 30)];
    _textField.delegate = self;
//    _textField.backgroundColor = [UIColor redColor];
    [advantageImage addSubview:_textField];
    
    
   placeLable = [FactoryUI createLableWithFrame:CGRectMake(0, 5, advantageImage.frame.size.width, 20) text:@"请输入您的反馈意见和建议" font:[UIFont systemFontOfSize:10]];
    placeLable.textColor = RGB(221, 222, 222, 1);
    [_textField addSubview:placeLable];
    
}
#pragma mark----textview代理方法
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    placeLable.hidden = YES;
    return YES;
}
#pragma mark ---- 点击完成按钮的事件
-(void)FinishButtonClick
{

    if ([_textField.text isEqualToString:@""]) {
        [self showUIAlterViewWithStr:@"请输入您要反馈的意见"];
    }else
    {
        _textField.text = @"";
        placeLable.hidden = NO;
    [self showUIAlterViewWithStr:@"您的意见已经发送成功!"];
    }
    
}
-(void)showUIAlterViewWithStr:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
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
