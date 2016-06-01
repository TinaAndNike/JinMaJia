//
//  SearchCell.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/27.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModel.h"
@interface SearchCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *date;
@property(nonatomic,strong)UILabel *buyOne;
@property(nonatomic,strong)UILabel *increase;
@property(nonatomic,strong)UIImageView *rightImage;

@property(nonatomic,strong)SearchModel *searchModel;

@end
