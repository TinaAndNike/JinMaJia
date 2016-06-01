//
//  CustomGroup.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/25.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "CustomGroup.h"

@implementation CustomGroup
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if ( self = [super init]) {
        _content = dict[@"content"];
    }
    return self;
}
@end
