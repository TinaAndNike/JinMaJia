//
//  MainModel.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/13.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *img_width;
@property(nonatomic,copy)NSString *full_title;
@property(nonatomic,copy)NSString *pdate;
@property(nonatomic,copy)NSString *src;
@property(nonatomic,copy)NSString *img_length;

@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *pdate_src;

-(instancetype)initWithDict:(NSDictionary *)dict;






@end
