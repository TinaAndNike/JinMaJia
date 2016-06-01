//
//  TeacherCell.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/17.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "TeacherCell.h"
#import "TeacherModel.h"
#import "TeacherModelFrame.h"
@interface TeacherCell()

@property(nonatomic,weak)UIImageView *pic;
@property(nonatomic,weak)UIButton *Btncontent;
@property(nonatomic,weak)UILabel *analystName;

@end

@implementation TeacherCell

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
        
        UIImageView *pic = [[UIImageView alloc]initWithImage:[UIImage  imageNamed:@"TeacherImage"]];
        [self.contentView addSubview:pic];
        self.pic = pic;
        
        UIButton *btn = [[UIButton alloc]init];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
//        btn.backgroundColor = [UIColor redColor];
//        btn.titleLabel.backgroundColor = [UIColor blueColor];
        //设置按钮的内边距
        btn.contentEdgeInsets = UIEdgeInsetsMake(20, 1, 0, 10);
        
        [self.contentView addSubview:btn];
        self.Btncontent = btn;
        
        UILabel *anyname = [[UILabel alloc]init];
        anyname.font = [UIFont systemFontOfSize:13];
//        anyname.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:anyname];
        self.analystName = anyname;
        
        
        
    }
    return self;
}
-(void)setTeacherModelFrame:(TeacherModelFrame *)teacherModelFrame
{
    _teacherModelFrame = teacherModelFrame;
    TeacherModel *model = teacherModelFrame.Teachermodel;
    self.analystName.text = model.analystName;
    self.analystName.frame = teacherModelFrame.analystNameFrame;
    
    self.pic.frame = teacherModelFrame.picFrame;
    
    [self.Btncontent setTitle:model.content forState:UIControlStateNormal];
    self.Btncontent.frame = teacherModelFrame.contentFrame;
    
    NSString *image = @"Teacher内容框01";
    UIImage *imageBack = [UIImage imageNamed:image];
    imageBack = [imageBack stretchableImageWithLeftCapWidth:imageBack.size.width *0.5 topCapHeight:imageBack.size.height*0.5];
    [self.Btncontent setBackgroundImage:imageBack forState:UIControlStateNormal];
    [self.Btncontent setBackgroundImage:imageBack forState:UIControlStateHighlighted];

}

@end
