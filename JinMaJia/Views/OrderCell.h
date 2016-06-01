//
//  OrderCell.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/26.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
@interface OrderCell : UITableViewCell

@property(nonatomic,strong)UIImageView *backImage;
@property(nonatomic,strong)UILabel *orderId;

@property(nonatomic,strong)UILabel *openTime;
@property(nonatomic,strong)UILabel *type;
@property(nonatomic,strong)UILabel *goods;
@property(nonatomic,strong)UILabel *openingPrice;
@property(nonatomic,strong)UILabel *stopLossPrice;
@property(nonatomic,strong)UILabel *closingTime;
@property(nonatomic,strong)UILabel *position;
@property(nonatomic,strong)UILabel *profitPoint;
@property(nonatomic,strong)UILabel *closingPrice;
@property(nonatomic,strong)UILabel *checkSurplusValue;
@property(nonatomic,strong)UILabel *remarks;


@property(nonatomic,strong)OrderModel *orderModel;



@end
