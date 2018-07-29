//
//  AppDelegate.h
//  VTIME
//
//  Created by MadridLee on 2017/9/5.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, EMChatManagerDelegate>
{
    EMConnectionState _connectionState;
}

@property (strong, nonatomic) TabBarController *mainController;


@property (strong, nonatomic) UIWindow *window;


@end

