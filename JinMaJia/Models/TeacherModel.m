//
//  TeacherModel.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/17.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TeacherModel.h"

@implementation TeacherModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _Id = dict[@"id"];
        _analystName = dict[@"analystName"];
        _content = dict[@"content"];
        _pic = dict[@"pic"];
        _rid = dict[@"rid"];
        _gid = dict[@"gid"];
        
    }
    return self;
}
@end
