//
//  OrderModel.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *orderId;
@property(nonatomic,copy)NSString *openTime;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *position;
@property(nonatomic,copy)NSString *positionType;
@property(nonatomic,copy)NSString *goods;
@property(nonatomic,copy)NSString *openingPrice;
@property(nonatomic,copy)NSString *stopLossPrice;
@property(nonatomic,copy)NSString *checkSurplusValue;
@property(nonatomic,copy)NSString *closingTime;
@property(nonatomic,copy)NSString *closingPrice;
@property(nonatomic,copy)NSString *profitPoint;
@property(nonatomic,copy)NSString *remarks;
@property(nonatomic,copy)NSString *analyst;
@property(nonatomic,copy)NSString *publicTime;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *rid;
@property(nonatomic,copy)NSString *gid;

-(instancetype)initWithDict:(NSDictionary *)dict;


@end
