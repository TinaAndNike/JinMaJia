//
//  GuidePageView.h
//  JMJ
//
//  Created by 周哥哥 on 16/4/18.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface GuidePageView : UIView

@property(nonatomic,strong)UIButton *goInButton;
-(id)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;
@end
