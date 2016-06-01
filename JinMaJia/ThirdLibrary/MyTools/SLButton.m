//
//  SLButton.m
//  自定义按钮Demo
//
//  Created by qianfeng on 16/1/6.
//  Copyright (c) 2016年 sunli. All rights reserved.
//

#import "SLButton.h"

@implementation SLButton
#pragma mark 设置button 内部图片的位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    //图片宽度等于按钮宽度
    CGFloat imageW = contentRect.size.width;
    //文字高度占0.3
    CGFloat imageH = contentRect.size.height * 0.7;
    
    return CGRectMake(0, 0, imageW, imageH);
}
#pragma mark 设置按钮内部文字的位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * 0.7;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.3;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end


































