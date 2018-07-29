/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import <Foundation/Foundation.h>
#import "MY_LLInfomationViewController.h"
#import "TabBarController.h"

//  消息类型
//  系统
#define messageTypeSystem @"messageTypeSystem"
//  关注
#define messageTypeAttention @"messageTypeAttention"

#define kHaveUnreadAtMessage    @"kHaveAtMessage"
#define kAtYouMessage           1
#define kAtAllMessage           2

@interface ChatDemoHelper : NSObject <EMClientDelegate,EMChatManagerDelegate,EMContactManagerDelegate,EMGroupManagerDelegate,EMChatroomManagerDelegate,EaseMessageViewControllerDelegate,EaseMessageViewControllerDataSource>

//@property (nonatomic, weak) ContactListViewController *contactViewVC;
//
@property (nonatomic, weak) MY_LLInfomationViewController *conversationListVC;

@property (nonatomic, weak) TabBarController *mainVC;


+ (instancetype)shareHelper;

- (void)asyncPushOptions;

- (void)asyncGroupFromServer;

- (void)asyncConversationFromDB;

//  加关注，发送消息
- (void)addAttentionWithUserId:(NSInteger)userId nickName:(NSString *)nickName headIcon:(NSString *)headIcon;

@end
