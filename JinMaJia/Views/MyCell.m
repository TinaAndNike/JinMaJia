//
//  MyCell.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/17.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

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
        
        _logoImage = [FactoryUI createImageViewWithFrame:CGRectMake(0, 0, SCREENW, SCREENH/14) imageName:nil];
        [self.contentView addSubview:_logoImage];
    }
    return self;
}
@end
