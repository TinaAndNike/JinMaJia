//
//  FactoryUI.h
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FactoryUI : NSObject
//UIView
+(UIView *)createViewWithFrame:(CGRect)frame;
//UILable
+(UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font;
//UIButton
+(UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName target:(id)target selector:(SEL)selector;
//UIImageview
+(UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;
//UITextField
+(UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text placeholder:(NSString *)placeholder;

@end
