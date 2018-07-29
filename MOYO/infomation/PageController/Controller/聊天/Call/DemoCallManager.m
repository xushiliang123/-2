//
//  DemoCallManager.m
//  ChatDemo-UI3.0
//
//  Created by XieYajie on 22/11/2016.
//  Copyright © 2016 XieYajie. All rights reserved.
//

#import "DemoCallManager.h"

#if DEMO_CALL == 1

#import "EaseSDKHelper.h"
//#import "EMVideoRecorderPlugin.h"

#import "TabBarController.h"
#import "EMCallViewController.h"
#import "MY_LYMessageInfoModel.h"
//#import "MY_LLPersonInfoModel.h"
//#import "MessageInfoModel.h"
static DemoCallManager *callManager = nil;

@interface DemoCallManager()<EMChatManagerDelegate, EMCallManagerDelegate, EMCallBuilderDelegate>

@property (strong, nonatomic) NSObject *callLock;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) EMCallSession *currentSession;

@property (strong, nonatomic) EMCallViewController *currentController;

@property (nonatomic, strong) NSString * duration;
@property (nonatomic, strong) MY_LYPersonInfoModel * personalModel;
@end

#endif

@implementation DemoCallManager

#if DEMO_CALL == 1

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _initManager];
        
//  实时通话结束
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(insertCallMessage:) name:@"insertMessage" object:nil];
    }
    
    return self;
}

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        callManager = [[DemoCallManager alloc] init];
    });
    
    return callManager;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[EMClient sharedClient].chatManager removeDelegate:self];
    [[EMClient sharedClient].callManager removeDelegate:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KNOTIFICATION_CALL object:nil];
}

#pragma mark - private

- (void)_initManager
{
    _callLock = [[NSObject alloc] init];
    _currentSession = nil;
    _currentController = nil;
    
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].callManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].callManager setBuilderDelegate:self];
    
//    EMCallOptions *callOptions = [[EMClient sharedClient].callManager getCallOptions];
//    callOptions.isSendPushIfOffline = YES;
//    [[EMClient sharedClient].callManager setCallOptions:callOptions];
    
//    [EMVideoRecorderPlugin initGlobalConfig];
    
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"calloptions.data"];
    EMCallOptions *options = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:file]) {
        options = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    } else {
        options = [[EMClient sharedClient].callManager getCallOptions];
        options.isSendPushIfOffline = YES;
        options.offlineMessageText = @"您有收到一条语音消息";
        options.videoResolution = EMCallVideoResolution1280_720;
        options.isFixedVideoResolution = YES;
    }
    [[EMClient sharedClient].callManager setCallOptions:options];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makeCall:) name:KNOTIFICATION_CALL object:nil];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    self.personalModel = arry.firstObject;
//   self.personalModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
}

- (void)_clearCurrentCallViewAndData
{
    @synchronized (_callLock) {
        self.currentSession = nil;
        
        self.currentController.isDismissing = YES;
        [self.currentController clearData];
        [self.currentController dismissViewControllerAnimated:NO completion:nil];
        self.currentController = nil;
    }
}

#pragma mark - private timer

- (void)_timeoutBeforeCallAnswered
{
    [self hangupCallWithReason:EMCallEndReasonNoResponse];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"超时自动挂断", @"No response and Hang up") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)_startCallTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:50 target:self selector:@selector(_timeoutBeforeCallAnswered) userInfo:nil repeats:NO];
}

- (void)_stopCallTimer
{
    if (self.timer == nil) {
        return;
    }
    
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - EMChatManagerDelegate

- (void)cmdMessagesDidReceive:(NSArray *)aCmdMessages
{
    for (EMMessage *message in aCmdMessages) {
        EMCmdMessageBody *cmdBody = (EMCmdMessageBody *)message.body;
        NSString *action = cmdBody.action;
        if ([action isEqualToString:@"inviteToJoinConference"]) {
            //            NSString *callId = [message.ext objectForKey:@"callId"];
        } else if ([action isEqualToString:@"__Call_ReqP2P_ConferencePattern"]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"已转为会议模式" delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}

#pragma mark - EMCallManagerDelegate

- (void)callDidReceive:(EMCallSession *)aSession
{
    if (!aSession || [aSession.callId length] == 0) {
        return ;
    }
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    
//    NSLog(@"%@", keyWindow.rootViewController);
    
    if ([EaseSDKHelper shareHelper].isShowingimagePicker) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideImagePicker" object:nil];
    }
    
    if(self.currentSession && self.currentSession.status != EMCallSessionStatusDisconnected){
        [[EMClient sharedClient].callManager endCall:aSession.callId reason:EMCallEndReasonBusy];
        return;
    }
    
    @synchronized (_callLock) {
        [self _startCallTimer];
        
        self.currentSession = aSession;
        self.currentController = [[EMCallViewController alloc] initWithCallSession:self.currentSession];
        self.currentController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIApplicationState state = [[UIApplication sharedApplication] applicationState];
                if (state == UIApplicationStateBackground) {
                    NSString *text;
                    if (aSession.type == EMCallTypeVoice) {
                        text = @"您收到一个语音通话";
                    }else{
                        text = @"您收到一个视频通话";
                    }
//                    NSString *text = [NSString stringWithFormat:@"%@:%@",self.personalModel.nickName,messageStr];
//                    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:text];
//                    NSString *fromStr = [EMClient sharedClient].currentUsername;
                    NSMutableDictionary * ext = [NSMutableDictionary dictionary];

                    [ext setObject:text forKey:@"message"];
                    [ext setObject:self.personalModel.nickName forKey:@"nickname"];
                    [ext setObject:self.personalModel.headIcon forKey:@"avatarURLPath"];
//                    EMMessage *message = [EaseSDKHelper sendTextMessage:text
//                                                                     to:aSession.remoteName
//                                                            messageType:EMChatTypeChat
//                                                             messageExt:ext];
//                    [[EMClient sharedClient].chatManager sendMessage:message progress:nil completion:nil];
                    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.01 repeats:NO];
                    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
//                    if (playSound) {
                        content.sound = [UNNotificationSound defaultSound];
//                    }
                    //[[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:imgStr textFont: [UIFont systemFontOfSize:14]];
                    content.body = text;
                    content.userInfo = ext;
                    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:aSession.remoteName content:content trigger:trigger];
                    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
                    
                }
            if (self.currentController) {
                [self.mainController presentViewController:self.currentController animated:NO completion:nil];
            }
        });
    }
}





- (void)callDidConnect:(EMCallSession *)aSession
{
    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
        [self.currentController stateToConnected];
    }
}

- (void)callDidAccept:(EMCallSession *)aSession
{
    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
        [self _stopCallTimer];
        [self.currentController stateToAnswered];
    }
}

- (void)callDidEnd:(EMCallSession *)aSession
            reason:(EMCallEndReason)aReason
             error:(EMError *)aError
{

//    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
//    
//    [dict setValue:@(aReason) forKey:@"reason"];
//    [dict setValue:@(aSession.isCaller) forKey:@"isCaller"];
//    [dict setValue:@(aSession.type) forKey:@"callType"];
//    [dict setValue:self.duration forKey:@"duration"];
    
//    [self _insertMessageStr:dict];
    
    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
        
        [self _stopCallTimer];
        
        @synchronized (_callLock) {
            self.currentSession = nil;
            [self _clearCurrentCallViewAndData];
        }
        
        if (aReason != EMCallEndReasonHangup) {
            NSString *reasonStr = @"end";
            switch (aReason) {
                case EMCallEndReasonNoResponse:
                {
                    reasonStr = NSLocalizedString(@"对方没有响应", @"NO response");
                }
                    break;
                case EMCallEndReasonDecline:
                {
                    reasonStr = NSLocalizedString(@"对方拒接", @"Reject the call");
                }
                    break;
                case EMCallEndReasonBusy:
                {
                    reasonStr = NSLocalizedString(@"对方占线", @"In the call...");
                }
                    break;
                case EMCallEndReasonFailed:
                {
                    reasonStr = NSLocalizedString(@"失败", @"Connect failed");
                }
                    break;
                case EMCallEndReasonUnsupported:
                {
                    reasonStr = NSLocalizedString(@"功能不支持", @"Unsupported");
                }
                    break;
                case EMCallEndReasonRemoteOffline:
                {
                    reasonStr = NSLocalizedString(@"对方不在线", @"Remote offline");
                }
                    break;
                default:
                    break;
            }
            
            if (aError) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:aError.errorDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
                [alertView show];
            }
            else{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:reasonStr delegate:nil cancelButtonTitle:NSLocalizedString(@"确认", @"OK") otherButtonTitles:nil, nil];
                [alertView show];
            }
        }
    }

}


////  通话结束发送通知
//- (void)_insertMessageStr:(NSDictionary *)dict{
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"insertMessage" object:nil userInfo:dict];
//
//}


- (void)didReceiveCallNetworkChanged:(EMCallSession *)aSession status:(EMCallNetworkStatus)aStatus
{
    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
//        [self.callController setNetwork:aStatus];
    }
}

#pragma mark - EMCallBuilderDelegate

- (void)callRemoteOffline:(NSString *)aRemoteName
{
    NSString *text = [[EMClient sharedClient].callManager getCallOptions].offlineMessageText;
    NSString * where = [NSString stringWithFormat:@"userId = %td",[aRemoteName integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *personModel = arry.firstObject;
//    MY_LLPersonInfoModel *personModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:aRemoteName.intValue];
    text = [NSString stringWithFormat:@"%@:%@",personModel.nickName,text];
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:text];
    NSString *fromStr = [EMClient sharedClient].currentUsername;
    EMMessage *message = [[EMMessage alloc] initWithConversationID:aRemoteName from:fromStr to:aRemoteName body:body ext:@{@"em_apns_ext":@{@"em_push_title":text}}];
    message.chatType = EMChatTypeChat;
    
    [[EMClient sharedClient].chatManager sendMessage:message progress:nil completion:nil];
}

#pragma mark - NSNotification

- (void)makeCall:(NSNotification*)notify
{
    if (notify.object) {
        EMCallType type = (EMCallType)[[notify.object objectForKey:@"type"] integerValue];
        NSDictionary *extDic = [notify.object objectForKey:@"ext"];
        [self makeCallWithUsername:[notify.object valueForKey:@"chatter"] type:type ext:extDic];
    }
}

#pragma mark - public

- (void)saveCallOptions
{
    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"calloptions.data"];
    EMCallOptions *options = [[EMClient sharedClient].callManager getCallOptions];
    [NSKeyedArchiver archiveRootObject:options toFile:file];
}

- (void)makeCallWithUsername:(NSString *)aUsername
                        type:(EMCallType)aType ext:(NSDictionary*)extDic
{
    if ([aUsername length] == 0) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    void (^completionBlock)(EMCallSession *, EMError *) = ^(EMCallSession *aCallSession, EMError *aError){
        DemoCallManager *strongSelf = weakSelf;
        if (strongSelf) {
            if (aError || aCallSession == nil) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"call.initFailed", @"Establish call failure") message:aError.errorDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
                [alertView show];
                return;
            }
            
            @synchronized (self.callLock) {
                strongSelf.currentSession = aCallSession;
                strongSelf.currentController = [[EMCallViewController alloc] initWithCallSession:strongSelf.currentSession];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (strongSelf.currentController) {
                        [strongSelf.mainController presentViewController:self.currentController animated:NO completion:nil];
                    }
                });
            }
            
            [self _startCallTimer];
        }
        else {
            [[EMClient sharedClient].callManager endCall:aCallSession.callId reason:EMCallEndReasonNoResponse];
        }
    };
    NSString *extStr = [Utility dictionaryToJson:extDic];
    [[EMClient sharedClient].callManager startCall:aType remoteName:aUsername ext:extStr completion:^(EMCallSession *aCallSession, EMError *aError) {
        completionBlock(aCallSession, aError);
    }];
}

- (void)answerCall:(NSString *)aCallId
{
    if (!self.currentSession || ![self.currentSession.callId isEqualToString:aCallId]) {
        return ;
    }
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = [[EMClient sharedClient].callManager answerIncomingCall:weakSelf.currentSession.callId];
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error.code == EMErrorNetworkUnavailable) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"network.disconnection", @"Network disconnection") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
                    [alertView show];
                }
                else{
                    [weakSelf hangupCallWithReason:EMCallEndReasonFailed];
                }
            });
        }
    });
}

- (void)hangupCallWithReason:(EMCallEndReason)aReason
{
    [self _stopCallTimer];
    
    if (self.currentSession) {
        [[EMClient sharedClient].callManager endCall:self.currentSession.callId reason:aReason];
    }
    [self _clearCurrentCallViewAndData];
}


//  通话结束发送消息
- (void)insertCallMessage:(NSNotification *)not{
    if (_delegate && [_delegate respondsToSelector:@selector(callDidEndSenderMessageWithDictionary:)]) {
        [_delegate callDidEndSenderMessageWithDictionary:not.userInfo];
    }
}


#endif

@end
