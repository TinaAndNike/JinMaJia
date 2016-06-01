//
//  GSPPlayerManager.h
//  PlayerSDK
//
//  Created by Gaojin Hsu on 6/9/15.
//  Copyright (c) 2015 Geensee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPJoinParam.h"
#import "GSPDocView.h"
#import "GSPVideoView.h"
#import "GSPChatView.h"
#import "GSPQaView.h"
#import "GSPInvestigationView.h"
#import "GSPUserInfo.h"
#import "GSPChatMessage.h"
#import "GSPInvestigation.h"


/**
 *  抽奖消息类型
 */
typedef NS_ENUM(NSInteger, GSLottryType){
    /**
     *  开始抽奖
     */
    GSLottryTypeStart = 0x01,
    /**
     *  抽奖完成
     */
    GSLottryTypeStop = 0x02,
    /**
     *  抽奖废弃
     */
    GSLottryTypeAbort = 0x03,
};

/**
 *  日志等级
 */
typedef NS_ENUM(NSInteger, GSLogLevel){
    /**
     *  不输出日志
     */
    GSLogLevelOff,
    /**
     *  只输出错误日志
     */
    GSLogLevelError,
    /**
     *  输出错误和警告
     */
    GSLogLevelWarning,
    /**
     *  输出所有级别日志
     */
    GSLogLevelALL,
};

/**
 *  邀请类型
 */
typedef NS_ENUM(NSInteger, GSPMediaInvitationType){
    /**
     *  打开音频的邀请
     */
    GSPMediaInvitationTypeAudioOnly = 0x01,
    
    /**
     *  打开视频的邀请
     */
    GSPMediaInvitationTypeVideoOnly = 0x02,
    
    /**
     *  打开音视频的邀请
     */
    GSPMediaInvitationTypeAVBoth = 0x03,
};

/**
 *  离开直播的原因
 */
typedef NS_ENUM(NSInteger, GSPLeaveReason) {
    /**
     *  自行退出直播
     */
    GSPLeaveReasonNormal =0x01,
    
    /**
     *  被踢出直播
     */
    GSPLeaveReasonEjected = 0x02,
    
    /**
     *  超时
     */
    GSPLeaveReasonTimeout = 0x03,
    
    /**
     *  直播关闭，直播结束
     */
    GSPLeaveReasonClosed = 0x04,
    
    /**
     * 未知错误
     */
    GSPLeaveReasonUnknown = 0x05,
    
    /**
     *  其他地方登陆
     */
    GSPLeaveReasonReLogin = 0x0e,
};


/**
 *  加入直播结果
 */
typedef NS_ENUM(NSInteger, GSPJoinResult){
    /**
     *  创建直播实例失败
     */
    GSPJoinResultCreateRtmpPlayerFailed = 0x01,
    
    /**
     *  调用加入直播失败
     */
    GSPJoinResultJoinReturnFailed = 0x02,
    
    /**
     *  网络错误
     */
    GSPJoinResultNetworkError = 0x03,
    
    /**
     *  未知错误
     */
    GSPJoinResultUnknowError = 0x04,
    
    /**
     *  参数错误
     */
    GSPJoinResultParamsError = 0x05,
    
    /**
     *  加入成功
     */
    GSPJoinResultOK = 0x06,
    
    /**
     *  正在连接直播服务
     */
    GSPJoinResultConnnecting = 0x07,
    
    /**
     *  连接失败
     */
    GSPJoinResultCONNECT_FAILED = 0x08,
    
    /**
     *  连接超时
     */
    GSPJoinResultTimeout = 0x09,
    
    /**
     *  链接媒体服务器失败
     */
    GSPJoinResultRTMP_FAILED = 0x0a,
    
    /**
     *  直播尚未开始
     */
    GSPJoinResultTOO_EARLY = 0x0b,
    
    /**
     *  人数已满
     */
    GSPJoinResultLICENSE = 0x0c,
    
    
    /**
     *  第三者验证错误
     */
    GSPJoinResultThirdTokenError,
};


@class GSPPlayerManager;

/**
 *  直播中的事件回调，在调用了某些方法，会产生一些事件回调，如有用户加入或退出直播，收到音频数据，正在重连等
 */
@protocol GSPPlayerManagerDelegate <NSObject>

@optional

/**
 *  在调用了－joinWithParam: 后会调用此代理，返回加入直播的结果
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param joinResult 加入结果
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveSelfJoinResult:(GSPJoinResult)joinResult;

/**
 *  获取直播主题
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param subject       直播主题
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveSubjectInfo:(NSString*)subject;

/**
 *  在直播中突然意外断开连接后，会调用此代理，表示将要重连
 *
 *  @param playerManager 调用该代理的直播管理实例
 */
- (void)playerManagerWillReconnect:(GSPPlayerManager *)playerManager;

/**
 *  在直播中开始缓冲，会调用此代理，表示将要缓冲
 *
 *  @param playerManager 调用该代理的直播管理实例
 */
- (void)playerManagerWillBuffer:(GSPPlayerManager *)playerManager;

/**
 *  自己离开了直播，会调用此代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param reason        离开直播的原因
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didSelfLeaveFor:(GSPLeaveReason)reason;

/**
 *  有用户加入了直播，会调用此代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param userInfo      加入的用户的用户信息
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didUserJoin:(GSPUserInfo *)userInfo;

/**
 *  有用户离开了直播，会调用此代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param userInfo      离开的用户的用户信息
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didUserLeave:(GSPUserInfo *)userInfo;

/**
 *  有用户状态发生了改变，会调用此代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param userInfo      更改后的用户的用户信息
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didUserStatusChange:(GSPUserInfo *)userInfo;

/**
 *  收到音频数据流，会回调此代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param data          音频流数据
 *  @param length        数据长度
 *  @param level         音量大小
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveAudioData:(const unsigned char*)data length:(unsigned)length level:(unsigned)level;

/**
 *  视频开始事件代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 */
- (void)playerManagerDidVideoBegin:(GSPPlayerManager*)playerManager;

/**
 *  视频结束事件代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 */
- (void)playerManagerDidVideoEnd:(GSPPlayerManager*)playerManager;

/**
 *  文档关闭事件代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 */
- (void)playerManagerDidDocumentClose:(GSPPlayerManager*)playerManager;


/**
 *  文档切换事件代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 */
- (void)playerManagerDidDocumentSwitch:(GSPPlayerManager*)playerManager;

/**
 *  直播聊天权限改变代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param bEnable       整个直播是否支持聊天
 */
- (void)playerManager:(GSPPlayerManager*)playerManager didSetChatEnable:(BOOL)bEnable;

/**
 *  直播问答权限改变代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param bEnable       整个直播是否支持问答
 */
- (void)playerManager:(GSPPlayerManager*)playerManager didSetQaEnable:(BOOL)bEnable;


/**
 *  自己是否被禁言
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param bMute         是否被禁言，YES表示被禁言
 */
- (void)playerManager:(GSPPlayerManager*)playerManager isSelfMute:(BOOL)bMute;

/**
 *  直播是否暂停
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param isPaused      YES表示直播已暂停，NO表示直播进行中
 */
- (void)playerManager:(GSPPlayerManager*)playerManager isPaused:(BOOL)isPaused;

/**
 *  收到聊天信息代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param message       收到的聊天信息
 */
- (void)playerManager:(GSPPlayerManager*)playerManager didReceiveChatMessage:(GSPChatMessage*)message;

/**
 *  收到问答信息代理
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param qaDatas       收到的问答信息数组，数组成员为GSPQaData实例
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveQaData:(NSArray *)qaDatas;

/**
 *  收到问卷调查代理
 *
 *  @param playerManager  调用该代理的直播管理实例
 *  @param investigations 收到的问卷调查数组，数组成员为GSPInvestigation实例
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveInvestigation:(NSArray*)investigations;


/**
 *  收到广播消息
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param msg           广播消息
 *  @param senderID      发送者userID
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveBroadcastMessage:(NSString*)msg senderID:(long long)senderID;


/**
 *  在线人数
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param num           在线总人数
 */
- (void)playerManager:(GSPPlayerManager*)playerManager onlineNum:(NSUInteger)num;


/**
 *  收到音视频邀请
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param type          邀请类型
 *  @param on            打开或关闭
 */
- (void)playerManager:(GSPPlayerManager *)playerManager  didReceiveMediaInvitation:(GSPMediaInvitationType)type action:(BOOL)on;


/**
 *  收到文字直播消息
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param liveText      文字直播内容
 *  @param language      文字直播语言类型
 */
- (void)playerManager:(GSPPlayerManager*)playerManager didReceiveLiveText:(NSString*)liveText language:(NSString*)language;

/**
 *  收到点名
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param seconds       点名倒计时
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveRollCall:(NSUInteger)seconds;


/**
 *  受到
 *
 *  @param playerManager 调用该代理的直播管理实例
 *  @param names         中奖名单
 *  @param type          抽奖消息类型
 */
- (void)playerManager:(GSPPlayerManager *)playerManager didReceiveLottryInfo:(NSString*)names type:(GSLottryType)type;

@end


@class GSPInvestigationView;
@class GSPQaView;
@class GSPChatView;
@class GSPChatInputToolView;

/**
 *  直播管理类，封装了几乎全部的直播处理方法
 */
@interface GSPPlayerManager : NSObject

/**
 *  加入直播
 *
 *  @param joinParam 能锁定直播的直播信息
 */
- (void)joinWithParam:(GSPJoinParam*)joinParam;

/**
 *  离开直播
 *
 *  @return 直播离开结果，YES表示离开成功
 */
- (BOOL)leave;

/**
 *  是否接收音频数据
 *
 *  @param enabled 是否接收音频数据，YES表示接收，必须在成功加入直播后调用，否则没有效果
 *
 *  @return 操作是否成功，YES表示成功
 */
- (BOOL)enableAudio:(BOOL)enabled;

/**
 *  是否接收视频数据
 *
 *  @param enabled 是否接收视频数据，YES表示接收，必须在成功加入直播后调用，否则没有效果
 *
 *  @return 操作是否成功，YES表示成功
 */
- (BOOL)enableVideo:(BOOL)enabled;

/**
 * 需要在applicationDidBecomeActive方法中调用此方法，防止切换到其他需要音频的APP再切回来时没有声音。
 */
- (void)resetAudioHelper;

/**
 *  播放音频流数据
 *
 *  @param data   音频数据
 *  @param length 音频长度
 *
 */
- (void)playAudio:(const unsigned char *)data length:(unsigned int)length;

/**
 *  如果App需要实现后台播放的功能，需要调用此方法，然后去设置Capabilities中的相应选项
 */
- (void)enableBackgroundMode;


/**
 *  日志开关
 *
 *  @param level 日志等级
 */
- (void)setLogLevel:(GSLogLevel)level;


/**
 *  发送文本聊天信息给所有人（公聊）
 *
 *  @param message 聊天消息
 *
 *  @return 操作是否成功，YES表示成功
 */
- (BOOL)chatWithAll:(GSPChatMessage*)message;

/**
 *  发送文本聊天信息给特定的人（私聊）
 *
 *  @param userID  接收消息用户的userID
 *  @param message 聊天消息
 *
 *  @return 操作是否成功
 */
- (BOOL)chatWithUser:(unsigned)userID message:(GSPChatMessage*)message;

/**
 *  发送问题
 *
 *  @param quesID  问题ID
 *  @param content 问题内容
 *
 *  @return 操作是否成功
 */
- (BOOL)askQuestion:(NSString*)quesID content:(NSString*)content;

/**
 *  提交问卷调查
 *
 *  @param inves 问卷调查对象
 *
 *  @return 操作是否成功
 */
- (BOOL)submitInvestigation:(GSPInvestigation*)inves;

/**
 *  将日志保存到日志文件中
 */
- (void)redirectLogToFile;

/**
 *  打开／关闭 麦克风
 *
 *  @param active YES表示打开，NO表示关闭
 */
- (void)activateMicrophone:(BOOL)active;


/**
 *  接收音视频打开或关闭的命令
 *
 *  @param type 邀请的类型
 *  @param on   打开或者关闭
 */
- (void)acceptMediaInvitation:(BOOL)accept type:(GSPMediaInvitationType)type;


/**
 *  举手
 *
 *  @param isUp YES表示举手，NO表示不举手
 *
 *  @return 操作是否成功
 */
- (BOOL)handup:(BOOL)isUp;


/**
 *  回复点名
 *
 *  @param reply 回应点名
 */
- (BOOL)replyRollCall:(BOOL)reply;


/**
 *  直播代理
 */
@property (nonatomic, weak) id <GSPPlayerManagerDelegate> delegate;

/**
 *  直播文档视图
 */
@property (nonatomic, weak) GSPDocView *docView;

/**
 *  直播聊天视图
 */
@property (nonatomic, weak) GSPChatView *chatView;

/**
 *  直播问答视图
 */
@property (nonatomic, weak) GSPQaView *qaView;

/**
 *  直播视频视图
 */
@property (nonatomic, weak) GSPVideoView *videoView;

/**
 *  直播问卷调查视图
 */
@property (nonatomic, weak) GSPInvestigationView *investigationView;

/**
 *  直播中自己的用户信息
 */
@property (nonatomic, strong) GSPUserInfo *selfUserInfo;


@property (nonatomic, assign) int audioQueueLength;


@end
