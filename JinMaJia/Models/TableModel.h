//
//  TableModel.h
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModel : NSObject
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *startTime;
@property(nonatomic,copy)NSString *endTime;
@property(nonatomic,copy)NSString *monday;
@property(nonatomic,copy)NSString *tuesday;
@property(nonatomic,copy)NSString *wednesday;
@property(nonatomic,copy)NSString *thursday;
@property(nonatomic,copy)NSString *friday;
@property(nonatomic,copy)NSString *gid;


-(instancetype)initWithDict:(NSDictionary *)dict;
@end
