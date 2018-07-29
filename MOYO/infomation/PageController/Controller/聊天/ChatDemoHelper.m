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

#import "ChatDemoHelper.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "EaseSDKHelper.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYLoginViewController.h"

#ifdef REDPACKET_AVALABLE
#import "RedpacketOpenConst.h"
#import "RedPacketUserConfig.h"
#endif

#if DEMO_CALL == 1
#import "DemoCallManager.h"
#endif

static ChatDemoHelper *helper = nil;

@implementation ChatDemoHelper

+ (instancetype)shareHelper
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[ChatDemoHelper alloc] init];
    });
    return helper;
}

- (void)dealloc
{
    [[EMClient sharedClient] removeDelegate:self];
    [[EMClient sharedClient].groupManager removeDelegate:self];
    [[EMClient sharedClient].contactManager removeDelegate:self];
    [[EMClient sharedClient].roomManager removeDelegate:self];
    [[EMClient sharedClient].chatManager removeDelegate:self];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initHelper];
    }
    return self;
}

#pragma mark - setter

- (void)setMainVC:(TabBarController *)mainVC
{
    _mainVC = mainVC;
    
#if DEMO_CALL == 1
    [[DemoCallManager sharedManager] setMainController:mainVC];
#endif
}

#pragma mark - init

- (void)initHelper
{
#ifdef REDPACKET_AVALABLE
    [[RedPacketUserConfig sharedConfig] beginObserveMessage];
#endif
    
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].groupManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].roomManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    
#if DEMO_CALL == 1
    [DemoCallManager sharedManager];
#endif
}

- (void)asyncPushOptions
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = nil;
        [[EMClient sharedClient] getPushOptionsFromServerWithError:&error];
    });
}

- (void)asyncGroupFromServer
{
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[EMClient sharedClient].groupManager getJoinedGroups];
        EMError *error = nil;
//        [[EMClient sharedClient].groupManager getMyGroupsFromServerWithError:&error];
//        if (!error) {
//            if (weakself.contactViewVC) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [weakself.contactViewVC reloadGroupView];
//                });
//            }
//        }
    });
}

- (void)asyncConversationFromDB
{
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *array = [[EMClient sharedClient].chatManager getAllConversations];
        [array enumerateObjectsUsingBlock:^(EMConversation *conversation, NSUInteger idx, BOOL *stop){
            if(conversation.latestMessage == nil){
                [[EMClient sharedClient].chatManager deleteConversation:conversation.conversationId isDeleteMessages:NO completion:nil];
            }
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakself.conversationListVC) {
                [weakself.conversationListVC refreshDataSource];
            }
            
            if ([weakself.mainVC isKindOfClass:[TabBarController class]]) {
                [weakself.mainVC setupUnreadMessageCount];
            }
        });
    });
}

#pragma mark - EMClientDelegate

// 网络状态变化回调
- (void)didConnectionStateChanged:(EMConnectionState)connectionState
{
    if ([self.mainVC isKindOfClass:[TabBarController class]]) {
        [self.mainVC networkChanged:connectionState];
    }
}

- (void)autoLoginDidCompleteWithError:(EMError *)error
{
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"自动登录失败，请重新登录" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alertView.tag = 100;
        [alertView show];
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
    } else if([[EMClient sharedClient] isConnected]){
        UIView *view = self.mainVC.view;
//        [MBProgressHUD showHUDAddedTo:view animated:YES];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            BOOL flag = [[EMClient sharedClient] migrateDatabaseToLatestSDK];
            if (flag) {
                [self asyncGroupFromServer];
                [self asyncConversationFromDB];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                [MBProgressHUD hideAllHUDsForView:view animated:YES];
            });
        });
    }
}

#pragma mark - 自动登录认证key
- (void)automaticLogin{
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    //    [dict setObject:USERKEY forKey:@"key"];
    [dict setObject:@0 forKey:@"plateform"];
    NSString* strModel = [NSString stringWithFormat:@"%@/%@", [Utility getPhoneType],[Utility getphoneVersion]];//手机型号+系统版本
    [dict setObject:strModel forKey:@"model"];
    [dict setObject:[Utility getAppVersion] forKey:@"version"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [dict setObject:uuid forKey:@"deviceId"];
    [TLHTTPRequest MY_getWithBaseUrl:AutomaticLoginUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
//            [self loginOut];
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
//            if ([[data objectForKey:@"info"] objectForKey:@"key"]) {
//                UserRemObject(KEY);
//                NSString* strKey = [[data objectForKey:@"info"] objectForKey:@"key"];
//                UserSetObject(strKey, KEY);
//                [[NSUserDefaults standardUserDefaults] synchronize];
            
//            }
        } else {
            [self loginOut];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [self loginOut];
    }];
}
//  退出登录
- (void)loginOut {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    EMError *error = [[EMClient sharedClient] logout:YES];
    if (!error) {
        UserRemObject(Key);
        UserRemObject(UserId);
        REMHB;
        MY_LYLoginViewController * loginVC = [[MY_LYLoginViewController alloc] init];
        loginVC.isShowAlertView = YES;
        BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
        [window.rootViewController presentViewController:nav animated:NO completion:nil];
    }
}
- (void)connectionStateDidChange:(EMConnectionState)aConnectionState{
    if (aConnectionState == EMConnectionDisconnected) {

        UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:@"提示" message:@"连接失败，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * payAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
        }];
        
        [alertCtr addAction:payAction];
        
        [self.mainVC presentViewController:alertCtr animated:YES completion:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
    }
}
- (void)userAccountDidLoginFromOtherDevice
{
    [self _clearHelper];
    [self automaticLogin];
    
}

- (void)userAccountDidRemoveFromServer
{
    [self _clearHelper];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
}

- (void)userDidForbidByServer
{
    [self _clearHelper];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"servingIsBanned", @"Serving is banned") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
    [alertView show];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
}

- (void)didServersChanged
{
    [self _clearHelper];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
}

- (void)didAppkeyChanged
{
    [self _clearHelper];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
}

#pragma mark - EMChatManagerDelegate

- (void)didUpdateConversationList:(NSArray *)aConversationList
{
    if ([self.mainVC isKindOfClass:[TabBarController class]]) {
        [_mainVC setupUnreadMessageCount];
    }
    
    if (self.conversationListVC) {
        [_conversationListVC refreshDataSource];
    }
}

- (void)didReceiveMessages:(NSArray *)aMessages
{
    BOOL isRefreshCons = YES;
    for(EMMessage *message in aMessages){
        if (message.chatType == EMChatTypeChat && ![message.conversationId containsString:@"tingting"] && ![message.conversationId isEqualToString:@"kefu1"] && ![message.conversationId isEqualToString:@"vtimetask"]) {
            NSDictionary *ext = message.ext;
            NSNumber *nub =  ext[@"type"];
//            if (nub.integerValue != 1) {
            if (ext[@"taskerOwn"]) {
                NSNumber *taskN = ext[@"taskerOwn"];
                if (taskN.integerValue == 1) {
                    EMConversation *conv =  [[EMClient sharedClient].chatManager getConversation:message.conversationId type:EMConversationTypeChat createIfNotExist:YES];
                    EMMessage * messageNew = nil;
                    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"该用户为任务发起者"];
                    //                        NSString * from = message.from;
                    //                        NSString * to = message.to;
                    NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
                    [ext setObject:message.ext[@"noble"] forKey:@"noble"];
                    [ext setObject:@"9" forKey:@"type"];
                    messageNew = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                    messageNew.direction =EMMessageDirectionReceive;
                    messageNew.chatType = EMChatTypeChat;
                    messageNew.status = EMMessageStatusSucceed;//
                    
                    EMError * error = [[EMError alloc] init];//
                    [conv insertMessage:messageNew error:&error];
                }
            }
                [self insertFirstMessageWithMessage:message];
//            }
        }
        if (![message.from isEqualToString:USERID] && ![message.conversationId containsString:@"tingting"] && ![message.conversationId containsString:@"kefu1"] && ![message.conversationId containsString:@"vtimetask"]) {
            NSString * where = [NSString stringWithFormat:@"userId = %td",[message.from integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *uModel = arry.firstObject;
            BOOL ishasM = NO;
            if (!uModel) {
                uModel = [[MY_LYPersonInfoModel alloc]init];
            }else{
                ishasM = YES;
            }
            uModel.userId = [message.from integerValue];
            uModel.nickName = message.ext[@"nickname"];
            uModel.headIcon = message.ext[@"avatarURLPath"];
            uModel.isAuthen = [message.ext[@"addV"] integerValue];
            uModel.consumptionLevel = [message.ext[@"myVip"] integerValue];
            uModel.isNoble = [message.ext[@"noble"] integerValue];
            if (message.ext[@"isVideoVerify"]) {
                uModel.isVideoVerify = [message.ext[@"isVideoVerify"]  integerValue];
            }
            
            //                uModel.secretStatus = message.ext[@"secretStatus"];
            //                uModel.secretIcon =  message.ext[@"secretIcon"];
            uModel.region = message.ext[@"userLocation"];
            if ([message.ext[@"userLongitude"] isKindOfClass:[NSNumber class]]) {
                uModel.longitude = [message.ext[@"userLongitude"] stringValue];
            }else{
                uModel.longitude = message.ext[@"userLongitude"];
            }
            if ([message.ext[@"userLatitude"] isKindOfClass:[NSNumber class]]) {
                uModel.latitude = [message.ext[@"userLatitude"] stringValue];
            }else{
                uModel.latitude = message.ext[@"userLatitude"];
            }
            if (ishasM) {
                [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
            }else{
                [[MY_LLDBManager sharedManager] insertWithModel:uModel];
            }
//            NSLog(@"ChatDemoPage:longitude-- %@  latitude-- %@", uModel.longitude, uModel.latitude);
        }
       
        [self receiveSystemNotication:message]; //系统消息通知
        [self receiveZhaohuHB:message];  //招呼红包判断
        BOOL needShowNotification = (message.chatType != EMChatTypeChat) ? [self _needShowNotification:message.conversationId] : YES;
        if ([message.conversationId isEqualToString:WorldChannelID]) {
            NSString * typeStr = [NSString stringWithFormat:@"%@",message.ext[@"type"]];
            if ([typeStr isEqualToString:@"sendMultipleHongbao"]) {
                needShowNotification = YES;
            }
        }
#ifdef REDPACKET_AVALABLE
        /**
         *  屏蔽红包被抢消息的提示
         */
        NSDictionary *dict = message.ext;
        needShowNotification = (dict && [dict valueForKey:RedpacketKeyRedpacketTakenMessageSign]) ? NO : needShowNotification;
#endif

        UIApplicationState state = [[UIApplication sharedApplication] applicationState];
        if (needShowNotification) {
#if !TARGET_IPHONE_SIMULATOR
            switch (state) {
                case UIApplicationStateActive:
                    if ([self.mainVC isKindOfClass:[TabBarController class]]) {
                        [self.mainVC playSoundAndVibration];
                    }
                    break;
                case UIApplicationStateInactive:
                    if ([self.mainVC isKindOfClass:[TabBarController class]]) {
                        [self.mainVC playSoundAndVibration];
                    }
                    break;
                case UIApplicationStateBackground:
//                    NSLog(@"mainVC --%@",[self.mainVC class]);
                    if ([self.mainVC isKindOfClass:[TabBarController class]]) {
                        [self.mainVC showNotificationWithMessage:message];
                    }
                    break;
                default:
                    break;
            }
#endif
        }
        
//        if (_chatVC == nil) {
//            _chatVC = [self _getCurrentChatView];
//        }
//        BOOL isChatting = NO;
//        if (_chatVC) {
//            isChatting = [message.conversationId isEqualToString:_chatVC.conversation.conversationId];
//        }
//        if (_chatVC == nil || !isChatting || state == UIApplicationStateBackground) {
//            [self _handleReceivedAtMessage:message];

            if (self.conversationListVC) {
                [_conversationListVC refresh];  //tableViewDidTriggerHeaderRefresh
//                [_conversationListVC tableViewDidTriggerHeaderRefresh];
            }
//
//            if (self.mainVC) {
//                [_mainVC setupUnreadMessageCount];
//            }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setupUnreadMessageCount" object:nil];

//            return;
//        }
        
//        if (isChatting) {
//            isRefreshCons = NO;
//        }
    }
    
    if (isRefreshCons) {
        if (self.conversationListVC) {
            [_conversationListVC refresh];
        }
        
        if ([self.mainVC isKindOfClass:[TabBarController class]]) {
            [_mainVC setupUnreadMessageCount];
        }
    }
}
- (void)insertFirstMessageWithMessage:(EMMessage *)message {
    
    EMConversation *conv =  [[EMClient sharedClient].chatManager getConversation:message.conversationId type:EMConversationTypeChat createIfNotExist:YES];
    [conv loadMessagesStartFromId:message.messageId count:10 searchDirection:EMMessageSearchDirectionUp completion:^(NSArray *aMessages, EMError *aError) {
        if (!aError && [aMessages count] <= 1 ) {
            NSInteger noble = [message.ext[@"noble"] integerValue];
            if (noble > 0  && message.direction == EMMessageDirectionReceive) {
                EMMessage * messageNew = nil;
                EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"该用户为MOYO尊贵的贵族"];
                //                        NSString * from = message.from;
                //                        NSString * to = message.to;
                NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
                [ext setObject:message.ext[@"noble"] forKey:@"noble"];
                [ext setObject:@"9" forKey:@"type"];
                messageNew = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                messageNew.direction =EMMessageDirectionReceive;
                messageNew.chatType = EMChatTypeChat;
                messageNew.status = EMMessageStatusSucceed;//
                EMError * error = [[EMError alloc] init];//
                [conv insertMessage:messageNew error:&error];
            }
            
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *pM = arry.firstObject;
            if(pM.sex){     //我是男的，接收到女的消息
                NSInteger sex = [message.ext[@"sex"] integerValue];
                NSInteger isVideoVerify = [message.ext[@"isVideoVerify"] integerValue];
                if (!isVideoVerify && !sex) {
                    EMMessage * messageNew1 = nil;
                    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"该用户视频未认证，请谨慎发红包"];
                    //                        NSString * from = message.from;
                    //                        NSString * to = message.to;
                    NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
                    [ext setObject:@(pM.isNoble) forKey:@"noble"];
                    [ext setObject:@"9" forKey:@"type"];
                    messageNew1 = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                    messageNew1.direction =EMMessageDirectionReceive;
                    messageNew1.chatType = EMChatTypeChat;
                    messageNew1.status = EMMessageStatusSucceed;//
                    EMError * error = [[EMError alloc] init];//
                    [conv insertMessage:messageNew1 error:&error];
                    
                }
            }else{   //我是女的，接收到消息
//                NSInteger sex = pM.sex;
                NSInteger isVideoVerify = pM.isVideoVerify;
                if (!isVideoVerify) {
                    EMMessage * messageNew = nil;
                    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"您未视频认证，请尽快到个人中心进行视频认证"];
                    //                        NSString * from = message.from;
                    //                        NSString * to = message.to;
                    NSMutableDictionary *ext = [NSMutableDictionary dictionary];//
                     [ext setObject:@(pM.isNoble) forKey:@"noble"];
                    [ext setObject:@"9" forKey:@"type"];
                    messageNew = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                    messageNew.direction =EMMessageDirectionReceive;
                    messageNew.chatType = EMChatTypeChat;
                    messageNew.status = EMMessageStatusSucceed;//
                    EMError * error = [[EMError alloc] init];//
                    [conv insertMessage:messageNew error:&error];
                    if (error) {
                        NSLog(@"error:-- %@",error);
                    }
                }
            }
            
            
        }
        
    }];
     
}
- (void)receiveSystemNotication:(EMMessage *)message{   //收到系统消息
    NSDictionary *extDict = message.ext;
    if ([message.conversationId isEqualToString:@"tingting5"] && extDict) {
        if (extDict[@"vipLevel"]) {          //vip升级
            NSNumber *vipl = extDict[@"vipLevel"];
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *pM = arry.firstObject;
//            MY_LLPersonInfoModel *pM = [[MessageInfoModel sharedManager]loadPersonModelWithID:[USERID integerValue]];
            pM.consumptionLevel = vipl.intValue;
//            [[MessageInfoModel sharedManager] insertModelWith:pM];
            [[MY_LLDBManager sharedManager] updateModel:pM withWhere:where];

        }
        if (extDict[@"inIndex"]) {    //收到上首页审核通过的消息
            NSNumber *inindex = extDict[@"inIndex"];
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *pM = arry.firstObject;
            pM.inIndex = inindex;
            [[MY_LLDBManager sharedManager] updateModel:pM withWhere:where];
            
        }
        if (extDict[@"isVideoVerify"]) {    //视频认证
            NSNumber *isVideoVerifyNu = extDict[@"isVideoVerify"];
            if (isVideoVerifyNu.integerValue == 1) {
                NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                MY_LYPersonInfoModel *pM = arry.firstObject;
                pM.isVideoVerify = isVideoVerifyNu.integerValue;
                [[MY_LLDBManager sharedManager] updateModel:pM withWhere:where];
            }
        }
        if (extDict[@"noble"]) {    //贵族通知
            NSNumber *isNoble = extDict[@"noble"];
            if (isNoble.integerValue == 1) {
                NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                MY_LYPersonInfoModel *pM = arry.firstObject;
                pM.isNoble = isNoble.integerValue;
                [[MY_LLDBManager sharedManager] updateModel:pM withWhere:where];
            }
        }
        
    }
}
//招呼红包判断
- (void)receiveZhaohuHB:(EMMessage *)message{
    
    NSString *typeStr = nil;
    if ([message.ext[@"type"] isKindOfClass:[NSNumber class]]) {
        typeStr = [message.ext[@"type"] stringValue];
	}else{
        typeStr = message.ext[@"type"];
	}
    
    if([typeStr isEqualToString:@"sendHongbao"] || [typeStr isEqualToString:@"outTimeAskHongbao"]){
        NSString * where = [NSString stringWithFormat:@"userId = %td",[message.from integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *userModel = arry.firstObject;
        
//        MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:message.from.integerValue];
        if (!userModel) {
            userModel = [[MY_LYPersonInfoModel alloc]init];
            userModel.userId = [message.from integerValue];
            userModel.nickName = message.ext[@"nickname"];
            userModel.headIcon = message.ext[@"avatarURLPath"];
            userModel.longitude = [NSString stringWithFormat:@"%@", message.ext[@"userLongitude"]];
            userModel.latitude = [NSString stringWithFormat:@"%@",message.ext[@"userLatitude"]];
            userModel.consumptionLevel = [message.ext[@"myVip"] integerValue];
        }
        if ([typeStr isEqualToString:@"sendHongbao"] ) {
            userModel.isCanChat = 1;
        }else{
            userModel.isCanChat = 2;
        }
//        [[MessageInfoModel sharedManager] insertModelWith:userModel];
        [[MY_LLDBManager sharedManager] updateModel:userModel withWhere:where];
    }

  
}
 //收到上首页审核通过的消息
//- (void)receiveInindex:(EMMessage *)message{
//    NSDictionary *extDict = message.ext;
//    if ([message.conversationId isEqualToString:@"tingting5"] && extDict) {
//
//    }
//}
#pragma mark - EMGroupManagerDelegate

- (void)didReceiveLeavedGroup:(EMGroup *)aGroup
                       reason:(EMGroupLeaveReason)aReason
{
    NSString *str = @"从群组中离开";
    if (aReason == EMGroupLeaveReasonBeRemoved) {
        str = [NSString stringWithFormat:@"You are kicked out from group: %@ [%@]", aGroup.subject, aGroup.groupId];
    } else if (aReason == EMGroupLeaveReasonDestroyed) {
        str = [NSString stringWithFormat:@"Group: %@ [%@] is destroyed", aGroup.subject, aGroup.groupId];
    }
    
//    if (str.length > 0) {
//        MY_TTAlertNoTitle(str);
//    }
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:_mainVC.navigationController.viewControllers];
//    ChatViewController *chatViewContrller = nil;
//    for (id viewController in viewControllers)
//    {
//        if ([viewController isKindOfClass:[ChatViewController class]] && [aGroup.groupId isEqualToString:[(ChatViewController *)viewController conversation].conversationId])
//        {
//            chatViewContrller = viewController;
//            break;
//        }
//    }
//    if (chatViewContrller)
//    {
//        [viewControllers removeObject:chatViewContrller];
//        if ([viewControllers count] > 0) {
//            [_mainVC.navigationController setViewControllers:@[viewControllers[0]] animated:YES];
//        } else {
//            [_mainVC.navigationController setViewControllers:viewControllers animated:YES];
//        }
//    }
}


- (void)didReceiveJoinGroupApplication:(EMGroup *)aGroup
                             applicant:(NSString *)aApplicant
                                reason:(NSString *)aReason
{
    if (!aGroup || !aApplicant) {
        return;
    }
    
    if (!aReason || aReason.length == 0) {
        aReason = [NSString stringWithFormat:NSLocalizedString(@"group.applyJoin", @"%@ apply to join groups\'%@\'"), aApplicant, aGroup.subject];
    }
    else{
        aReason = [NSString stringWithFormat:NSLocalizedString(@"group.applyJoinWithName", @"%@ apply to join groups\'%@\'：%@"), aApplicant, aGroup.subject, aReason];
    }
    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"title":aGroup.subject, @"groupId":aGroup.groupId, @"username":aApplicant, @"groupname":aGroup.subject, @"applyMessage":aReason, @"applyStyle":[NSNumber numberWithInteger:ApplyStyleJoinGroup]}];
//    [[ApplyViewController shareController] addNewApply:dic];
    if (self.mainVC) {
        [self.mainVC setupUntreatedApplyCount];
#if !TARGET_IPHONE_SIMULATOR
        [self.mainVC playSoundAndVibration];
#endif
    }
    
//    if (self.contactViewVC) {
//        [self.contactViewVC reloadApplyView];
//    }
}

- (void)didJoinedGroup:(EMGroup *)aGroup
               inviter:(NSString *)aInviter
               message:(NSString *)aMessage
{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:[NSString stringWithFormat:@"%@ 邀请你加入群组: %@ ", aInviter, aGroup.subject] delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];//, aGroup.groupId
//    [alertView show];
}

- (void)groupInvitationDidDecline:(EMGroup *)aGroup
                          invitee:(NSString *)aInvitee
                           reason:(NSString *)aReason
{
//    NSString *message = [NSString stringWithFormat:@"%@ 拒绝群组\"%@\"的入群邀请", aInvitee, aGroup.subject];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//    [alertView show];
}

- (void)groupInvitationDidAccept:(EMGroup *)aGroup
                         invitee:(NSString *)aInvitee
{
//    NSString *message = [NSString stringWithFormat:@"%@ 已同意群组\"%@\"的入群邀请", aInvitee, aGroup.subject];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//    [alertView show];
}

- (void)didReceiveDeclinedJoinGroup:(NSString *)aGroupId
                             reason:(NSString *)aReason
{
//    if (!aReason || aReason.length == 0) {
//        aReason = [NSString stringWithFormat:NSLocalizedString(@"group.beRefusedToJoin", @"be refused to join the group\'%@\'"), aGroupId];
//    }
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:aReason delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//    [alertView show];
}

- (void)joinGroupRequestDidApprove:(EMGroup *)aGroup
{
//    NSString *message = [NSString stringWithFormat:NSLocalizedString(@"group.agreedAndJoined", @"agreed to join the group of \'%@\'"), aGroup.subject];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//    [alertView show];
}

- (void)didReceiveGroupInvitation:(NSString *)aGroupId
                          inviter:(NSString *)aInviter
                          message:(NSString *)aMessage
{
    if (!aGroupId || !aInviter) {
        return;
    }
    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"title":@"", @"groupId":aGroupId, @"username":aInviter, @"groupname":@"", @"applyMessage":aMessage, @"applyStyle":[NSNumber numberWithInteger:ApplyStyleGroupInvitation]}];
//    [[ApplyViewController shareController] addNewApply:dic];
    if (self.mainVC) {
        [self.mainVC setupUntreatedApplyCount];
#if !TARGET_IPHONE_SIMULATOR
        [self.mainVC playSoundAndVibration];
#endif
    }
    
//    if (self.contactViewVC) {
//        [self.contactViewVC reloadApplyView];
//    }
}

- (void)groupMuteListDidUpdate:(EMGroup *)aGroup
             addedMutedMembers:(NSArray *)aMutedMembers
                    muteExpire:(NSInteger)aMuteExpire
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateGroupDetail" object:aGroup];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"群组更新" message:@"禁言群成员" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)groupMuteListDidUpdate:(EMGroup *)aGroup
           removedMutedMembers:(NSArray *)aMutedMembers
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateGroupDetail" object:aGroup];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"群组更新" message:@"解除禁言" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)groupAdminListDidUpdate:(EMGroup *)aGroup
                     addedAdmin:(NSString *)aAdmin
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateGroupDetail" object:aGroup];
    
    NSString *msg = [NSString stringWithFormat:@"%@ 变为管理员", aAdmin];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"管理员更新" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)groupAdminListDidUpdate:(EMGroup *)aGroup
                   removedAdmin:(NSString *)aAdmin
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateGroupDetail" object:aGroup];
    
    NSString *msg = [NSString stringWithFormat:@"%@ 被移出管理员", aAdmin];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"管理员更新" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)groupOwnerDidUpdate:(EMGroup *)aGroup
                   newOwner:(NSString *)aNewOwner
                   oldOwner:(NSString *)aOldOwner
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateGroupDetail" object:aGroup];
    
    NSString *msg = [NSString stringWithFormat:@"群主由 %@ 变为 %@", aOldOwner, aNewOwner];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"群主更新" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - EMContactManagerDelegate

- (void)didReceiveAgreedFromUsername:(NSString *)aUsername
{
    NSString *msgstr = [NSString stringWithFormat:@"%@同意了加好友申请", aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername
{
    NSString *msgstr = [NSString stringWithFormat:@"%@拒绝了加好友申请", aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveDeletedFromUsername:(NSString *)aUsername
{
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:_mainVC.navigationController.viewControllers];
//    ChatViewController *chatViewContrller = nil;
//    for (id viewController in viewControllers)
//    {
//        if ([viewController isKindOfClass:[ChatViewController class]] && [aUsername isEqualToString:[(ChatViewController *)viewController conversation].conversationId])
//        {
//            chatViewContrller = viewController;
//            break;
//        }
//    }
//    if (chatViewContrller)
//    {
//        [viewControllers removeObject:chatViewContrller];
//        if ([viewControllers count] > 0) {
//            [_mainVC.navigationController setViewControllers:@[viewControllers[0]] animated:YES];
//        } else {
//            [_mainVC.navigationController setViewControllers:viewControllers animated:YES];
//        }
//    }
    [_mainVC showHint:[NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"delete", @"delete"), aUsername]];
//    [_contactViewVC reloadDataSource];
}

- (void)didReceiveAddedFromUsername:(NSString *)aUsername
{
//    [_contactViewVC reloadDataSource];
}

- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername
                                       message:(NSString *)aMessage
{
    if (!aUsername) {
        return;
    }
    
    if (!aMessage) {
        aMessage = [NSString stringWithFormat:NSLocalizedString(@"friend.somebodyAddWithName", @"%@ add you as a friend"), aUsername];
    }
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"title":aUsername, @"username":aUsername, @"applyMessage":aMessage, @"applyStyle":[NSNumber numberWithInteger:ApplyStyleFriend]}];
//    [[ApplyViewController shareController] addNewApply:dic];
    if (self.mainVC) {
        [self.mainVC setupUntreatedApplyCount];
#if !TARGET_IPHONE_SIMULATOR
        [self.mainVC playSoundAndVibration];
        
        BOOL isAppActivity = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
        if (!isAppActivity) {
            //发送本地推送
            if (NSClassFromString(@"UNUserNotificationCenter")) {
                UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.01 repeats:NO];
                UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
                content.sound = [UNNotificationSound defaultSound];
                content.body =[NSString stringWithFormat:NSLocalizedString(@"friend.somebodyAddWithName", @"%@ add you as a friend"), aUsername];
                UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:[[NSNumber numberWithDouble:[NSDate timeIntervalSinceReferenceDate] * 1000] stringValue] content:content trigger:trigger];
                [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
            }
            else {
                UILocalNotification *notification = [[UILocalNotification alloc] init];
                notification.fireDate = [NSDate date]; //触发通知的时间
                notification.alertBody = [NSString stringWithFormat:NSLocalizedString(@"friend.somebodyAddWithName", @"%@ add you as a friend"), aUsername];
                notification.alertAction = NSLocalizedString(@"open", @"Open");
                notification.timeZone = [NSTimeZone defaultTimeZone];
            }
        }
#endif
    }
//    [_contactViewVC reloadApplyView];
}

#pragma mark - EMChatroomManagerDelegate

- (void)didReceiveUserJoinedChatroom:(EMChatroom *)aChatroom
                            username:(NSString *)aUsername
{
    
}

- (void)didReceiveUserLeavedChatroom:(EMChatroom *)aChatroom
                            username:(NSString *)aUsername
{
    
}

- (void)didReceiveKickedFromChatroom:(EMChatroom *)aChatroom
                              reason:(EMChatroomBeKickedReason)aReason
{
    NSString *roomId = nil;
    if (aReason == EMChatroomBeKickedReasonDestroyed) {
        roomId = aChatroom.chatroomId;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ExitChat" object:roomId];
}

- (void)chatroomMuteListDidUpdate:(EMChatroom *)aChatroom
                addedMutedMembers:(NSArray *)aMutes
                       muteExpire:(NSInteger)aMuteExpire
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateChatroomDetail" object:aChatroom];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"聊天室更新" message:@"禁言成员" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}


- (void)chatroomMuteListDidUpdate:(EMChatroom *)aChatroom
              removedMutedMembers:(NSArray *)aMutes
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateChatroomDetail" object:aChatroom];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"聊天室更新" message:@"解除禁言" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)chatroomAdminListDidUpdate:(EMChatroom *)aChatroom
                        addedAdmin:(NSString *)aAdmin
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateChatroomDetail" object:aChatroom];
    
    NSString *msg = [NSString stringWithFormat:@"%@ 变为管理员", aAdmin];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"管理员更新" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)chatroomAdminListDidUpdate:(EMChatroom *)aChatroom
                      removedAdmin:(NSString *)aAdmin
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateChatroomDetail" object:aChatroom];
    
    NSString *msg = [NSString stringWithFormat:@"%@ 被移出管理员", aAdmin];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"管理员更新" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)chatroomOwnerDidUpdate:(EMChatroom *)aChatroom
                      newOwner:(NSString *)aNewOwner
                      oldOwner:(NSString *)aOldOwner
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateChatroomDetail" object:aChatroom];
    
    NSString *msg = [NSString stringWithFormat:@"聊天室创建者由 %@ 变为 %@", aOldOwner, aNewOwner];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"聊天室创建者更新" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - public

#pragma mark - private
- (BOOL)_needShowNotification:(NSString *)fromChatter
{
    
    BOOL ret = YES;
    
    NSArray *igGroupIds = [[EMClient sharedClient].groupManager getGroupsWithoutPushNotification:nil];
    for (NSString *str in igGroupIds) {
        if ([str isEqualToString:fromChatter]) {
            ret = NO;
            break;
        }
    }
    return ret;
}

//- (ChatViewController*)_getCurrentChatView
//{
//    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:_mainVC.navigationController.viewControllers];
//    ChatViewController *chatViewContrller = nil;
//    for (id viewController in viewControllers)
//    {
//        if ([viewController isKindOfClass:[ChatViewController class]])
//        {
//            chatViewContrller = viewController;
//            break;
//        }
//    }
//    return chatViewContrller;
//}

- (void)_clearHelper
{
    self.mainVC = nil;
    self.conversationListVC = nil;
//    self.chatVC = nil;
//    self.contactViewVC = nil;
    
    [[EMClient sharedClient] logout:NO];
}

- (void)_handleReceivedAtMessage:(EMMessage*)aMessage
{
    if (aMessage.chatType != EMChatTypeGroupChat || aMessage.direction != EMMessageDirectionReceive) {
        return;
    }
    
    NSString *loginUser = [EMClient sharedClient].currentUsername;
    NSDictionary *ext = aMessage.ext;
    EMConversation *conversation = [[EMClient sharedClient].chatManager getConversation:aMessage.conversationId type:EMConversationTypeGroupChat createIfNotExist:NO];
    if (loginUser && conversation && ext && [ext objectForKey:kGroupMessageAtList]) {
        id target = [ext objectForKey:kGroupMessageAtList];
        if ([target isKindOfClass:[NSString class]] && [(NSString*)target compare:kGroupMessageAtAll options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSNumber *atAll = conversation.ext[kHaveUnreadAtMessage];
            if ([atAll intValue] != kAtAllMessage) {
                NSMutableDictionary *conversationExt = conversation.ext ? [conversation.ext mutableCopy] : [NSMutableDictionary dictionary];
                [conversationExt removeObjectForKey:kHaveUnreadAtMessage];
                [conversationExt setObject:@kAtAllMessage forKey:kHaveUnreadAtMessage];
                conversation.ext = conversationExt;
            }
        }
        else if ([target isKindOfClass:[NSArray class]]) {
            if ([target containsObject:loginUser]) {
                if (conversation.ext[kHaveUnreadAtMessage] == nil) {
                    NSMutableDictionary *conversationExt = conversation.ext ? [conversation.ext mutableCopy] : [NSMutableDictionary dictionary];
                    [conversationExt setObject:@kAtYouMessage forKey:kHaveUnreadAtMessage];
                    conversation.ext = conversationExt;
                }
            }
        }
    }
}



//  加关注，给被关注的人发送消息
- (void)addAttentionWithUserId:(NSInteger)userId nickName:(NSString *)nickName headIcon:(NSString *)headIcon{
   /*
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"addAttentionNotification" object:@(userId)];
    
    MessageInfoModel * messageModel = [MessageInfoModel sharedManager];
    [messageModel addDictionaryWithValue:headIcon key:[NSString stringWithFormat:@"avatarURLPath%ld", (long)userId]];
    [messageModel addDictionaryWithValue:nickName key:[NSString stringWithFormat:@"nickname%ld", (long)userId]];
    
    NSString * userIdStr = [NSString stringWithFormat:@"%ld", (long)userId];
    
    NSString * messageStr = [NSString stringWithFormat:@"%@关注了您，相互关注后即可成为好友", UserObject(@"nickName")];
    
    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:messageStr];
    NSString * from = [[EMClient sharedClient] currentUsername];
    
    NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithObject:messageTypeAttention forKey:@"messageType"];
    
    NSString * nickname = UserObject(@"nickName");
    NSString * avatarURLPath = UserObject(@"headIcon");
    
    if (nickname) {
        [ext setObject:nickname forKey:@"nickname"];
    }
    if (avatarURLPath) {
        [ext setObject:avatarURLPath forKey:@"avatarURLPath"];
    }
    
    //  生成message
    EMMessage * message = [[EMMessage alloc] initWithConversationID:userIdStr from:from to:userIdStr body:body ext:ext];
    message.chatType = EMChatTypeChat;  //  设置为单聊消息
    message.status = EMMessageStatusSuccessed;
    
    [[EMClient sharedClient].chatManager sendMessage:message progress:^(int progress) {
   
    } completion:^(EMMessage *aMessage, EMError *aError) {

        if (!aError) {
            EMConversation * conversation = [[EMClient sharedClient].chatManager getConversation:aMessage.conversationId type:EMConversationTypeChat createIfNotExist:NO];
            
            [conversation deleteMessageWithId:aMessage.messageId error:nil];
        }
    }];
    */
}


@end
