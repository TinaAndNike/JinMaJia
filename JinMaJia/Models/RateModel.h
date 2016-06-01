//
//  RateModel.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RateModel : NSObject
@property(nonatomic,copy)NSString *currency;
@property(nonatomic,copy)NSString *cen_price;
@property(nonatomic,copy)NSString *buy_price1;
@property(nonatomic,copy)NSString *buy_price2;
@property(nonatomic,copy)NSString *sell_price;

@end
