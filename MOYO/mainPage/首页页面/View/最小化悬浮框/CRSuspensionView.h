//
//  CRSuspensionView.h
//  TogetherLu
//
//  Created by Louie on 2017/7/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "RCDraggableButton.h"
#import "MY_GLClubModel.h"

extern NSString *const CRShowSuspensionView;        // 显示悬浮框
extern NSString *const CRRemoveSuspensionView;      // 声网登录
extern NSString *const CRLeaveChannelSucceed;       // 退出登录成功


@interface CRSuspensionView : RCDraggableButton
@property (nonatomic, copy) void(^GotoWordChannelBlock)(void);


@property (nonatomic, strong) MY_GLClubModel * model;

@property (nonatomic, strong) UILabel * CRUnReadCount;     //  未读消息详情

//  移除最小化视图
- (void)removeAllFromView;

//  判断是否存在最小化
+ (BOOL)isSuspensionView;

@end
