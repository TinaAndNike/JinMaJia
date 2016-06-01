//
//  AgentModel.h
//  登录
//
//  Created by 周哥哥 on 16/5/5.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AgentModel : NSObject
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *agentName;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *gid;
@property(nonatomic,copy)NSString *flag;

-(instancetype)initWithDict:(NSDictionary *)dic;



@end
