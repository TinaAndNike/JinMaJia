//
//  MySearchBar.m
//  JinMaJia
//
//  Created by 周哥哥 on 16/5/26.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import "MySearchBar.h"

@implementation MySearchBar

- (void)layoutSubviews {
    if ([self respondsToSelector:@selector(barTintColor)]) {
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.1) {
            //ios7.1
            [[[[self.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
            [self setBackgroundColor:[UIColor clearColor]];
        }else{
            //ios7.0
            [self setBarTintColor:[UIColor clearColor]];
            [self setBackgroundColor:[UIColor clearColor]];
        }
    }else{
        //iOS7.0 以下
        [[self.subviews objectAtIndex:0] removeFromSuperview];
        [self setBackgroundColor:[UIColor clearColor]];
    }    [super layoutSubviews];
}
@end
