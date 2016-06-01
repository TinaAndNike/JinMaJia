//
//  TicketCell.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TicketCell.h"

@implementation TicketCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
        _name = [FactoryUI createLableWithFrame:CGRectMake(20, 10, 100, 20) text:nil font:[UIFont systemFontOfSize:15]];
        [self.contentView addSubview:_name];
        _symbol = [FactoryUI createLableWithFrame:CGRectMake(_name.frame.origin.x, CGRectGetMaxY(_name.frame), 100, 15) text:nil font:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:_symbol];
        
        _rightImage = [FactoryUI createImageViewWithFrame:CGRectMake(SCREENW - 100, 10, 90, 55 - 20) imageName:@"gupiao按钮"];
        [self.contentView addSubview:_rightImage];
        _amount = [FactoryUI createLableWithFrame:CGRectMake(SCREENW/2 - 50, 20, 100, 20) text:nil font:[UIFont systemFontOfSize:15]];
        [self.contentView addSubview:_amount];
        
        _sell = [FactoryUI createLableWithFrame:CGRectMake(37, 6, 50, 30) text:nil font:[UIFont systemFontOfSize:12]];
        [_rightImage addSubview:_sell];
        
    }
    return self;
}
-(void)setTicketModel:(TicketModel *)ticketModel
{
    _ticketModel = ticketModel;
    
    _name.text = ticketModel.name;
    
    _symbol.text = ticketModel.symbol;
    
    _amount.text =[NSString stringWithFormat:@"%@",ticketModel.amount];
    
    _sell.text = ticketModel.sell;
    
    
    
}

@end
