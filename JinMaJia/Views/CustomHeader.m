//
//  CustomHeader.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/25.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "CustomHeader.h"
#import "CustomHeader.h"
#import "CustomGroup.h"
@interface CustomHeader()
@property(nonatomic,weak) UIButton *btnGroupTitle;
@property(nonatomic,weak)UIImageView *leftImageView;
@property(nonatomic,weak)UIImageView *rightImageView;
@end


@implementation CustomHeader
//封装一个类方法来创建headerview
+(instancetype)groupHeaderViewTableView:(UITableView *)tableView
{
    //2.创建uitableviewHeaderFooterview
    //2.创建uitableviewHeaderFooterview
    static NSString *ID = @"group_header_View";
    CustomHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[CustomHeader alloc]initWithReuseIdentifier:ID];
    }
    return headerView;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
       
        
        UIButton *btn = [FactoryUI createButtonWithFrame:CGRectMake(0, 0, SCREENW, 50) title:nil titleColor:[UIColor darkGrayColor] imageName:nil backgroundImageName:nil target:self selector:@selector(CLickBtnOpen)];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.contentEdgeInsets = UIEdgeInsetsMake(10, 80, 10, 70);
        [self.contentView addSubview:btn];
        self.btnGroupTitle = btn;
        UIImageView * leftImageView = [FactoryUI createImageViewWithFrame:CGRectMake(50, 15, 15, 15) imageName:@"iconOneoUnselect"];
         UIImageView * rightImageView = [FactoryUI createImageViewWithFrame:CGRectMake(SCREENW - 60, 15, 15, 15) imageName:@"iconTwoUnselect"];
        [btn addSubview:leftImageView];
        [btn addSubview:rightImageView];
        self.leftImageView = leftImageView;
        self.rightImageView = rightImageView;

    }
    return  self;
}
-(void)CLickBtnOpen
{

    self.content.visible = !self.content.isVisible;
    //刷新tableview刷新的时候会重新创建一个新的headerview
    //通过代理来实现
    if ([self.delegate respondsToSelector:@selector(gruopHeaderViewDidCllickTitleButton:)]) {
        [self.delegate gruopHeaderViewDidCllickTitleButton:self];
    }

}
-(void)setContent:(CustomGroup *)content
{
    _content = content;
 [self.btnGroupTitle setTitle:content.content forState:UIControlStateNormal];

}

//当一个新的headerview已经加到某个父控件的时候会执行这个方法
-(void)didMoveToSuperview
{
    if (self.content.isVisible) {
        //让按钮图片实现旋转
        _leftImageView.image = [UIImage imageNamed:@"iconOneSelected"];
        _rightImageView.image = [UIImage imageNamed:@"iconTwoSelected"];
    }   else
    {
        //让按钮图片实现旋转
        _leftImageView.image = [UIImage imageNamed:@"iconOneoUnselect"];
        _rightImageView.image = [UIImage imageNamed:@"iconTwoUnselect"];

    }
    

}

@end
