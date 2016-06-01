//
//  OrderModel.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        _Id = dict[@"id"];
        _orderId = dict[@"orderId"];
        _openTime = dict[@"openTime"];
        _type = dict[@"type"];
        _position = dict[@"position"];
        _positionType = dict[@"positionType"];
        _goods = dict[@"goods"];
        _openingPrice = dict[@"openingPrice"];
        _stopLossPrice = dict[@"stopLossPrice"];
        _checkSurplusValue = dict[@"checkSurplusValue"];
        _closingTime = dict[@"closingTime"];
        _closingPrice = dict[@"closingPrice"];
        _profitPoint = dict[@"profitPoint"];
        _remarks = dict[@"remarks"];
        _analyst = dict[@"analyst"];
        _publicTime = dict[@"publicTime"];
        _status = dict[@"status"];
        _rid = dict[@"rid"];
        _gid = dict[@"gid"];
    }
    return self;
}
@end
