//
//  VodDownLoader.h
//  VodSdk
//
//  Created by gs_mac_fjb on 14-10-31.
//  Copyright (c) 2014年 gensee. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "VodItem.h"
//#import "downItem.h"
@class downItem,VodItem;
#include "vodHead.h"

@protocol VodDownLoadDelegate;

/**
 *  VodDownLoader是管理点播件（录制件）下载的类
 */
@interface VodDownLoader : NSObject

/**
 *  VodDownLoadDelegate代理
 */
@property(nonatomic,weak)id<VodDownLoadDelegate>  delegate;

/**
 *   当前正在下载的点播件（录制件）的ID
 */
@property(nonatomic,strong)NSString *mCurrentDownloadId;


/**
 *  初始化VodDownLoader
 *
 *  @param delegate VodDownLoadDelegate代理
 *
 *  @return VodDownLoader实例
 */
- (id)initWithDelegate:(id<VodDownLoadDelegate>)delegate;

/**
 *  下载点播件（录制件）
 *
 *  @param vodItem 点播件（录制件）
 *  @param chatPost 聊天是否按时间顺序推送
 */
- (void)download:(downItem*)vodItem chatPost:(BOOL)chatPost;

/**
 *  下载点播件（录制件）
 *
 *  @param downloadID 要下载的点播件（录制件）的ID
 *   @param chatPost 聊天是否按时间顺序推送
 */
- (void)start:(NSString*)downloadID chatPost:(BOOL)chatPost;

/**
 *  删除点播件（录制件）
 *
 *  @param downloadID 要删除的点播件（录制件）的ID
 *
 *  @return 删除结果，YES表示成功
 */
- (BOOL)delete:(NSString*)downloadID;

/**
 *  停止下载，已下载的部分不会删除，可继续下载，也可以理解为暂停下载
 *
 *  @param downloadID 停止下载的点播件（录制件）的ID
 */
- (void)stop:(NSString*)downloadID;








/**
 *  添加到下载
 *
 *  @param domain        域名
 *  @param number        编号
 *  @param loginName     登录名
  *  @param nickName     昵称
 *  @param vodPassword   观看密码
 *  @param loginPassword 登录密码
 *  @param downFlag      1:需要下载  0:不需要下载  用于在线播放和下载播放
 *  @param serType       webcast或者training
    @param isBox         是否box YES:将不再判断服务器返回的ipad字段 NO:默认为NO,是会判断服务器返回的ipad字段
 */



- (void)addItem:(NSString *)domain
         number:(NSString*)number
      loginName:(NSString*)loginName
       nickName:(NSString*)nickName
    vodPassword:(NSString*)vodPassword
  loginPassword:(NSString*)loginPassword
       downFlag:(int)downFlag
        serType:(NSString*)serType
          isBox:(BOOL)isBox
     oldVersion:(BOOL) oldVersion
         kToken:(NSString*)token;



/**
 *  添加到下载
 *
 *  @param domain        域名
 *  @param number        编号
 *  @param loginName     登录名
 *  @param vodPassword   观看密码
 *  @param loginPassword 登录密码
 *  @param downFlag      1:需要下载  0:不需要下载  用于在线播放和下载播放
 *  @param serType       webcast或者training
 */
- (void)addItem:(NSString *)domain
         number:(NSString*)number
      loginName:(NSString*)loginName
    vodPassword:(NSString*)vodPassword
  loginPassword:(NSString*)loginPassword
       downFlag:(int)downFlag
        serType:(NSString*)serType
     oldVersion:(BOOL) oldVersion
         kToken:(NSString*)token;

/**
 *  添加到下载
 *
 *  @param domain        域名
 *  @param number        编号
 *  @param loginName     登录名
 *  @param vodPassword   观看密码
 *  @param loginPassword 登录密码
 *  @param vodid         点播件（录制件）ID
 *  @param downFlag      1:需要下载  0:不需要下载  用于在线播放和下载播放
 *  @param serType       webcast或者training
 */
- (void)addItem:(NSString *)domain
         number:(NSString*)number
      loginName:(NSString*)loginName
    vodPassword:(NSString*)vodPassword
  loginPassword:(NSString*)loginPassword
          vodid:(NSString*)vodid
       downFlag:(int)downFlag
        serType:(NSString*)serType
     oldVersion:(BOOL) oldVersion
         kToken:(NSString*)token;

/**
 *  把点播件（录制件）添加到本地数据库
 *
 *  @param item 点播件（录制件）
 */
- (void)addItemToDataBase:(downItem*)item;

/**
 *  获取点播件（录制件）的下载路径
 *
 *  @param downloadID 点播件（录制件）的ID
 *
 *  @return 下载路径
 */
- (NSString*)vodDownloadPath:(NSString*)downloadID;

@end

@protocol VodDownLoadDelegate <NSObject>

/**
 *  下载完成代理
 *
 *  @param downloadID 已经下载完成的点播件（录制件）的ID
 */
- (void) onDLFinish:(NSString*) downloadID;

/**
 *  下载进度代理
 *
 *  @param downloadID 正在下载的点播件（录制件）的ID
 *  @param percent    下载的进度
 */
- (void) onDLPosition:(NSString*) downloadID  percent:(float) percent;

/**
 *  下载开始代理
 *
 *  @param downloadID 开始下载的点播件（录制件）的ID
 */
- (void) onDLStart:(NSString*) downloadID;

/**
 *  下载停止代理
 *
 *  @param downloadID 停止下载的点播件（录制件）的ID
 */
- (void) onDLStop:(NSString*) downloadID;

/**
 *  下载出错代理
 *
 *  @param downloadID 下载出错的点播件（录制件）的ID
 *  @param errorCode  错误码
 */
- (void) onDLError:(NSString*) downloadID Status:(VodDownLoadStatus) errorCode; // 下载出错

/**
 *  添加到下载代理
 *
 *  @param resultType 添加到下载的结果
 *  @param item        添加到下载的点播件（录制件）
 */
- (void) onAddItemResult:(RESULT_TYPE)resultType voditem:(downItem*)item;

@end
