//
//  CustomHeader.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/25.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomHeader;
@class CustomGroup;
@protocol CustomHeaderDelegate <NSObject>

-(void)gruopHeaderViewDidCllickTitleButton:(CustomHeader *)groupHeaderView;


@end


@interface CustomHeader : UITableViewHeaderFooterView


//@property(nonatomic,copy)NSStrcing *content;
@property(nonatomic,strong)CustomGroup *content;

//@property(nonatomic,assign) BOOL visible;
+(instancetype)groupHeaderViewTableView:(UITableView *)tableView;

//增加一个代理属性
@property(nonatomic,weak)id<CustomHeaderDelegate>delegate;
@end
