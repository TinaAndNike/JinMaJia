//
//  TeacherModelFrame.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TeacherModelFrame.h"
#import "NSString+CZNSStringExt.h"
#import "TeacherModel.h"
@implementation TeacherModelFrame
-(void)setTeachermodel:(TeacherModel *)Teachermodel{
    _Teachermodel = Teachermodel;
    //头像的frame
    CGFloat picX = 30;
    CGFloat picY = 15;
    CGFloat picW = SCREENW/6;
    CGFloat picH = picW;
    _picFrame = CGRectMake(picX, picY, picW, picH);
    
    //名字的frame
    CGFloat analystNameX = CGRectGetMaxX(_picFrame) + 20;
    CGFloat analystNameY = picY;
    CGFloat analystNameW = 200;
    CGFloat analystNameH = 25;
    _analystNameFrame = CGRectMake(analystNameX, analystNameY, analystNameW, analystNameH);
    
    //内容的frame
    CGSize contentSize = [Teachermodel.content sizeOfTextWithMaxSize:CGSizeMake(analystNameW, MAXFLOAT) font:[UIFont systemFontOfSize:13]];
    CGFloat contentX = analystNameX -5;
    CGFloat contentY = analystNameY+5;
    CGFloat contentW = analystNameW ;
    CGFloat contentH = contentSize.height+50;
    _contentFrame = CGRectMake(contentX, contentY, contentW, contentH);
    CGFloat maxY =MAX(CGRectGetMaxY(_picFrame), CGRectGetMaxY(_contentFrame));
    _RowHeight = maxY;
    
    
    
   
}
@end
