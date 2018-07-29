//
//  TabBarController.h
//  
//
//  Created by huangdl on 15-5-4.
//  Copyright (c) 2015年 Lq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>


@interface TabBarController : UITabBarController
{
    EMConnectionState _connectionState;
}

+ (TabBarController *)shareInstance;

@property (nonatomic, assign) NSUInteger selectedTabBarIndex;

- (void)jumpToChatList;

- (void)setupUntreatedApplyCount;

- (void)setupUnreadMessageCount;

- (void)networkChanged:(EMConnectionState)connectionState;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)didReceiveUserNotification:(UNNotification *)notification;

- (void)playSoundAndVibration;

- (void)showNotificationWithMessage:(EMMessage *)message;

@end
