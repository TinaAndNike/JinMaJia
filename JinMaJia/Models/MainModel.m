//
//  MainModel.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/13.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        _title = dict[@"title"];
        _pdate = dict[@"pdate"];
        _src = dict[@"src"];
        _url = dict[@"url"];
    }
    return self;
}
@end
