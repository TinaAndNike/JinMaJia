//
//  BaseViewController.h
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//左按钮
@property (nonatomic,strong)UIButton *leftButton;
//标题
@property (nonatomic,strong)UILabel *titleLable;
//右按钮
@property (nonatomic,strong)UIButton *rightButton;
//设置相应方法
-(void)addLeftTarget:(SEL)selector;
-(void)addRightTaget:(SEL)selector;
@end
