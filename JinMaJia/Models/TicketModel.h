//
//  TicketModel.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicketModel : NSObject
@property(nonatomic,copy)NSString *symbol;
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *trade;
@property(nonatomic,copy)NSString *pricechange;
@property(nonatomic,copy)NSString *changepercent;
@property(nonatomic,copy)NSString *buy;
@property(nonatomic,copy)NSString *sell;
@property(nonatomic,copy)NSString *settlement;
@property(nonatomic,copy)NSString *open;
@property(nonatomic,copy)NSString *high;
@property(nonatomic,copy)NSString *low;
@property(nonatomic,copy)NSString *volume;
@property(nonatomic,copy)NSString *amount;
@property(nonatomic,copy)NSString *ticktime;
@property(nonatomic,copy)NSString *per;
@property(nonatomic,copy)NSString *pb;
@property(nonatomic,copy)NSString *mktcap;
@property(nonatomic,copy)NSString *nmc;
@property(nonatomic,copy)NSString *turnoverratio;


@end
