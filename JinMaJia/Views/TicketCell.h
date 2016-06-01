//
//  TicketCell.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketModel.h"
@interface TicketCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *symbol;
@property(nonatomic,strong)UILabel *amount;
@property(nonatomic,strong)UILabel *sell;
@property(nonatomic,strong)UIImageView *rightImage;

@property(nonatomic,strong)TicketModel *ticketModel;
@end
