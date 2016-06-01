//
//  TeacherModelFrame.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TeacherModel;
@interface TeacherModelFrame : NSObject
@property(nonatomic,strong)TeacherModel *Teachermodel;
//名字的frame
@property(nonatomic,assign,readonly)CGRect analystNameFrame ;
//内容的frame
@property(nonatomic,assign,readonly)CGRect contentFrame ;
//头像的frame
@property(nonatomic,assign,readonly)CGRect picFrame ;

//行高
@property(nonatomic,assign,readonly)CGFloat RowHeight ;

@end
