//
//  NSString+CZNSStringExt.h
//  001QQDemo
//
//  Created by 周哥哥 on 16/4/26.
//  Copyright © 2016年 sunli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (CZNSStringExt)

//对象方法
-(CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

//类方法
+(CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont*)font;

//判断手机号码
- (NSString *)valiMobile:(NSString *)mobile;
@end


