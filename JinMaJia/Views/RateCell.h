//
//  RateCell.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateModel.h"
@interface RateCell : UITableViewCell
@property(nonatomic,strong)UILabel *currency;
@property(nonatomic,strong)UILabel *unit;
@property(nonatomic,strong)UILabel *cen_price;
@property(nonatomic,strong)UILabel *buy_price1;
@property(nonatomic,strong)UILabel *buy_price2;
@property(nonatomic,strong)UILabel *sell_price;
@property(nonatomic,strong)UIImageView *backImage;


@property(nonatomic,strong)RateModel *model;
@end
