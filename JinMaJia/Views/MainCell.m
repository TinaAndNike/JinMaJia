//
//  MainCell.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/13.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _image = [FactoryUI createImageViewWithFrame:CGRectMake(23, 0, 15, self.frame.size.height) imageName:@"滑动标24x64hpx02"];
        [self.contentView addSubview:_image];
        _pdata = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_image.frame)+10, 10, 100, 10) text:nil font:[UIFont systemFontOfSize:10]];
        _pdata.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_pdata];
        _src = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMaxX(_image.frame)+10, CGRectGetMaxY(_pdata.frame),SCREENW-50, 20) text:nil font:[UIFont systemFontOfSize:15]];
        _src.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_src];
//        _title = [FactoryUI createLableWithFrame:CGRectMake(CGRectGetMidX(_src.frame) + 15, CGRectGetMaxY(_pdata.frame), 350, 20) text:nil font:[UIFont systemFontOfSize:13]];
//        _title.textColor = [UIColor blackColor];
//        [self.contentView addSubview:_title];
        
    }
    
    return self;
}
-(void)setModel:(MainModel *)model
{
    _model = model;
    _pdata.text = model.pdate;
//    _src.text = [NSString stringWithFormat:@"%@:",model.src];
//    _title.text = model.title;
    _src.text = [NSString stringWithFormat:@"%@:%@",model.src,model.title];
    
}

@end
