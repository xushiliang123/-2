//
//  ChatViewController.h
//  TogetherLu
//
//  Created by Louie on 17/3/22.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "EaseUI.h"

@interface ChatViewController : EaseMessageViewController

//@property (nonatomic, copy) NSString * userId;
//@property (nonatomic, strong) NSString * nickName;

//  必传 userId  nickName  headIcon



@property (nonatomic, assign) BOOL isPayPush;
@property (nonatomic, assign) BOOL isTaskPagePush;   // 从任务跳过来的
@property (nonatomic, strong) NSString *pushfrom;

//@property (nonatomic, assign) BOOL isTaskChat;
@end
