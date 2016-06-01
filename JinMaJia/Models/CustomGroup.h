//
//  CustomGroup.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/25.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomGroup : NSObject
@property(nonatomic,copy)NSString *content;
@property(nonatomic,assign,getter=isVisible) BOOL visible;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
