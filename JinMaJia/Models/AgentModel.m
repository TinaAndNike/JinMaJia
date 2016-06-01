//
//  AgentModel.m
//  登录
//
//  Created by 周哥哥 on 16/5/5.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "AgentModel.h"

@implementation AgentModel
-(instancetype)initWithDict:(NSDictionary *)dic
{
    if (self = [super init]) {
        _Id = dic[@"id"];
        _agentName = dic[@"agentName"];
        _pic = dic[@"pic"];
        _createTime = dic[@"createTime"];
        _gid = dic[@"gid"];
        _flag = dic[@"flag"];
    }
    return self;
    
}
@end
