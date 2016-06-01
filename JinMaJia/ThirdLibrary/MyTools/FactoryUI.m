//
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "FactoryUI.h"

@implementation FactoryUI
//UIView
+(UIView *)createViewWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    return view;
}
//UILable
+(UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font

{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = font;
    return label;
    
}
//UIButton
+(UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName target:(id)target selector:(SEL)selector
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    button.frame = frame;
    //设置标题
    [button setTitle:title forState:UIControlStateNormal];
    //设置标题颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //设置图片
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    
    //添加相应方法
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//UIImageview
+(UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image =[UIImage imageNamed:imageName];
    return imageView;
}
//UITextField
+(UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text placeholder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.text = text;
    textField.placeholder = placeholder;
    return textField;
    
}

@end
