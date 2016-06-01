//
//  TeacherModel.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/17.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeacherModel : NSObject
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *analystName;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,copy)NSString *rid;
@property(nonatomic,copy)NSString *gid;
-(instancetype)initWithDict:(NSDictionary *)dict;


@end
