//
//  RateCell.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/31.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "RateCell.h"

@implementation RateCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _backImage = [FactoryUI createImageViewWithFrame:CGRectMake(10, 0, SCREENW - 20, SCREENW/7) imageName:@"RateConten"];
        [self.contentView addSubview:_backImage];
        _currency = [FactoryUI createLableWithFrame:CGRectMake(0, 0, _backImage.frame.size.width/6, _backImage.frame.size.height) text:@"100" font:[UIFont systemFontOfSize:13]];
        _currency.textColor = [UIColor darkGrayColor];
        _currency.textAlignment = NSTextAlignmentCenter;
        [_backImage addSubview:_currency];
        
        _unit = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_currency.frame), 0, _currency.frame.size.width, _currency.frame.size.height) text:@"100" font:[UIFont systemFontOfSize:13]];
        _unit.textColor = [UIColor darkGrayColor];
        _unit.textAlignment = NSTextAlignmentCenter;
        [_backImage addSubview:_unit];
        
        _cen_price = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_unit.frame), 0, _currency.frame.size.width, _currency.frame.size.height) text:nil font:[UIFont systemFontOfSize:13]];
        _cen_price.textColor = [UIColor darkGrayColor];
        _cen_price.textAlignment = NSTextAlignmentCenter;
        [_backImage addSubview:_cen_price];
        
        _buy_price1 = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_cen_price.frame), 0, _currency.frame.size.width, _currency.frame.size.height) text:nil font:[UIFont systemFontOfSize:13]];
        _buy_price1.textColor = [UIColor darkGrayColor];
        _buy_price1.textAlignment = NSTextAlignmentCenter;
        [_backImage addSubview:_buy_price1];
        
        
        _buy_price2 = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_buy_price1.frame), 0, _currency.frame.size.width, _currency.frame.size.height) text:nil font:[UIFont systemFontOfSize:13]];
        _buy_price2.textColor = [UIColor darkGrayColor];
        _buy_price2.textAlignment = NSTextAlignmentCenter;
        [_backImage addSubview:_buy_price2];
        
        
        _sell_price = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_buy_price2.frame), 0, _currency.frame.size.width, _currency.frame.size.height) text:nil font:[UIFont systemFontOfSize:13]];
        _sell_price.textColor = [UIColor darkGrayColor];
        _sell_price.textAlignment = NSTextAlignmentCenter;
        [_backImage addSubview:_sell_price];

        
        
        
    }
    return self;
}
-(void)setModel:(RateModel *)model
{
    _model = model;
    _currency.text = model.currency;
    _cen_price.text = model.cen_price;
    _buy_price1.text = model.buy_price1;
    _buy_price2.text = model.buy_price2;
    _sell_price.text = model.sell_price;
    
}
@end
