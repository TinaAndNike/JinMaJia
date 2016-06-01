//
//  TableModel.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        _Id = dict[@"id"];
        _startTime = dict[@"startTime"];
        _endTime = dict[@"endTime"];
        _monday = dict[@"monday"];
        _tuesday = dict[@"tuesday"];
        _wednesday = dict[@"wednesday"];
        _thursday = dict[@"thursday"];
        _friday = dict[@"friday"];
        _gid = dict[@"gid"];
    }
    return self;
}
@end
