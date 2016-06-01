//
//  OrderCell.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/26.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

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
        //背景图表
        _backImage = [FactoryUI createImageViewWithFrame:CGRectMake(20, 0, SCREENW-40, SCREENW/3) imageName:@"喊单表"];
        [self.contentView addSubview:_backImage];
        
        //单号
        _orderId = [FactoryUI createLableWithFrame:CGRectMake(0, 0, _backImage.frame.size.width, _backImage.frame.size.height/7+4) text:nil font:[UIFont systemFontOfSize:12]];
        _orderId.textColor = [UIColor redColor];
        [_backImage addSubview:_orderId];
        
        //开仓时间
        _openTime = [FactoryUI createLableWithFrame:CGRectMake(0, CGRectGetMaxY(_orderId.frame), _backImage.frame.size.width/2, (_backImage.frame.size.height-_orderId.frame.size.height)/6) text:nil font:[UIFont systemFontOfSize:11]];
//        _openTime.textAlignment = NSTextAlignmentCenter;
//        _openTime.backgroundColor = [UIColor redColor];
        _openTime.textColor = [UIColor darkGrayColor];
        [_backImage addSubview:_openTime];
        
        //平仓时间
        _closingTime =[FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_openTime.frame), _openTime.frame.origin.y, _openTime.frame.size.width, _openTime.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
        _closingTime.textColor = [UIColor darkGrayColor];
//        _closingTime.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_closingTime];
        
        //类型
        _type = [FactoryUI createLableWithFrame:CGRectMake(0, CGRectGetMaxY(_openTime.frame), _openTime.frame.size.width, _openTime.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
//        _type.textAlignment = NSTextAlignmentCenter;

        _type.textColor = [UIColor darkGrayColor];
        [_backImage addSubview:_type];
        
        //仓位
        _position = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_type.frame), _type.frame.origin.y, _type.frame.size.width, _type.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
        _position.textColor = [UIColor darkGrayColor];
//        _position.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_position];
        
        
        //商品
        _goods = [FactoryUI createLableWithFrame:CGRectMake(0, CGRectGetMaxY(_type.frame), _type.frame.size.width, _type.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
        _goods.textColor = [UIColor darkGrayColor];
//        _goods.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_goods];
        
        //获利点数
        _profitPoint = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_goods.frame), _goods.frame.origin.y, _goods.frame.size.width, _goods.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
        _profitPoint.textColor = [UIColor darkGrayColor];
//        _profitPoint.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_profitPoint];
        
        
        //开仓价
        _openingPrice = [FactoryUI createLableWithFrame:CGRectMake(0, CGRectGetMaxY(_goods.frame), _goods.frame.size.width, _goods.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
//        _openingPrice.textAlignment = NSTextAlignmentCenter;

        _openingPrice.textColor = [UIColor darkGrayColor];
        [_backImage addSubview:_openingPrice];
        
        
        //平仓价
        _closingPrice = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_openingPrice.frame), _openingPrice.frame.origin.y, _openingPrice.frame.size.width, _openingPrice.frame.size.height) text:nil font:[UIFont systemFontOfSize:13]];
        _closingPrice.textColor = [UIColor darkGrayColor];
//        _closingPrice.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_closingPrice];
        
        //止损价
        _stopLossPrice = [FactoryUI createLableWithFrame:CGRectMake(0, CGRectGetMaxY(_openingPrice.frame), _openingPrice.frame.size.width, _openingPrice.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
        _stopLossPrice.textColor = [UIColor darkGrayColor];
//        _stopLossPrice.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_stopLossPrice];
        
        //止盈价
        _checkSurplusValue = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_stopLossPrice.frame), _stopLossPrice.frame.origin.y, _stopLossPrice.frame.size.width, _stopLossPrice.frame.size.height) text:nil font:[UIFont systemFontOfSize:13]];
        _checkSurplusValue.textColor = [UIColor darkGrayColor];
//        _checkSurplusValue.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_checkSurplusValue];
        
        //备注
        _remarks = [FactoryUI createLableWithFrame:CGRectMake(_checkSurplusValue.frame.origin.x, CGRectGetMaxY(_checkSurplusValue.frame), _checkSurplusValue.frame.size.width, _checkSurplusValue.frame.size.height) text:nil font:[UIFont systemFontOfSize:11]];
        _remarks.textColor = [UIColor darkGrayColor];
//        _remarks.textAlignment = NSTextAlignmentCenter;

        [_backImage addSubview:_remarks];
                       
        
    }
    return self;
}
-(void)setOrderModel:(OrderModel *)orderModel
{
    _orderModel = orderModel;
    _orderId.text = [NSString stringWithFormat:@"单号:%@",orderModel.orderId];
    
    NSDate *openTime = [NSDate dateWithTimeIntervalSince1970:(int)orderModel.openTime];
    _openTime.text = [NSString stringWithFormat:@"开仓时间    %@",openTime];
    
    NSDate *closeTime = [NSDate dateWithTimeIntervalSince1970:(int)orderModel.closingTime];
    _closingTime.text = [NSString stringWithFormat:@"平仓时间    %@",closeTime];
    
    _type.text = [NSString stringWithFormat:@"类型                     %@",orderModel.type];
    _position.text = [NSString stringWithFormat:@"仓位                        %@",orderModel.position];
    _goods.text = [NSString stringWithFormat:@"商品                  %@",orderModel.goods];
    _profitPoint.text = [NSString stringWithFormat:@"获利点数             %@",orderModel.profitPoint];
    _openingPrice.text = [NSString stringWithFormat:@"开仓价                %@",orderModel.openingPrice];
    _closingPrice.text = [NSString stringWithFormat:@"平仓价                  %@",orderModel.closingPrice];
    _stopLossPrice.text = [NSString stringWithFormat:@"止损价                  %@",orderModel.stopLossPrice];
    _checkSurplusValue.text = [NSString stringWithFormat:@"止盈价                  %@",orderModel.checkSurplusValue];

    _remarks.text = [NSString stringWithFormat:@"备注                   %@",orderModel.remarks];



    
    
}

@end
