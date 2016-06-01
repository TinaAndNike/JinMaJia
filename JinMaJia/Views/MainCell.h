//
//  MainCell.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/13.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"
@interface MainCell : UITableViewCell
@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *pdata;
@property(nonatomic,strong)UILabel *src;
//@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)MainModel *model;


@end
