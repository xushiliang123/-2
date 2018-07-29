//
//  MY_LLInfomationViewController.h
//  VTIME
//
//  Created by Louie on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "EaseUI.h"

@interface MY_LLInfomationViewController : EaseConversationListViewController

@property (nonatomic,assign) NSInteger index;

@property (strong, nonatomic) UIViewController *controllerView;

@property (strong, nonatomic) NSMutableArray *conversationsArray;
    
- (void)refresh;
- (void)refreshDataSource;
    
- (void)isConnect:(BOOL)isConnect;
- (void)networkChanged:(EMConnectionState)connectionState;
    
@end
