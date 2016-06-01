//
//  GSPVideoView.h
//  PlayerSDK
//
//  Created by Gaojin Hsu on 6/9/15.
//  Copyright (c) 2015 Geensee. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 直播中管理视频的视图
 */
@interface GSPVideoView : UIView

/**
 *  初始化GSPVideoView
 *
 *  @param frame 设置GSPVideoView的宽高，坐标等信息
 *
 *  @return GSPVideoView实例
 */
- (instancetype)initWithFrame:(CGRect)frame;






//@property(nonatomic,assign) BOOL isRun;






/**********************************************************************************************/
/**********************************************************************************************/
// 以下接口请勿调用

- (void)videoStart;
- (void)videoEnd;
- (void)renderVideo:(const unsigned char*)data width:(unsigned)width height:(unsigned)height size:(unsigned)size isAs:(BOOL)isAs;
-(void)renderAsVideoByImage:(UIImage*)imageFrame;
@end