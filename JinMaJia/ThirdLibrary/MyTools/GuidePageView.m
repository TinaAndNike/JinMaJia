//
//  GuidePageView.m
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "GuidePageView.h"
@interface GuidePageView()
{
    UIScrollView *_scrollView;
}
@end

@implementation GuidePageView

-(id)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray
{
    if (self = [super initWithFrame:frame]) {
        //创建ScrollView
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH + 64)];
        //设置分页
        _scrollView.pagingEnabled = YES;
        [self addSubview:_scrollView];
        //设置contentSize
        _scrollView.contentSize =CGSizeMake(imageArray.count * _scrollView.frame.size.width, _scrollView.frame.size.height);
        for ( int i = 0; i < imageArray.count; i ++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i *SCREENW, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
            imageView.image = [UIImage imageNamed:imageArray[i]];
            [_scrollView addSubview:imageView];
            
            
            if (i == imageArray.count - 1) {
                //跳转按钮
                self.goInButton = [FactoryUI createButtonWithFrame:CGRectMake(SCREENW-80    , SCREENH-80, 80, 80) title:nil titleColor:nil imageName:nil backgroundImageName:nil target:nil selector:nil];
//                self.goInButton.backgroundColor = [UIColor redColor];
                //开启用户交互
                imageView.userInteractionEnabled = YES;
                [imageView addSubview:self.goInButton];
                
            }
            
            
        }
        
    }
    return self;
}
@end
