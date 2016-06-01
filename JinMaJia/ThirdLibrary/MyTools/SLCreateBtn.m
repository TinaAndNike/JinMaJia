//
//  SLCreateBtn.m
//  循环创建按钮的封装
//
//  Created by qianfeng on 16/1/21.
//  Copyright (c) 2016年 sunli. All rights reserved.
//

#import "SLCreateBtn.h"
#define SCR_W self.frame.size.width
#define SCR_H self.frame.size.height
#import "SLButton.h"
@interface SLCreateBtn()
{
    NSArray *_imageArray;
    NSArray *_arrayText;
}

@end

@implementation SLCreateBtn

-(instancetype)initWithNum:(NSArray *)array andText:(NSArray *)arrayText andframe:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        _imageArray = array;
        _arrayText = arrayText;
        [self createBtn];
    }
    return self;
}

-(void)createBtn
{
        
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = (SCR_W-3)/4;
    CGFloat viewH =viewW;
       for (int i = 0; i < _arrayText.count/4 ; i ++) {
        for (int j = 0; j< 4; j ++) {
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(viewX+(viewW+2) * j, viewY + (viewH+2) * i, viewW, viewH)];
            view.userInteractionEnabled = YES;
            SLButton *btn = [[SLButton alloc]initWithFrame:CGRectMake(10, 5, viewW-20, viewH-10)];
            view.backgroundColor= RGB(243, 243, 243, 1);
            [btn setImage:[UIImage imageNamed:_imageArray[j+i*4]] forState:UIControlStateNormal];
            
            [btn setTitle:_arrayText[i*4 + j] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:18];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:btn];
            
            [self addSubview:view];
            
        
        }
    }
    

}
@end





















