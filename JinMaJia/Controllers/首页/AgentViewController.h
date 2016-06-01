//
//  AgentViewController.h
//  登录
//
//  Created by 周哥哥 on 16/5/5.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgentModel.h"
@protocol AgentViewControllerDelegate<NSObject>
-(void)deliverAgentModel:(AgentModel *)agentModel;

@end


@interface AgentViewController : UIViewController
@property(nonatomic,weak)id <AgentViewControllerDelegate>delegate;

@end
