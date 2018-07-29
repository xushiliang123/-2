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

#import "EaseMessageViewController.h"
#import "PhotoLibModel.h"
#import "DYBasePopView.h"

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

#import "NSDate+Category.h"
#import "EaseUsersListViewController.h"
#import "EaseMessageReadManager.h"
#import "EaseEmotionManager.h"
#import "EaseEmoji.h"
#import "EaseEmotionEscape.h"
#import "EaseCustomMessageCell.h"
#import "UIImage+GIF.h"
#import "EaseLocalDefine.h"
#import "EaseSDKHelper.h"

#import "MY_LYPersonInfoModel.h"
#import "MY_LLDBManager.h"
#import "MY_LYMessageInfoModel.h"
#import  "TZImagePickerController.h"
#import "VPImageCropperViewController.h"
#import "TZImageManager.h"
#define KHintAdjustY    50

#define IOS_VERSION [[UIDevice currentDevice] systemVersion]>=9.0

@implementation EaseAtTarget
- (instancetype)initWithUserId:(NSString*)userId andNickname:(NSString*)nickname
{
    if (self = [super init]) {
        _userId = [userId copy];
        _nickname = [nickname copy];
    }
    return self;
}
@end

@interface EaseMessageViewController ()<EaseMessageCellDelegate,VPImageCropperDelegate,TZImagePickerControllerDelegate>
{
    UIMenuItem *_copyMenuItem;
    UIMenuItem *_deleteMenuItem;
    UILongPressGestureRecognizer *_lpgr;
    NSMutableArray *_atTargets;
    NSString * _name;
    
    dispatch_queue_t _messageQueue;
    
    NSString * _nickName;
    NSString * _headIcon;
    NSString * _locationAddress;
    NSString * _longitude;               //经纬度
    NSString * _latitude;
    NSInteger _myVip;
    NSInteger isAuthen;
    NSInteger isNoble;
    
    BOOL isScale;
    double _scale;
    
}

@property (strong, nonatomic) id<IMessageModel> playingVoiceModel;
@property (nonatomic) BOOL isKicked;
@property (nonatomic) BOOL isPlayingAudio;
@property (nonatomic, strong) NSMutableArray *atTargets;

@property (nonatomic, strong) VPImageCropperViewController *imageCropperController;
@end

@implementation EaseMessageViewController

@synthesize conversation = _conversation;
@synthesize deleteConversationIfNull = _deleteConversationIfNull;
@synthesize messageCountOfPage = _messageCountOfPage;
@synthesize timeCellHeight = _timeCellHeight;
@synthesize messageTimeIntervalTag = _messageTimeIntervalTag;

- (instancetype)initWithConversationChatter:(NSString *)conversationChatter
                           conversationType:(EMConversationType)conversationType
{
    if ([conversationChatter length] == 0) {
        return nil;
    }
    
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _conversation = [[EMClient sharedClient].chatManager getConversation:conversationChatter type:conversationType createIfNotExist:YES];
        
        //  变量，对方的环信ID
        _name = conversationChatter;
        
        _messageCountOfPage = 10;
        _timeCellHeight = 60;
        _deleteConversationIfNull = YES;
        _scrollToBottomWhenAppear = YES;
        _messsagesSource = [NSMutableArray array];
        
        [_conversation markAllMessagesAsRead:nil];
    }
    return self;
}

#pragma mark - - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideImagePicker) name:@"hideImagePicker" object:nil];
    
    //Initialization
    CGFloat chatbarHeight = [EaseChatToolbar defaultHeight];
    EMChatToolbarType barType = self.conversation.type == EMConversationTypeChat ? EMChatToolbarTypeChat : EMChatToolbarTypeGroup;
    self.chatToolbar = [[EaseChatToolbar alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - chatbarHeight- BottomHeight, self.view.frame.size.width, chatbarHeight + BottomHeight) type:barType];//
    
    self.tableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];

    self.chatToolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    //Initializa the gesture recognizer
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardHidden:)];
//    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
//    _lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//    _lpgr.minimumPressDuration = 0.5;
//    [self.tableView addGestureRecognizer:_lpgr];
    
    _messageQueue = dispatch_queue_create("hyphenate.com", NULL);
    
    //Register the delegate
    [EMCDDeviceManager sharedInstance].delegate = self;
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].roomManager addDelegate:self delegateQueue:nil];

    if (self.conversation.type == EMConversationTypeChatRoom)
    {
        [self joinChatroom:self.conversation.conversationId];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didBecomeActive)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    [[EaseBaseMessageCell appearance] setSendBubbleBackgroundImage:[[UIImage imageNamed:@"chat_sender_bg1"] stretchableImageWithLeftCapWidth:5 topCapHeight:35]];
    [[EaseBaseMessageCell appearance] setRecvBubbleBackgroundImage:[[UIImage imageNamed:@"EaseUIResource.bundle/chat_receiver_bg"] stretchableImageWithLeftCapWidth:35 topCapHeight:35]];
    
    [[EaseBaseMessageCell appearance] setSendMessageVoiceAnimationImages:@[[UIImage imageNamed:@"chat_sender_audio_ly_full"], [UIImage imageNamed:@"EaseUIResource.bundle/chat_sender_audio_playing_000"], [UIImage imageNamed:@"chat_sender_audio_playing_001"], [UIImage imageNamed:@"chat_sender_audio_playing_002"], [UIImage imageNamed:@"chat_sender_audio_playing_003"]]];
    [[EaseBaseMessageCell appearance] setRecvMessageVoiceAnimationImages:@[[UIImage imageNamed:@"chat_receiver_audio_playing_full"],[UIImage imageNamed:@"EaseUIResource.bundle/chat_receiver_audio_playing000"], [UIImage imageNamed:@"chat_receiver_audio_playing001"], [UIImage imageNamed:@"chat_receiver_audio_playing002"], [UIImage imageNamed:@"chat_receiver_audio_playing003"]]];
    
    [[EaseBaseMessageCell appearance] setAvatarSize:43.f];
    [[EaseBaseMessageCell appearance] setAvatarCornerRadius:20.f];
    
    [[EaseChatBarMoreView appearance] setMoreViewBackgroundColor:[UIColor whiteColor]];

    
//    //  关注
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAttention:) name:@"addAttentionNotification" object:nil];
    
    [self tableViewDidTriggerHeaderRefresh];
    [self setupEmotion];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    
    if (USERID) {
        NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *userModel = arry.firstObject;
        //        MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
        
        _locationAddress = userModel.region;
        _longitude = userModel.longitude;
        _latitude = userModel.latitude;
        _headIcon = userModel.headIcon;
        _nickName = userModel.nickName;
        _myVip = userModel.consumptionLevel;
        isAuthen = userModel.isAuthen;
        isNoble = userModel.isNoble;
        
        self.personalModel = userModel;
    }
   
}

//  通话结束发送消息
//- (void)insertCallMessage:(NSNotification *)not{
//
////  只有对方点击挂断的时候，才会插入消息，其他情况，自己在实时通话的回调中模仿使用
//
//    NSDictionary * dict = not.userInfo;
//
//    NSMutableString * second = [NSMutableString stringWithFormat:@"%@", dict[@"time"]];
//
//    NSRange range = NSMakeRange(second.length - 2, 2);
//    NSString * secondStr = [second substringWithRange:range];
//
//    NSInteger time = [secondStr integerValue];
//    if (time <= 0) {
//        [second replaceCharactersInRange:range withString:@"01"];
//    }
//
//    NSString * messageStr = nil;
//    switch ([dict[@"reason"] integerValue]) {
//        case EMCallEndReasonNoResponse:  //对方没有响应
//        {
//            messageStr = @"对方没有响应";
//        }
//            break;
//        case EMCallEndReasonDecline:  //对方拒接
//        {
//            messageStr = @"对方拒接";
//        }
//            break;
//        case EMCallEndReasonBusy:  //对方占线
//        {
//            messageStr = @"对方占线";
//        }
//            break;
//        case EMCallEndReasonFailed:  //呼叫失败
//        {
//            messageStr = @"呼叫失败";
//        }
//            break;
//        case EMCallEndReasonUnsupported:  //功能不支持
//        {
//            messageStr = @"功能不支持";
//        }
//            break;
//        case EMCallEndReasonRemoteOffline:  //对方不在线
//        {
//            messageStr = @"对方不在线";
//        }
//            break;
//        default:
//            messageStr = [NSString stringWithFormat:@"聊天时长 %@", second];
//            break;
//    }
//
////    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:messageStr];
////    NSString * from = [[EMClient sharedClient] currentUsername];
////    NSString * to = self.conversation.conversationId;
//
////    NSString * avatarURLPath = [[NSUserDefaults standardUserDefaults] objectForKey:@"headIcon"];
////    NSString * nickname = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickname"];
//    NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"realTimeCall"];
////    [ext setObject:avatarURLPath forKey:@"avatarURLPath"];
////    [ext setObject:nickname forKey:@"nickname"];
//    [ext setObject:dict[@"callType"] forKey:@"callType"];
//    NSString * to = self.conversation.conversationId;
//
//    //  生成message
//    EMMessage * message = nil;
//    if ([dict[@"isCaller"] boolValue]) { //  主叫
//
////        message = [[EMMessage alloc] initWithConversationID:to from:from to:to body:body ext:ext];
//
//        message = [EaseSDKHelper sendTextMessage:messageStr
//                                                         to:to
//                                                messageType:[self _messageTypeFromConversationType]
//                                                 messageExt:ext];
//
//        message.chatType = EMChatTypeChat;  //  设置为单聊消息
//        message.status = EMMessageStatusSucceed;
////        [self addMessageToDataSource:message progress:nil];
//        [[EMClient sharedClient].chatManager importMessages:@[message] completion:^(EMError *aError) {
//
//        }];
//
////        EMError * error = [[EMError alloc] init];
////        [_conversation insertMessage:message error:&error];
//        [self _sendMessage:message];
//
//    }
//
//}

/*!
 @method
 @brief 设置表情
 @discussion 加载默认表情，如果子类实现了dataSource的自定义表情回调，同时会加载自定义表情
 @result
 */
- (void)setupEmotion
{
    if ([self.dataSource respondsToSelector:@selector(emotionFormessageViewController:)]) {
        NSArray* emotionManagers = [self.dataSource emotionFormessageViewController:self];
        [self.faceView setEmotionManagers:emotionManagers];
    } else {
        NSMutableArray *emotions = [NSMutableArray array];
        NSDictionary *emjDict =  [EaseEmotionEscape sharedInstance].dict;
        for (NSString *nameSt in [EaseEmoji allEmoji]) {
            NSString *name = [emjDict valueForKey:nameSt];
            EaseEmotion *emotion = [[EaseEmotion alloc] initWithName:@"" emotionId:name emotionThumbnail:name emotionOriginal:nameSt emotionOriginalURL:@"" emotionType:EMEmotionPng];
            [emotions addObject:emotion];
        }
        EaseEmotion *emotion = [emotions objectAtIndex:0];
        EaseEmotionManager *manager= [[EaseEmotionManager alloc] initWithType:EMEmotionPng emotionRow:3 emotionCol:7 emotions:emotions tagImage:[UIImage imageNamed:emotion.emotionId]];
        [self.faceView setEmotionManagers:@[manager]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"insertMessage" object:nil];
    [[EMCDDeviceManager sharedInstance] stopPlaying];
    [EMCDDeviceManager sharedInstance].delegate = nil;
    
    if (_imagePicker){
        [_imagePicker dismissViewControllerAnimated:NO completion:nil];
        _imagePicker = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    

    
//    self.tabBarController.tabBar.hidden = YES;
    
//    self.tabBarController.tabBar.bounds = CGRectMake(0, 0, 0, 0);
    
    self.isViewDidAppear = YES;
    
    [[EaseSDKHelper shareHelper] setIsShowingimagePicker:NO];
    
    if (self.scrollToBottomWhenAppear) {
        [self _scrollViewToBottom:NO];
    }
    self.scrollToBottomWhenAppear = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    self.tabBarController.tabBar.hidden = NO;
//    self.tabBarController.tabBar.bounds = CGRectMake(0, self.view.frame.origin.y - 64, self.view.frame.size.width, 49);
    self.isViewDidAppear = NO;
    [[EMCDDeviceManager sharedInstance] disableProximitySensor];
}

#pragma mark - chatroom

- (void)saveChatroom:(EMChatroom *)chatroom
{
    NSString *chatroomName = chatroom.subject ? chatroom.subject : @"";
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"OnceJoinedChatrooms_%@", [[EMClient sharedClient] currentUsername]];
    NSMutableDictionary *chatRooms = [NSMutableDictionary dictionaryWithDictionary:[ud objectForKey:key]];
    if (![chatRooms objectForKey:chatroom.chatroomId])
    {
        [chatRooms setObject:chatroomName forKey:chatroom.chatroomId];
        [ud setObject:chatRooms forKey:key];
        [ud synchronize];
    }
}

/*!
 @method
 @brief 加入聊天室
 @discussion
 @result
 */
- (void)joinChatroom:(NSString *)chatroomId
{
    __weak typeof(self) weakSelf = self;
//    [self showHudInView:self.view hint:NSEaseLocalizedString(@"chatroom.joining",@"Joining the chatroom")];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = nil;
        EMChatroom *chatroom = [[EMClient sharedClient].roomManager joinChatroom:chatroomId error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakSelf) {
                EaseMessageViewController *strongSelf = weakSelf;
                [strongSelf hideHud];
                if (error != nil) {
//                    [strongSelf showHint:[NSString stringWithFormat:NSEaseLocalizedString(@"chatroom.joinFailed",@"join chatroom \'%@\' failed"), chatroomId]];
                } else {
                    strongSelf.isJoinedChatroom = YES;
                    [strongSelf saveChatroom:chatroom];
                }
            }  else {
                if (!error || (error.code == EMErrorChatroomAlreadyJoined)) {
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        EMError *leaveError;
                        [[EMClient sharedClient].roomManager leaveChatroom:chatroomId error:&leaveError];
                        [[EMClient sharedClient].chatManager deleteConversation:chatroomId isDeleteMessages:YES completion:nil];
                    });
                }
            }
        });
    });
}

#pragma mark - EMChatManagerChatroomDelegate
- (void)didReceiveUserJoinedChatroom:(EMChatroom *)aChatroom
                            username:(NSString *)aUsername
{
//    CGRect frame = self.chatToolbar.frame;
//    [self showHint:[NSString stringWithFormat:NSEaseLocalizedString(@"chatroom.join", @"\'%@\'join chatroom\'%@\'"), aUsername, aChatroom.chatroomId] yOffset:-frame.size.height + KHintAdjustY];
}


- (void)didReceiveUserLeavedChatroom:(EMChatroom *)aChatroom
                            username:(NSString *)aUsername
{
//    CGRect frame = self.chatToolbar.frame;
//    [self showHint:[NSString stringWithFormat:NSEaseLocalizedString(@"chatroom.leave.hint", @"\'%@\'leave chatroom\'%@\'"), aUsername, aChatroom.chatroomId] yOffset:-frame.size.height + KHintAdjustY];
}

- (void)didReceiveKickedFromChatroom:(EMChatroom *)aChatroom
                              reason:(EMChatroomBeKickedReason)aReason
{
    if ([_conversation.conversationId isEqualToString:aChatroom.chatroomId])
    {
        _isKicked = YES;
//        CGRect frame = self.chatToolbar.frame;
//        [self showHint:[NSString stringWithFormat:NSEaseLocalizedString(@"chatroom.remove", @"be removed from chatroom\'%@\'"), aChatroom.chatroomId] yOffset:-frame.size.height + KHintAdjustY];
        [self.navigationController popToViewController:self animated:NO];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - getter

- (UIImagePickerController *)imagePicker
{
    if (_imagePicker == nil) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.modalPresentationStyle= UIModalPresentationOverFullScreen;
        _imagePicker.delegate = self;
    }
    
    return _imagePicker;
}

- (NSMutableArray*)atTargets
{
    if (!_atTargets) {
        _atTargets = [NSMutableArray array];
    }
    return _atTargets;
}

#pragma mark - setter

- (void)setIsViewDidAppear:(BOOL)isViewDidAppear
{
    _isViewDidAppear =isViewDidAppear;
    if (_isViewDidAppear)
    {
        NSMutableArray *unreadMessages = [NSMutableArray array];
        for (EMMessage *message in self.messsagesSource)
        {
            if ([self shouldSendHasReadAckForMessage:message read:NO])
            {
                [unreadMessages addObject:message];
            }
        }
        if ([unreadMessages count])
        {
            [self _sendHasReadResponseForMessages:unreadMessages isRead:YES];
        }
        
        [_conversation markAllMessagesAsRead:nil];
    }
}

- (void)setChatToolbar:(EaseChatToolbar *)chatToolbar
{
    [_chatToolbar removeFromSuperview];
    
    _chatToolbar = chatToolbar;
    if (_chatToolbar) {
        [self.view addSubview:_chatToolbar];
    }
    
    CGRect tableFrame = self.tableView.frame;
    
    tableFrame.size.height = [[UIScreen mainScreen] bounds].size.height - _chatToolbar.frame.size.height -BottomHeight;
    self.tableView.frame = tableFrame;
    if ([chatToolbar isKindOfClass:[EaseChatToolbar class]]) {
        [(EaseChatToolbar *)self.chatToolbar setDelegate:self];
        self.chatBarMoreView = (EaseChatBarMoreView*)[(EaseChatToolbar *)self.chatToolbar moreView];
        self.faceView = (EaseFaceView*)[(EaseChatToolbar *)self.chatToolbar faceView];
        self.recordView = (EaseRecordView*)[(EaseChatToolbar *)self.chatToolbar recordView];
    }
}

- (void)setDataSource:(id<EaseMessageViewControllerDataSource>)dataSource
{
    _dataSource = dataSource;
    
    [self setupEmotion];
}

- (void)setDelegate:(id<EaseMessageViewControllerDelegate>)delegate
{
    _delegate = delegate;
}

#pragma mark - private helper

/*!
 @method
 @brief tableView滑动到底部
 @discussion 
 @result
 */
- (void)_scrollViewToBottom:(BOOL)animated
{
    if (self.tableView.contentSize.height > self.tableView.frame.size.height)
    {
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        [self.tableView setContentOffset:offset animated:animated];
    }
}

/*!
 @method
 @brief 当前设备是否可以录音
 @discussion
 @result
 */
- (BOOL)_canRecord
{
    __block BOOL bCanRecord = YES;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
                bCanRecord = granted;
            }];
        }
    }
    
    return bCanRecord;
}

- (void)showMenuViewController:(UIView *)showInView
                   andIndexPath:(NSIndexPath *)indexPath
                    messageType:(EMMessageBodyType)messageType
{
    if (_menuController == nil) {
        _menuController = [UIMenuController sharedMenuController];
    }
    
    if (_deleteMenuItem == nil) {
        _deleteMenuItem = [[UIMenuItem alloc] initWithTitle:NSEaseLocalizedString(@"delete", @"Delete") action:@selector(deleteMenuAction:)];
    }
    
    if (_copyMenuItem == nil) {
        _copyMenuItem = [[UIMenuItem alloc] initWithTitle:NSEaseLocalizedString(@"copy", @"Copy") action:@selector(copyMenuAction:)];
    }
    
    if (messageType == EMMessageBodyTypeText) {
        [_menuController setMenuItems:@[_copyMenuItem, _deleteMenuItem]];
    } else {
        [_menuController setMenuItems:@[_deleteMenuItem]];
    }
    [_menuController setTargetRect:showInView.frame inView:showInView.superview];
    [_menuController setMenuVisible:YES animated:YES];
}

- (void)_stopAudioPlayingWithChangeCategory:(BOOL)isChange
{
    //停止音频播放及播放动画
    [[EMCDDeviceManager sharedInstance] stopPlaying];
    [[EMCDDeviceManager sharedInstance] disableProximitySensor];
    [EMCDDeviceManager sharedInstance].delegate = nil;
    
    //    MessageModel *playingModel = [self.EaseMessageReadManager stopMessageAudioModel];
    //    NSIndexPath *indexPath = nil;
    //    if (playingModel) {
    //        indexPath = [NSIndexPath indexPathForRow:[self.dataSource indexOfObject:playingModel] inSection:0];
    //    }
    //
    //    if (indexPath) {
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [self.tableView beginUpdates];
    //            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    //            [self.tableView endUpdates];
    //        });
    //    }
}

/*!
 @method
 @brief mov格式视频转换为MP4格式
 @discussion
 @param movUrl   mov视频路径
 @result  MP4格式视频路径
 */
- (NSURL *)_convert2Mp4:(NSURL *)movUrl
{
    NSURL *mp4Url = nil;
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:movUrl options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetHighestQuality]) {
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset
                                                                              presetName:AVAssetExportPresetHighestQuality];
        NSString *mp4Path = [NSString stringWithFormat:@"%@/%d%d.mp4", [EMCDDeviceManager dataPath], (int)[[NSDate date] timeIntervalSince1970], arc4random() % 100000];
        mp4Url = [NSURL fileURLWithPath:mp4Path];
        exportSession.outputURL = mp4Url;
        exportSession.shouldOptimizeForNetworkUse = YES;
        exportSession.outputFileType = AVFileTypeMPEG4;
        dispatch_semaphore_t wait = dispatch_semaphore_create(0l);
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            switch ([exportSession status]) {
                case AVAssetExportSessionStatusFailed: {
//                    NSLog(@"failed, error:%@.", exportSession.error);
                } break;
                case AVAssetExportSessionStatusCancelled: {
//                    NSLog(@"cancelled.");
                } break;
                case AVAssetExportSessionStatusCompleted: {
//                    NSLog(@"completed.");
                    
                } break;
                default: {
//                    NSLog(@"others.");
                } break;
            }
            dispatch_semaphore_signal(wait);
        }];
        long timeout = dispatch_semaphore_wait(wait, DISPATCH_TIME_FOREVER);
        if (timeout) {
            NSLog(@"timeout.");
        }
        if (wait) {
            //dispatch_release(wait);
            wait = nil;
        }
    }
    
    return mp4Url;
}


/*!
 @method
 @brief 通过当前会话类型，返回消息聊天类型
 @discussion
 @result
 */
- (EMChatType)_messageTypeFromConversationType
{
    EMChatType type = EMChatTypeChat;
    switch (self.conversation.type) {
        case EMConversationTypeChat:
            type = EMChatTypeChat;
            break;
        case EMConversationTypeGroupChat:
            type = EMChatTypeGroupChat;
            break;
        case EMConversationTypeChatRoom:
            type = EMChatTypeChatRoom;
            break;
        default:
            break;
    }
    return type;
}

/*!
 @method
 @brief 下载消息附件
 @discussion
 @param message  待下载附件的消息
 @result
 */
- (void)_downloadMessageAttachments:(EMMessage *)message
{
    __weak typeof(self) weakSelf = self;
    void (^completion)(EMMessage *aMessage, EMError *error) = ^(EMMessage *aMessage, EMError *error) {
        if (!error)
        {
            [weakSelf _reloadTableViewDataWithMessage:message];
        }
        else
        {
            [weakSelf showHint:NSEaseLocalizedString(@"message.thumImageFail", @"thumbnail for failure!")];
        }
    };
    
    EMMessageBody *messageBody = message.body;
    if ([messageBody type] == EMMessageBodyTypeImage) {
        EMImageMessageBody *imageBody = (EMImageMessageBody *)messageBody;
        if (imageBody.thumbnailDownloadStatus > EMDownloadStatusSuccessed)
        {
            //download the message thumbnail
            [[[EMClient sharedClient] chatManager] downloadMessageThumbnail:message progress:nil completion:completion];
        }
    }
    else if ([messageBody type] == EMMessageBodyTypeVideo)
    {
        EMVideoMessageBody *videoBody = (EMVideoMessageBody *)messageBody;
        if (videoBody.thumbnailDownloadStatus > EMDownloadStatusSuccessed)
        {
            //download the message thumbnail
            [[[EMClient sharedClient] chatManager] downloadMessageThumbnail:message progress:nil completion:completion];
        }
    }
    else if ([messageBody type] == EMMessageBodyTypeVoice)
    {
        EMVoiceMessageBody *voiceBody = (EMVoiceMessageBody*)messageBody;
        if (voiceBody.downloadStatus > EMDownloadStatusSuccessed)
        {
            //download the message attachment
            [[EMClient sharedClient].chatManager downloadMessageAttachment:message progress:nil completion:^(EMMessage *message, EMError *error) {
                if (!error) {
                    [weakSelf _reloadTableViewDataWithMessage:message];
                }
                else {
                    [weakSelf showHint:NSEaseLocalizedString(@"message.voiceFail", @"voice for failure!")];
                }
            }];
        }
    }
}

/*!
 @method
 @brief 传入消息是否需要发动已读回执
 @discussion
 @param message  待判断的消息
 @param read     消息是否已读
 @result
 */
- (BOOL)shouldSendHasReadAckForMessage:(EMMessage *)message
                                   read:(BOOL)read
{
    NSString *account = [[EMClient sharedClient] currentUsername];
    if (message.chatType != EMChatTypeChat || message.isReadAcked || [account isEqualToString:message.from] || ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground) || !self.isViewDidAppear)
    {
        return NO;
    }
    
    EMMessageBody *body = message.body;
    if (((body.type == EMMessageBodyTypeVideo) ||
         (body.type == EMMessageBodyTypeVoice) ||
         (body.type == EMMessageBodyTypeImage)) &&
        !read)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

/*!
 @method
 @brief 为传入的消息发送已读回执
 @discussion
 @param messages  待发送已读回执的消息数组
 @param isRead    是否已读
 @result
 */
- (void)_sendHasReadResponseForMessages:(NSArray*)messages
                                 isRead:(BOOL)isRead
{
    NSMutableArray *unreadMessages = [NSMutableArray array];
    for (NSInteger i = 0; i < [messages count]; i++)
    {
        EMMessage *message = messages[i];
        BOOL isSend = YES;
        if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:shouldSendHasReadAckForMessage:read:)]) {
            isSend = [_dataSource messageViewController:self
                         shouldSendHasReadAckForMessage:message read:isRead];
        }
        else{
            isSend = [self shouldSendHasReadAckForMessage:message
                                                      read:isRead];
        }
        
        if (isSend)
        {
            [unreadMessages addObject:message];
        }
    }
    
    if ([unreadMessages count])
    {
        for (EMMessage *message in unreadMessages)
        {
            [[EMClient sharedClient].chatManager sendMessageReadAck:message completion:nil];
        }
    }
}

- (BOOL)_shouldMarkMessageAsRead
{
    BOOL isMark = YES;
    if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewControllerShouldMarkMessagesAsRead:)]) {
        isMark = [_dataSource messageViewControllerShouldMarkMessagesAsRead:self];
    }
    else{
        if (([UIApplication sharedApplication].applicationState == UIApplicationStateBackground) || !self.isViewDidAppear)
        {
            isMark = NO;
        }
    }
    
    return isMark;
}

/*!
 @method
 @brief 位置消息被点击选择
 @discussion
 @param model 消息model
 @result
 */
- (void)_locationMessageCellSelected:(id<IMessageModel>)model
{
    _scrollToBottomWhenAppear = NO;
    
    EaseLocationViewController *locationController = [[EaseLocationViewController alloc] initWithLocation:CLLocationCoordinate2DMake(model.latitude, model.longitude)];
    [self.navigationController pushViewController:locationController animated:YES];
}

/*!
 @method
 @brief 视频消息被点击选择

 @param model 消息model

 */
/*
- (void)_videoMessageCellSelected:(id<IMessageModel>)model
{
    _scrollToBottomWhenAppear = NO;
    
    EMVideoMessageBody *videoBody = (EMVideoMessageBody*)model.message.body;

    NSString *localPath = [model.fileLocalPath length] > 0 ? model.fileLocalPath : videoBody.localPath;
    NSLog(@"fileLocalPath-- %@",[NSURL URLWithString:model.fileLocalPath]);
    NSLog(@"localPath-- %@",[NSURL fileURLWithPath:model.fileLocalPath]);
    if ([localPath length] == 0) {
        [self showHint:NSEaseLocalizedString(@"message.videoFail", @"video for failure!")];
        return;
    }

    dispatch_block_t block = ^{
        //send the acknowledgement
        [self _sendHasReadResponseForMessages:@[model.message]
                                       isRead:YES];

        NSURL *videoURL = [NSURL fileURLWithPath:localPath];
        MPMoviePlayerViewController *moviePlayerController = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
        [moviePlayerController.moviePlayer prepareToPlay];
        moviePlayerController.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        [self presentMoviePlayerViewControllerAnimated:moviePlayerController];
    };
    
    __weak typeof(self) weakSelf = self;
    void (^completion)(EMMessage *aMessage, EMError *error) = ^(EMMessage *aMessage, EMError *error) {
        if (!error)
        {
            [weakSelf _reloadTableViewDataWithMessage:aMessage];
        }
        else
        {
            [weakSelf showHint:NSEaseLocalizedString(@"message.thumImageFail", @"thumbnail for failure!")];
        }
    };

    if (videoBody.thumbnailDownloadStatus == EMDownloadStatusFailed || ![[NSFileManager defaultManager] fileExistsAtPath:videoBody.thumbnailLocalPath]) {
        [self showHint:@"begin downloading thumbnail image, click later"];
        [[EMClient sharedClient].chatManager downloadMessageThumbnail:model.message progress:nil completion:completion];
        return;
    }

    if (videoBody.downloadStatus == EMDownloadStatusSuccessed && [[NSFileManager defaultManager] fileExistsAtPath:localPath])
    {
        block();
        return;
    }

    [self showHudInView:self.view hint:NSEaseLocalizedString(@"message.downloadingVideo", @"downloading video...")];
    [[EMClient sharedClient].chatManager downloadMessageAttachment:model.message progress:nil completion:^(EMMessage *message, EMError *error) {
        [weakSelf hideHud];
        if (!error) {
            block();
        }else{
            [weakSelf showHint:NSEaseLocalizedString(@"message.videoFail", @"video for failure!")];
        }
    }];
}
*/
/*!
 @method
 @brief 图片消息被点击选择
 @discussion
 @param model 消息model
 @result
 */
- (void)_imageMessageCellSelected:(id<IMessageModel>)model withCell:(id)cell
{
    
    EaseMessageCell *cells = (EaseMessageCell*)cell;
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    __block NSUInteger indexIMg;
    __block NSUInteger isImageMessage;
    EMConversation * convers = [[EMClient sharedClient].chatManager getConversation:model.message.conversationId type:model.message.chatType createIfNotExist:NO];
    
    [convers loadMessagesStartFromId:nil count:200 searchDirection:EMMessageSearchDirectionUp completion:^(NSArray *aMessages, EMError *aError) {
        __weak EaseMessageViewController *weakSelf = self;
        if(aMessages.count<1) return;
        NSMutableArray  *marrryImg = [NSMutableArray arrayWithCapacity:aMessages.count];
        __block CGRect rectInWindow;
        for (int i = 0; i < aMessages.count; i++) {
            
            EMMessage *message = aMessages[i];
            if ([message.body isKindOfClass:[EMVideoMessageBody class]]) {
                if ([model.message.messageId isEqualToString:message.messageId]){
                    rectInWindow = [cells convertRect:cells.bubbleView.frame toView:window];
                    isImageMessage = 1;
                }
                EMVideoMessageBody *videoBody = (EMVideoMessageBody*)message.body;
                
                NSString *localPath;
                if ([videoBody.localPath length] > 0) {
                    localPath =  videoBody.localPath;
                }else{
                    localPath = videoBody.remotePath;
                }
                if ([localPath length] == 0) {
                    [self showHint:NSEaseLocalizedString(@"message.videoFail", @"video for failure!")];
                    continue;
                }
                PhotoLibModel * model1 = [[PhotoLibModel alloc]init];
                model1.photoType = @(1);
                model1.photoUrl = videoBody.thumbnailRemotePath;
                model1.videoUrl = localPath;
                model1.message = message;
                //                    NSURL *videoURL = [NSURL fileURLWithPath:localPath];
                [marrryImg addObject:model1];
                
                if (videoBody.thumbnailDownloadStatus == EMDownloadStatusFailed || ![[NSFileManager defaultManager] fileExistsAtPath:videoBody.thumbnailLocalPath]) {
//                    [self showHint:@"begin downloading thumbnail image, click later"];
                    [[EMClient sharedClient].chatManager downloadMessageThumbnail:message progress:nil completion:nil];
                    continue;
                }
                
//                if (videoBody.downloadStatus == EMDownloadStatusSuccessed && [[NSFileManager defaultManager] fileExistsAtPath:localPath])
//                {
//                    model1.playStatue = YES;
//                    continue;
//                }else{
//                     model1.playStatue = NO;
//                      [self showHudInView:self.view hint:NSEaseLocalizedString(@"message.downloadingVideo", @"downloading video...")];
//                    [[EMClient sharedClient].chatManager downloadMessageAttachment:model.message progress:nil completion:^(EMMessage *message, EMError *error) {
//                        [weakSelf hideHud];
//                        if (!error) {
//                            model1.playStatue = YES;
//                            //                         continue;
//                        }else{
//                            //                        [weakSelf showHint:NSEaseLocalizedString(@"message.videoFail", @"video for failure!")];
//                        }
//                    }];
//                 }
                

            }else if([message.body isKindOfClass:[EMImageMessageBody class]]){
                if ([model.message.messageId isEqualToString:message.messageId]){
                    rectInWindow = [cells convertRect:cells.bubbleView.frame toView:window];
                    isImageMessage = 2;
                }
                EMImageMessageBody *imageBody = (EMImageMessageBody*)[message body];
                if (imageBody.thumbnailDownloadStatus == EMDownloadStatusSuccessed) {
                    PhotoLibModel * pmodel = [[PhotoLibModel alloc]init];
                    pmodel.message = message;
                    pmodel.photoType = @(0);
//                    if (imageBody.downloadStatus == EMDownloadStatusSuccessed)
//                    {
                        //send the acknowledgement
//                        if ([model.message.messageId isEqualToString:message.messageId] && message.direction == EMMessageDirectionReceive) {
//                            [weakSelf _sendHasReadResponseForMessages:@[message] isRead:YES];
//                        }
//                        NSString *localPath = [imageBody localPath];
//                        pmodel.photoUrl = localPath;
//                    }else{
                        NSString *rePath = [imageBody remotePath];
                        pmodel.photoUrl = rePath;
                        
//                    }
                    [marrryImg addObject:pmodel];
                }
            }
        }
        
        NSString *strP;
        if (isImageMessage == 2) {
            EMImageMessageBody *imageBody = (EMImageMessageBody*)[model.message body];
            if (imageBody.thumbnailDownloadStatus == EMDownloadStatusSuccessed) {
                
//                if (imageBody.downloadStatus == EMDownloadStatusSuccessed)
//                {
//                    NSString *localPath = [imageBody localPath];
//                    strP = localPath;
//                }else{
                    NSString *rePath = [imageBody remotePath];
                    strP = rePath;
                    
//                }
            }
        }else{
            EMVideoMessageBody *videoBody = (EMVideoMessageBody*)model.message.body;
            if ([videoBody.localPath length] > 0) {
                strP = videoBody.localPath;
            }else{
                strP = videoBody.remotePath;
            }
     
        }
        
        [marrryImg enumerateObjectsUsingBlock:^( PhotoLibModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.photoUrl isEqualToString:strP]) {
                indexIMg = idx;
                *stop = YES;
            }
            if ([obj.videoUrl isEqualToString:strP]) {
                indexIMg = idx;
                *stop = YES;
            }
        }];
        
        DYBasePopView *baseView = [[DYBasePopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        baseView.iconArray = marrryImg;
        baseView.rectArray = @[NSStringFromCGRect(rectInWindow)];
        baseView.index = indexIMg;
        [[UIApplication sharedApplication].keyWindow addSubview:baseView];
        baseView.backgroundColor = [UIColor blackColor];
    }];
    

}

/*!
 @method
 @brief 语音消息被点击选择
 @discussion
 @param model 消息model
 @result
 */
- (void)_audioMessageCellSelected:(id<IMessageModel>)model
{
    _scrollToBottomWhenAppear = NO;
    EMVoiceMessageBody *body = (EMVoiceMessageBody*)model.message.body;
    EMDownloadStatus downloadStatus = [body downloadStatus];
    if (downloadStatus == EMDownloadStatusDownloading) {
        [self showHint:NSEaseLocalizedString(@"message.downloadingAudio", @"downloading voice, click later")];
        return;
    }
    else if (downloadStatus == EMDownloadStatusFailed)
    {
        [self showHint:NSEaseLocalizedString(@"message.downloadingAudio", @"downloading voice, click later")];
        [[EMClient sharedClient].chatManager downloadMessageAttachment:model.message progress:nil completion:nil];
        return;
    }
    
    // play the audio
    if (model.bodyType == EMMessageBodyTypeVoice) {
        //send the acknowledgement
        [self _sendHasReadResponseForMessages:@[model.message] isRead:YES];
        __weak EaseMessageViewController *weakSelf = self;
        BOOL isPrepare = [[EaseMessageReadManager defaultManager] prepareMessageAudioModel:model updateViewCompletion:^(EaseMessageModel *prevAudioModel, EaseMessageModel *currentAudioModel) {
            if (prevAudioModel || currentAudioModel) {
                [weakSelf.tableView reloadData];
            }
        }];
        
        if (isPrepare) {
            _isPlayingAudio = YES;
            __weak EaseMessageViewController *weakSelf = self;
            [[EMCDDeviceManager sharedInstance] enableProximitySensor];
            [[EMCDDeviceManager sharedInstance] asyncPlayingWithPath:model.fileLocalPath completion:^(NSError *error) {
                [[EaseMessageReadManager defaultManager] stopMessageAudioModel];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadData];
                    weakSelf.isPlayingAudio = NO;
                    [[EMCDDeviceManager sharedInstance] disableProximitySensor];
                });
            }];
        }
        else{
            _isPlayingAudio = NO;
        }
    }
}

#pragma mark - pivate data

/*!
 @method
 @brief 加载历史消息
 @discussion
 @param messageId 参考消息的ID
 @param count     获取条数
 @param isAppend  是否在dataArray直接添加
 @result
 */
- (void)_loadMessagesBefore:(NSString*)messageId
                      count:(NSInteger)count
                     append:(BOOL)isAppend
{
    __weak typeof(self) weakSelf = self;
    void (^refresh)(NSArray *messages) = ^(NSArray *messages) {
        dispatch_async(_messageQueue, ^{
            //Format the message
            NSArray *formattedMessages = [weakSelf formatMessages:messages];
            
            //Refresh the page
            dispatch_async(dispatch_get_main_queue(), ^{
                EaseMessageViewController *strongSelf = weakSelf;
                if (strongSelf) {
                    NSInteger scrollToIndex = 0;
                    if (isAppend) {
                        [strongSelf.messsagesSource insertObjects:messages atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [messages count])]];
                        
                        //Combine the message
                        id object = [strongSelf.dataArray firstObject];
                        if ([object isKindOfClass:[NSString class]]) {
                            NSString *timestamp = object;
                            [formattedMessages enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id model, NSUInteger idx, BOOL *stop) {
                                if ([model isKindOfClass:[NSString class]] && [timestamp isEqualToString:model]) {
                                    [strongSelf.dataArray removeObjectAtIndex:0];
                                    *stop = YES;
                                }
                            }];
                        }
                        scrollToIndex = [strongSelf.dataArray count];
                        [strongSelf.dataArray insertObjects:formattedMessages atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [formattedMessages count])]];
                    }
                    else {
                        [strongSelf.messsagesSource removeAllObjects];
                        [strongSelf.messsagesSource addObjectsFromArray:messages];
                        
                        [strongSelf.dataArray removeAllObjects];
                        [strongSelf.dataArray addObjectsFromArray:formattedMessages];
                    }
                    
                    EMMessage *latest = [strongSelf.messsagesSource lastObject];
                    strongSelf.messageTimeIntervalTag = latest.timestamp;
                    
                    [strongSelf.tableView reloadData];
                    
                    [strongSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count] - scrollToIndex - 1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
                }
            });
            
            //re-download all messages that are not successfully downloaded
            for (EMMessage *message in messages)
            {
                [weakSelf _downloadMessageAttachments:message];
            }
            
            //send the read acknoledgement
            [weakSelf _sendHasReadResponseForMessages:messages
                                               isRead:NO];
        });
    };
    
    [self.conversation loadMessagesStartFromId:messageId count:(int)count searchDirection:EMMessageSearchDirectionUp completion:^(NSArray *aMessages, EMError *aError) {
        if (!aError && [aMessages count]) {
            refresh(aMessages);
        }else{
            
        }
        
    }];
}

#pragma mark - GestureRecognizer

-(void)keyBoardHidden:(UITapGestureRecognizer *)tapRecognizer
{
    if (tapRecognizer.state == UIGestureRecognizerStateEnded) {
        [self.chatToolbar endEditing:YES];
    }
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan && [self.dataArray count] > 0)
    {
        CGPoint location = [recognizer locationInView:self.tableView];
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:location];
        BOOL canLongPress = NO;
        if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:canLongPressRowAtIndexPath:)]) {
            canLongPress = [_dataSource messageViewController:self
                                   canLongPressRowAtIndexPath:indexPath];
        }
        
        if (!canLongPress) {
            return;
        }
        
        if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:didLongPressRowAtIndexPath:)]) {
            [_dataSource messageViewController:self
                    didLongPressRowAtIndexPath:indexPath];
        }
        else{
            id object = [self.dataArray objectAtIndex:indexPath.row];
            if (![object isKindOfClass:[NSString class]]) {
                EaseMessageCell *cell = (EaseMessageCell *)[self.tableView cellForRowAtIndexPath:indexPath];
                [cell becomeFirstResponder];
                _menuIndexPath = indexPath;
                [self showMenuViewController:cell.bubbleView andIndexPath:indexPath messageType:cell.model.bodyType];
            }
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataArray objectAtIndex:indexPath.row];
    
//    time cell
//    if ([object isKindOfClass:[NSString class]]) {
//        NSString *TimeCellIdentifier = [EaseMessageTimeCell cellIdentifier];
//        EaseMessageTimeCell *timeCell = (EaseMessageTimeCell *)[tableView dequeueReusableCellWithIdentifier:TimeCellIdentifier];
//        
//        if (timeCell == nil) {
//            timeCell = [[EaseMessageTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellIdentifier];
//            timeCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
//        
//        timeCell.title = object;
//        return timeCell;
//    }
//    else{
        id<IMessageModel> model = object;
        if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:cellForMessageModel:)]) {
            UITableViewCell *cell = [_delegate messageViewController:tableView cellForMessageModel:model];
            if (cell) {
                if ([cell isKindOfClass:[EaseMessageCell class]]) {
                    EaseMessageCell *emcell= (EaseMessageCell*)cell;
                    if (emcell.delegate == nil) {
                        emcell.delegate = self;
                    }
                }

                return cell;
            }
        }
    
    //    time cell
    if ([object isKindOfClass:[NSString class]]) {
        if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:cellForTimeString:)]) {
            UITableViewCell *cell = [_delegate messageViewController:tableView cellForTimeString:object];
            if (cell) {
                
                return cell;
            }
        }
        NSString *TimeCellIdentifier = [EaseMessageTimeCell cellIdentifier];
        EaseMessageTimeCell *timeCell = (EaseMessageTimeCell *)[tableView dequeueReusableCellWithIdentifier:TimeCellIdentifier];
        
        if (timeCell == nil) {
            timeCell = [[EaseMessageTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellIdentifier];
            timeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        timeCell.title = object;
        return timeCell;
    }

        if (_dataSource && [_dataSource respondsToSelector:@selector(isEmotionMessageFormessageViewController:messageModel:)]) {
            BOOL flag = [_dataSource isEmotionMessageFormessageViewController:self messageModel:model];
            if (flag) {
                NSString *CellIdentifier = [EaseCustomMessageCell cellIdentifierWithModel:model];
                //send cell
                EaseCustomMessageCell *sendCell = (EaseCustomMessageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                
                // Configure the cell...
                if (sendCell == nil) {
                    sendCell = [[EaseCustomMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier model:model];
                    sendCell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                
                if (_dataSource && [_dataSource respondsToSelector:@selector(emotionURLFormessageViewController:messageModel:)]) {
                    EaseEmotion *emotion = [_dataSource emotionURLFormessageViewController:self messageModel:model];
                    if (emotion) {
                        model.image = [UIImage sd_animatedGIFNamed:emotion.emotionOriginal];
                        model.fileURLPath = emotion.emotionOriginalURL;
                    }
                }
                //  是否是群聊
                sendCell.isGroupChat = NO;
                sendCell.model = model;
                sendCell.delegate = self;
                return sendCell;
            }
        }
        
        NSString *CellIdentifier = [EaseMessageCell cellIdentifierWithModel:model];
        
        EaseBaseMessageCell *sendCell = (EaseBaseMessageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        if (sendCell == nil) {
            sendCell = [[EaseBaseMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier model:model];
            sendCell.selectionStyle = UITableViewCellSelectionStyleNone;
            sendCell.delegate = self;
        }
        sendCell.messageNameIsHidden = YES;
        sendCell.model = model;
        return sendCell;
//    }
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataArray objectAtIndex:indexPath.row];
//    if ([object isKindOfClass:[NSString class]]) {
//        return self.timeCellHeight;
//    }
//    else{
    id<IMessageModel> model = object;
    if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:heightForMessageModel:withCellWidth:)]) {
        CGFloat height = [_delegate messageViewController:self heightForMessageModel:model withCellWidth:tableView.frame.size.width];
        if (height) {
            return height;
        }
    }
    
    if ([object isKindOfClass:[NSString class]]) {
        return self.timeCellHeight;
    }
    
    if (_dataSource && [_dataSource respondsToSelector:@selector(isEmotionMessageFormessageViewController:messageModel:)]) {
        BOOL flag = [_dataSource isEmotionMessageFormessageViewController:self messageModel:model];
        if (flag) {
            return [EaseCustomMessageCell cellHeightWithModel:model];
        }
    }
    return [EaseBaseMessageCell cellHeightWithModel:model] - 2;
//    }
}
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        NSURL *videoURL;
        if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
          
//          [self changeUrl:info[UIImagePickerControllerReferenceURL] withPicker:picker];
            
        }else{
            videoURL = info[UIImagePickerControllerMediaURL];
            // video url:
            // file:///private/var/mobile/Applications/B3CDD0B2-2F19-432B-9CFA-158700F4DE8F/tmp/capture-T0x16e39100.tmp.9R8weF/capturedvideo.mp4
            // we will convert it to mp4 format
            NSURL *mp4 = [self _convert2Mp4:videoURL];
            BOOL isSendVideo = [self getVideoDuration:mp4];
            if (!isSendVideo) {
                [picker dismissViewControllerAnimated:YES completion:^{}];
                return;
            };
            NSFileManager *fileman = [NSFileManager defaultManager];
            if ([fileman fileExistsAtPath:videoURL.path]) {
                NSError *error = nil;
                [fileman removeItemAtURL:videoURL error:&error];
                if (error) {
                    NSLog(@"failed to remove file, error:%@.", error);
                }
            }
            [picker dismissViewControllerAnimated:YES completion:^{}];
            [self sendVideoMessageWithURL:mp4];
        }
        
    }else{
        
//        NSURL *url = info[UIImagePickerControllerReferenceURL];
//        if (url != nil) {
            UIImage *orgImage = info[UIImagePickerControllerOriginalImage];
            UIImageOrientation imageOrientation=orgImage.imageOrientation;
            if(imageOrientation!=UIImageOrientationUp)
            {
                // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
                // 以下为调整图片角度的部分
                UIGraphicsBeginImageContext(orgImage.size);
                [orgImage drawInRect:CGRectMake(0, 0, orgImage.size.width, orgImage.size.height)];
                orgImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                // 调整图片角度完毕
            }
            if(picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
            {
                self.imageCropperController = [[VPImageCropperViewController alloc] initWithImage:orgImage cropFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) limitScaleRatio:1];
                self.imageCropperController.delegate = self;
                [picker pushViewController:self.imageCropperController animated:YES];
            }else{
                [picker dismissViewControllerAnimated:YES completion:^{}];
                [self sendImageMessage:orgImage];
            }

//            [self sendImageMessage:orgImage];
//        } else {
//            if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0f) {
//                PHFetchResult *result = [PHAsset fetchAssetsWithALAssetURLs:@[url] options:nil];
//                [result enumerateObjectsUsingBlock:^(PHAsset *asset , NSUInteger idx, BOOL *stop){
//                    if (asset) {
//                        [[PHImageManager defaultManager] requestImageDataForAsset:asset options:nil resultHandler:^(NSData *data, NSString *uti, UIImageOrientation orientation, NSDictionary *dic){
//                            if (data.length > 10 * 1000 * 1000) {
//                                [self showHint:NSEaseLocalizedString(@"message.smallerImage", @"The image size is too large, please choose another one")];
//                                return;
//                            }
//                            if (data != nil) {
//                                [self sendImageMessageWithData:data];
//                            } else {
//                                [self showHint:NSEaseLocalizedString(@"message.smallerImage", @"The image size is too large, please choose another one")];
//                            }
//                        }];
//                    }
//                }];
//            } else {
//                ALAssetsLibrary *alasset = [[ALAssetsLibrary alloc] init];
//                [alasset assetForURL:url resultBlock:^(ALAsset *asset) {
//                    if (asset) {
//                        ALAssetRepresentation* assetRepresentation = [asset defaultRepresentation];
//                        Byte* buffer = (Byte*)malloc((size_t)[assetRepresentation size]);
//                        NSUInteger bufferSize = [assetRepresentation getBytes:buffer fromOffset:0.0 length:(NSUInteger)[assetRepresentation size] error:nil];
//                        NSData* fileData = [NSData dataWithBytesNoCopy:buffer length:bufferSize freeWhenDone:YES];
//                        if (fileData.length > 10 * 1000 * 1000) {
//                            [self showHint:NSEaseLocalizedString(@"message.smallerImage", @"The image size is too large, please choose another one")];
//                            return;
//                        }
//                        [self sendImageMessageWithData:fileData];
//                    }
//                } failureBlock:NULL];
//            }
//        }
    }
    
//    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.isViewDidAppear = YES;
    [[EaseSDKHelper shareHelper] setIsShowingimagePicker:NO];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
    
//    if (self.delegate) {
//        [self.delegate imagePickerControllerDidCancel:self];
//    }
    
    self.isViewDidAppear = YES;
    [[EaseSDKHelper shareHelper] setIsShowingimagePicker:NO];
}
#pragma mark - TZImagePickerController

- (void)pushImagePickerController {

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
//    imagePickerVc.isSelectOriginalPhoto = YES;
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    if (self.groupModel) {
        if (self.groupModel.roomId.integerValue != 0) {
            imagePickerVc.allowPickingVideo = YES;
        }else{
            imagePickerVc.allowPickingVideo = NO;
        }
    }
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    imagePickerVc.maxImagesCount = 1;
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    // 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    //    imagePickerVc.circleCropRadius = 100;
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/

//
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
#pragma mark TZImagePickerControllerDelegate
// photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    
    UIImage *orgImage = photos[0];
    [self sendImageMessage:orgImage];
}
// 如果用户选择了一个视频，下面的handle会被执行
// 如果系统版本大于iOS8，asset是PHAsset类的对象，否则是ALAsset类的对象
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    [LQProgressHud showLoading:nil];
//    __weak typeof (self) weakSelf = self;
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset completion:^(NSString *outputPath) {
//        NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSURL* url = [NSURL fileURLWithPath:outputPath];
            NSURL *mp4 = [self _convert2Mp4:url];
            BOOL isSendVideo = [self getVideoDuration:mp4];
            if (!isSendVideo) {
                return;
            };
            NSFileManager *fileman = [NSFileManager defaultManager];
            if ([fileman fileExistsAtPath:url.path]) {
                NSError *error = nil;
                [fileman removeItemAtURL:url error:&error];
                if (error) {
                    NSLog(@"failed to remove file, error:%@.", error);
                }
            }
            //        [picker dismissViewControllerAnimated:YES completion:^{}];
            [LQProgressHud hide];
            [self sendVideoMessageWithURL:mp4];
        });
        
    }];
}

- (void)changeUrl:(NSURL *)sourceURL withPicker:(UIImagePickerController *)picker{

    //        [MBProgressHUD hideHUDForView:self.view animated:YES];
//    NSURL *sourceURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSURL *newVideoUrl ; //一般.mp4
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复，在测试的时候其实可以判断文件是否存在若存在，则删除，重新生成文件即可
    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    newVideoUrl = [NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingFormat:@"/Documents/output-%@.mp4", [formater stringFromDate:[NSDate date]]]] ;//这个是保存在app自己的沙盒路径里，后面可以选择是否在上传后删除掉。我建议删除掉，免得占空间。
    
//    [self convertVideoQuailtyWithInputURL:sourceURL outputURL:newVideoUrl completeHandler:nil];
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:sourceURL options:AVURLAssetReferenceRestrictionsKey];
    
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPresetMediumQuality];
    //  NSLog(resultPath);
    exportSession.outputURL = newVideoUrl;
    exportSession.outputFileType = AVFileTypeMPEG4;//AVFileTypeQuickTimeMovie
    exportSession.shouldOptimizeForNetworkUse= YES;
    if (exportSession == nil) {
        [LQProgressHud showMessage:@"视频格式不对,请重新选择"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    __weak typeof (self) weakSelf = self;
    [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
     {
         switch (exportSession.status) {
             case AVAssetExportSessionStatusCancelled:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 //                 NSLog(@"AVAssetExportSessionStatusCancelled");
                 break;
             case AVAssetExportSessionStatusUnknown:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 //                 NSLog(@"AVAssetExportSessionStatusUnknown");
                 break;
             case AVAssetExportSessionStatusWaiting:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 //                 NSLog(@"AVAssetExportSessionStatusWaiting");
                 break;
             case AVAssetExportSessionStatusExporting:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"AVAssetExportSessionStatusExporting");
                 break;
             case AVAssetExportSessionStatusCompleted:
             {
                 //                 NSLog(@"AVAssetExportSessionStatusCompleted");
                 
                 dispatch_async(dispatch_get_main_queue(), ^{
                     NSURL *mp4 = [self _convert2Mp4:sourceURL];
                     BOOL isSendVideo = [self getVideoDuration:mp4];
                     if (!isSendVideo) {
                         [picker dismissViewControllerAnimated:YES completion:^{}];
                         return;
                     };
                     NSFileManager *fileman = [NSFileManager defaultManager];
                     if ([fileman fileExistsAtPath:newVideoUrl.path]) {
                         NSError *error = nil;
                         [fileman removeItemAtURL:newVideoUrl error:&error];
                         if (error) {
                             NSLog(@"failed to remove file, error:%@.", error);
                         }
                     }
                     [picker dismissViewControllerAnimated:YES completion:^{}];
                     [self sendVideoMessageWithURL:mp4];
                 });
             }
                 break;
             case AVAssetExportSessionStatusFailed:
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"AVAssetExportSessionStatusFailed");
                 break;
         }
         
     }];
}
//获取视频时间
- (BOOL)getVideoDuration:(NSURL*)URL
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:URL options:opts];
    NSInteger second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    if (second >10) {
        [LQProgressHud showMessage:@"视频最长只能10s"];
        [[NSFileManager defaultManager] removeItemAtPath:[URL path] error:nil];//取消之后就删除，以免占用手机硬盘空间（沙盒）
        return NO;
    }
    return YES;
}
#pragma mark - VPImageCropperDelegate
- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController{
    UIImagePickerController *picker = (UIImagePickerController *)cropperViewController.navigationController;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        [cropperViewController.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [cropperViewController.navigationController popViewControllerAnimated:YES];
    }
}
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage{
    
    [cropperViewController dismissViewControllerAnimated:YES completion:nil];
//    if (self.delegate) {
//        [self.delegate];
//    }
    [self sendImageMessage:editedImage];
}

#pragma mark - EaseMessageCellDelegate

- (void)messageCellSelected:(id<IMessageModel>)model withCell:(EaseMessageCell *)cell
{
    if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:didSelectMessageModel:)]) {
        BOOL flag = [_delegate messageViewController:self didSelectMessageModel:model];
        if (flag) {
            [self _sendHasReadResponseForMessages:@[model.message] isRead:YES];
            return;
        }
    }
    
    switch (model.bodyType) {
        case EMMessageBodyTypeImage:
        {
            _scrollToBottomWhenAppear = NO;
            [self _imageMessageCellSelected:model withCell:cell];
        }
            break;
        case EMMessageBodyTypeLocation:
        {
             [self _locationMessageCellSelected:model];
        }
            break;
        case EMMessageBodyTypeVoice:
        {
            [self _audioMessageCellSelected:model];
        }
            break;
        case EMMessageBodyTypeVideo:
        {
//            [self _videoMessageCellSelected:model];
             [self _imageMessageCellSelected:model withCell:cell];

        }
            break;
        case EMMessageBodyTypeFile:
        {
            _scrollToBottomWhenAppear = NO;
            [self showHint:@"Custom implementation!"];
        }
            break;
        default:{
            NSDictionary *ext = model.message.ext;
            if (ext[@"type"]) {
                NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
                if ([typeStr isEqualToString:@"baping"]) {
//                     [self _imageMessageCellSelected:model];
                    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.fileURLPath]];
                    UIImage *image = [UIImage imageWithData:data];
                    if (image){
                        [[EaseMessageReadManager defaultManager] showBrowserWithImages:@[image]];
                    }else{
//                        NSLog(@"Read %@ failed!", model.fileURLPath);
                    }
                }
            }
        }
            
            break;
    }
    
}

- (void)statusButtonSelcted:(id<IMessageModel>)model withMessageCell:(EaseMessageCell*)messageCell
{
    if ((model.messageStatus != EMMessageStatusFailed) && (model.messageStatus != EMMessageStatusPending))
    {
        return;
    }
    
    __weak typeof(self) weakself = self;
    [[[EMClient sharedClient] chatManager] resendMessage:model.message progress:nil completion:^(EMMessage *message, EMError *error) {
        if (!error) {
            [weakself _refreshAfterSentMessage:message];
        }
        else {
            [weakself.tableView reloadData];
        }
    }];
    
    [self.tableView reloadData];
}

- (void)avatarViewSelcted:(id<IMessageModel>)model
{
    if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:didSelectAvatarMessageModel:)]) {
        [_delegate messageViewController:self didSelectAvatarMessageModel:model];
        
        return;
    }
    
    _scrollToBottomWhenAppear = NO;
}

-(void)getUserName:(id<IMessageModel>)model
{
    if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:didLongPassSelectAvatarMessageModel:)]) {
        [_delegate messageViewController:self didLongPassSelectAvatarMessageModel:model];
        
        return;
    }
    
    _scrollToBottomWhenAppear = NO;
}

#pragma mark - EMChatToolbarDelegate

- (void)chatToolbarDidChangeFrameToHeight:(CGFloat)toHeight
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.tableView.frame;
//        rect.origin.y = self.tableView.frame.origin.y;
        rect.size.height = self.view.frame.size.height - toHeight - self.changeTableViewY;
        self.tableView.frame = rect;
    }];
    
    [self _scrollViewToBottom:NO];
}

- (void)inputTextViewWillBeginEditing:(EaseTextView *)inputTextView
{
    if (_menuController == nil) {
        _menuController = [UIMenuController sharedMenuController];
    }
    [_menuController setMenuItems:nil];
}

- (void)didSendText:(NSString *)text
{
    if (text && text.length > 0) {
        [self sendTextMessage:text];
        [self.atTargets removeAllObjects];
    }
}

- (BOOL)didInputAtInLocation:(NSUInteger)location
{
    if ([self.delegate respondsToSelector:@selector(messageViewController:selectAtTarget:)] && self.conversation.type == EMConversationTypeGroupChat) {
        location += 1;
        __weak typeof(self) weakSelf = self;
        [self.delegate messageViewController:self selectAtTarget:^(EaseAtTarget *target) {
            __strong EaseMessageViewController *strongSelf = weakSelf;
            if (strongSelf && target) {
                if ([target.userId length] || [target.nickname length]) {
                    [strongSelf.atTargets addObject:target];
                    NSString *insertStr = [NSString stringWithFormat:@"%@ ", target.nickname ? target.nickname : target.userId];
                    EaseChatToolbar *toolbar = (EaseChatToolbar*)strongSelf.chatToolbar;
                    NSMutableString *originStr = [toolbar.inputTextView.text mutableCopy];
                    NSUInteger insertLocation = location > originStr.length ? originStr.length : location;
                    [originStr insertString:insertStr atIndex:insertLocation];
                    toolbar.inputTextView.text = originStr;
                    toolbar.inputTextView.selectedRange = NSMakeRange(insertLocation + insertStr.length, 0);
                    [toolbar.inputTextView becomeFirstResponder];
                }
            }
            else if (strongSelf) {
                EaseChatToolbar *toolbar = (EaseChatToolbar*)strongSelf.chatToolbar;
                [toolbar.inputTextView becomeFirstResponder];
            }
        }];
        EaseChatToolbar *toolbar = (EaseChatToolbar*)self.chatToolbar;
        toolbar.inputTextView.text = [NSString stringWithFormat:@"%@@", toolbar.inputTextView.text];
        [toolbar.inputTextView resignFirstResponder];
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)didDeleteCharacterFromLocation:(NSUInteger)location
{
    EaseChatToolbar *toolbar = (EaseChatToolbar*)self.chatToolbar;
    if ([toolbar.inputTextView.text length] == location + 1) {
        //delete last character
        NSString *inputText = toolbar.inputTextView.text;
        NSRange range = [inputText rangeOfString:@"@" options:NSBackwardsSearch];
        if (range.location != NSNotFound) {
            if (location - range.location > 1) {
                NSString *sub = [inputText substringWithRange:NSMakeRange(range.location + 1, location - range.location - 1)];
                for (EaseAtTarget *target in self.atTargets) {
                    if ([sub isEqualToString:target.userId] || [sub isEqualToString:target.nickname]) {
                        inputText = range.location > 0 ? [inputText substringToIndex:range.location] : @"";
                        toolbar.inputTextView.text = inputText;
                        toolbar.inputTextView.selectedRange = NSMakeRange(inputText.length, 0);
                        [self.atTargets removeObject:target];
                        return YES;
                    }
                }
            }
        }
    }
    return NO;
}

- (void)didSendText:(NSString *)text withExt:(NSDictionary*)ext
{
    if ([ext objectForKey:EASEUI_EMOTION_DEFAULT_EXT]) {
        EaseEmotion *emotion = [ext objectForKey:EASEUI_EMOTION_DEFAULT_EXT];
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(emotionExtFormessageViewController:easeEmotion:)]) {
            NSDictionary *ext = [self.dataSource emotionExtFormessageViewController:self easeEmotion:emotion];
            [self sendTextMessage:emotion.emotionTitle withExt:ext];
        } else {
//            [self sendTextMessage:emotion.emotionTitle withExt:@{MESSAGE_ATTR_EXPRESSION_ID:emotion.emotionId,MESSAGE_ATTR_IS_BIG_EXPRESSION:@(YES)}];//发emoji
            [self sendTextMessage:emotion.emotionThumbnail withExt:@{MESSAGE_ATTR_EXPRESSION_ID:emotion.emotionId,MESSAGE_ATTR_IS_BIG_EXPRESSION:@(YES)}];
            
        }
        return;
    }
    if (text && text.length > 0) {
        [self sendTextMessage:text withExt:ext];
    }
}

- (void)didStartRecordingVoiceAction:(UIView *)recordView
{
    if ([self.delegate respondsToSelector:@selector(messageViewController:didSelectRecordView:withEvenType:)]) {
        [self.delegate messageViewController:self didSelectRecordView:recordView withEvenType:EaseRecordViewTypeTouchDown];
    } else {
        if ([self.recordView isKindOfClass:[EaseRecordView class]]) {
            [(EaseRecordView *)self.recordView recordButtonTouchDown];
        }
    }
    
    if ([self _canRecord]) {
        EaseRecordView *tmpView = (EaseRecordView *)recordView;
        tmpView.center = self.view.center;
        [self.view addSubview:tmpView];
        [self.view bringSubviewToFront:recordView];
        int x = arc4random() % 100000;
        NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
        NSString *fileName = [NSString stringWithFormat:@"%d%d",(int)time,x];
        
        [[EMCDDeviceManager sharedInstance] asyncStartRecordingWithFileName:fileName completion:^(NSError *error)
         {
             if (error) {
//                 NSLog(@"%@",NSEaseLocalizedString(@"message.startRecordFail", @"failure to start recording"));
             }
         }];
    }
}

- (void)didCancelRecordingVoiceAction:(UIView *)recordView
{
    [[EMCDDeviceManager sharedInstance] cancelCurrentRecording];
    if ([self.delegate respondsToSelector:@selector(messageViewController:didSelectRecordView:withEvenType:)]) {
        [self.delegate messageViewController:self didSelectRecordView:recordView withEvenType:EaseRecordViewTypeTouchUpOutside];
    } else {
        if ([self.recordView isKindOfClass:[EaseRecordView class]]) {
            [(EaseRecordView *)self.recordView recordButtonTouchUpOutside];
        }
        [self.recordView removeFromSuperview];
    }
}

- (void)didFinishRecoingVoiceAction:(UIView *)recordView
{
    if ([self.delegate respondsToSelector:@selector(messageViewController:didSelectRecordView:withEvenType:)]) {
        [self.delegate messageViewController:self didSelectRecordView:recordView withEvenType:EaseRecordViewTypeTouchUpInside];
    } else {
        if ([self.recordView isKindOfClass:[EaseRecordView class]]) {
            [(EaseRecordView *)self.recordView recordButtonTouchUpInside];
        }
        [self.recordView removeFromSuperview];
    }
    __weak typeof(self) weakSelf = self;
    [[EMCDDeviceManager sharedInstance] asyncStopRecordingWithCompletion:^(NSString *recordPath, NSInteger aDuration, NSError *error) {
        if (!error) {
            [weakSelf sendVoiceMessageWithLocalPath:recordPath duration:aDuration];
        }
        else {
            [weakSelf showHudInView:self.view hint:error.domain];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf hideHud];
            });
        }
    }];
}

- (void)didDragInsideAction:(UIView *)recordView
{
    if ([self.delegate respondsToSelector:@selector(messageViewController:didSelectRecordView:withEvenType:)]) {
        [self.delegate messageViewController:self didSelectRecordView:recordView withEvenType:EaseRecordViewTypeDragInside];
    } else {
        if ([self.recordView isKindOfClass:[EaseRecordView class]]) {
            [(EaseRecordView *)self.recordView recordButtonDragInside];
        }
    }
}

- (void)didDragOutsideAction:(UIView *)recordView
{
    if ([self.delegate respondsToSelector:@selector(messageViewController:didSelectRecordView:withEvenType:)]) {
        [self.delegate messageViewController:self didSelectRecordView:recordView withEvenType:EaseRecordViewTypeDragOutside];
    } else {
        if ([self.recordView isKindOfClass:[EaseRecordView class]]) {
            [(EaseRecordView *)self.recordView recordButtonDragOutside];
        }
    }
}

#pragma mark - EaseChatBarMoreViewDelegate

- (void)moreView:(EaseChatBarMoreView *)moreView didItemInMoreViewAtIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(messageViewController:didSelectMoreView:AtIndex:)]) {
        [self.delegate messageViewController:self didSelectMoreView:moreView AtIndex:index];
        return;
    }
}

- (void)moreViewPhotoAction:(EaseChatBarMoreView *)moreView
{
    // Hide the keyboard
    [self.chatToolbar endEditing:YES];
    /*
    // Pop image picker
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
    */
    [self pushImagePickerController];
    
    self.isViewDidAppear = NO;
    [[EaseSDKHelper shareHelper] setIsShowingimagePicker:YES];
}

- (void)moreViewTakePicAction:(EaseChatBarMoreView *)moreView
{
    // Hide the keyboard
    [self.chatToolbar endEditing:YES];

#if TARGET_IPHONE_SIMULATOR
    [self showHint:NSEaseLocalizedString(@"message.simulatorNotSupportCamera", @"simulator does not support taking picture")];
#elif TARGET_OS_IPHONE
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage ];
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
    
    self.isViewDidAppear = NO;
    [[EaseSDKHelper shareHelper] setIsShowingimagePicker:YES];
#endif
}

- (void)moreViewLocationAction:(EaseChatBarMoreView *)moreView
{
    // Hide the keyboard
    [self.chatToolbar endEditing:YES];
    
    EaseLocationViewController *locationController = [[EaseLocationViewController alloc] init];
    locationController.delegate = self;
    [self.navigationController pushViewController:locationController animated:YES];
}

- (void)moreViewAudioCallAction:(EaseChatBarMoreView *)moreView
{
    // Hide the keyboard
    [self.chatToolbar endEditing:YES];
    
    NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"realTimeCall"];
    [ext setObject:self.personalModel.nickName forKey:@"nickname"];
    [ext setObject:self.personalModel.headIcon forKey:@"avatarURLPath"];

    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_CALL object:@{@"chatter":self.conversation.conversationId, @"type":[NSNumber numberWithInt:0],@"ext":ext}];
}

- (void)moreViewVideoCallAction:(EaseChatBarMoreView *)moreView
{
    // Hide the keyboard
    [self.chatToolbar endEditing:YES];
    NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithObject:@"YES" forKey:@"realTimeCall"];
    [ext setObject:self.personalModel.nickName forKey:@"nickname"];
    [ext setObject:self.personalModel.headIcon forKey:@"avatarURLPath"];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_CALL object:@{@"chatter":self.conversation.conversationId, @"type":[NSNumber numberWithInt:1],@"ext":ext}];
}

#pragma mark - EMLocationViewDelegate

-(void)sendLocationLatitude:(double)latitude
                  longitude:(double)longitude
                 andAddress:(NSString *)address
{
    [self sendLocationMessageLatitude:latitude longitude:longitude andAddress:address];
}

#pragma mark - Hyphenate

#pragma mark - EMChatManagerDelegate
- (void)didReceiveMessages:(NSArray *)aMessages
{
    for (EMMessage *message in aMessages) {
        if ([self.conversation.conversationId isEqualToString:message.conversationId]) {
            BOOL isSave = YES;
            if ([_delegate respondsToSelector:@selector(messageViewController:didReceiveMessage:)]) {   //2017.10.28
                 isSave = [_delegate messageViewController:self didReceiveMessage:message];
            }
            NSDictionary *ext = message.ext;
            NSNumber *nub =  ext[@"type"];
            if (nub.integerValue == 1) {

                self.groupModel.roomHeadIcon = ext[@"groupAvaterURLPath"];
                self.groupModel.roomName = ext[@"groupNickName"];
            }

            [self addMessageToDataSource:message progress:nil];

            [self _sendHasReadResponseForMessages:@[message]
                                           isRead:NO];
            
            
            if ([self _shouldMarkMessageAsRead])
            {
                [self.conversation markMessageAsReadWithId:message.messageId error:nil];
            }
            
            
        }
    }
}

- (void)didReceiveCmdMessages:(NSArray *)aCmdMessages
{
    for (EMMessage *message in aCmdMessages) {
        if ([self.conversation.conversationId isEqualToString:message.conversationId]) {
            [self showHint:NSEaseLocalizedString(@"receiveCmd", @"receive cmd message")];
            break;
        }
    }
}

- (void)didReceiveHasDeliveredAcks:(NSArray *)aMessages
{
    for(EMMessage *message in aMessages){
        [self _updateMessageStatus:message];
    }
}

- (void)didReceiveHasReadAcks:(NSArray *)aMessages
{
    for (EMMessage *message in aMessages) {
        if (![self.conversation.conversationId isEqualToString:message.conversationId]){
            continue;
        }
        
        __block id<IMessageModel> model = nil;
        __block BOOL isHave = NO;
        [self.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             if ([obj conformsToProtocol:@protocol(IMessageModel)])
             {
                 model = (id<IMessageModel>)obj;
                 if ([model.messageId isEqualToString:message.messageId])
                 {
                     model.message.isReadAcked = YES;
                     isHave = YES;
                     *stop = YES;
                 }
             }
         }];
        
        if(!isHave){
            return;
        }
        
        if (_delegate && [_delegate respondsToSelector:@selector(messageViewController:didReceiveHasReadAckForModel:)]) {
            [_delegate messageViewController:self didReceiveHasReadAckForModel:model];
        }
        else{
            [self.tableView reloadData];
        }
    }
}

- (void)didMessageStatusChanged:(EMMessage *)aMessage
                          error:(EMError *)aError;
{
    [self _updateMessageStatus:aMessage];
}

- (void)didMessageAttachmentsStatusChanged:(EMMessage *)message
                                     error:(EMError *)error{
    if (!error) {
        EMFileMessageBody *fileBody = (EMFileMessageBody*)[message body];
        if ([fileBody type] == EMMessageBodyTypeImage) {
            EMImageMessageBody *imageBody = (EMImageMessageBody *)fileBody;
            if ([imageBody thumbnailDownloadStatus] == EMDownloadStatusSuccessed)
            {
                [self _reloadTableViewDataWithMessage:message];
            }
        }else if([fileBody type] == EMMessageBodyTypeVideo){
            EMVideoMessageBody *videoBody = (EMVideoMessageBody *)fileBody;
            if ([videoBody thumbnailDownloadStatus] == EMDownloadStatusSuccessed)
            {
                [self _reloadTableViewDataWithMessage:message];
            }
        }else if([fileBody type] == EMMessageBodyTypeVoice){
            if ([fileBody downloadStatus] == EMDownloadStatusSuccessed)
            {
                [self _reloadTableViewDataWithMessage:message];
            }
        }
        
    }else{
        
    }
}

#pragma mark - EMCDDeviceManagerProximitySensorDelegate

- (void)proximitySensorChanged:(BOOL)isCloseToUser
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if (isCloseToUser)
    {
        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    } else {
        [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        if (self.playingVoiceModel == nil) {
            [[EMCDDeviceManager sharedInstance] disableProximitySensor];
        }
    }
    [audioSession setActive:YES error:nil];
}

#pragma mark - action

- (void)copyMenuAction:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (self.menuIndexPath && self.menuIndexPath.row > 0) {
        id<IMessageModel> model = [self.dataArray objectAtIndex:self.menuIndexPath.row];
        pasteboard.string = model.text;
    }
    
    self.menuIndexPath = nil;
}

- (void)deleteMenuAction:(id)sender
{
    if (self.menuIndexPath && self.menuIndexPath.row > 0) {
        id<IMessageModel> model = [self.dataArray objectAtIndex:self.menuIndexPath.row];
        NSMutableIndexSet *indexs = [NSMutableIndexSet indexSetWithIndex:self.menuIndexPath.row];
        NSMutableArray *indexPaths = [NSMutableArray arrayWithObjects:self.menuIndexPath, nil];
        
        [self.conversation deleteMessageWithId:model.message.messageId error:nil];
        [self.messsagesSource removeObject:model.message];
        
        if (self.menuIndexPath.row - 1 >= 0) {
            id nextMessage = nil;
            id prevMessage = [self.dataArray objectAtIndex:(self.menuIndexPath.row - 1)];
            if (self.menuIndexPath.row + 1 < [self.dataArray count]) {
                nextMessage = [self.dataArray objectAtIndex:(self.menuIndexPath.row + 1)];
            }
            if ((!nextMessage || [nextMessage isKindOfClass:[NSString class]]) && [prevMessage isKindOfClass:[NSString class]]) {
                [indexs addIndex:self.menuIndexPath.row - 1];
                [indexPaths addObject:[NSIndexPath indexPathForRow:(self.menuIndexPath.row - 1) inSection:0]];
            }
        }
        
        [self.dataArray removeObjectsAtIndexes:indexs];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
    
    self.menuIndexPath = nil;
}

#pragma mark - public 

- (NSArray *)formatMessages:(NSArray *)messages
{
    NSMutableArray *formattedArray = [[NSMutableArray alloc] init];
    if ([messages count] == 0) {
        return formattedArray;
    }
    
    for (EMMessage *message in messages) {
        //Calculate time interval
        CGFloat interval = (self.messageTimeIntervalTag - message.timestamp) / 1000;
        if (self.messageTimeIntervalTag < 0 || interval > 60 || interval < -60) {
            NSDate *messageDate = [NSDate dateWithTimeIntervalInMilliSecondSince1970:(NSTimeInterval)message.timestamp];
            NSString *timeStr = @"";
            
            if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:stringForDate:)]) {
                timeStr = [_dataSource messageViewController:self stringForDate:messageDate];
            }
            else{
                timeStr = [messageDate formattedTime];
            }
            [formattedArray addObject:timeStr];
            self.messageTimeIntervalTag = message.timestamp;
        }
        
        //Construct message model
        id<IMessageModel> model = nil;
        if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:modelForMessage:)]) {
            model = [_dataSource messageViewController:self modelForMessage:message];
        }
        else{
            model = [[EaseMessageModel alloc] initWithMessage:message];
            model.avatarImage = [UIImage imageNamed:@"占位图"];
            model.failImageName = @"imageDownloadFail";
            model.avatarURLPath = message.ext[@"avatarURLPath"];
            model.nickname = message.ext[@"nickname"];
        }

        if (model) {
//            model = [[EaseMessageModel alloc] initWithMessage:message];
//            model.avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/user"];
//            model.failImageName = @"imageDownloadFail";
//            model.avatarURLPath = message.ext[@"avatarURLPath"];
//            model.nickname = message.ext[@"nickname"];
            [formattedArray addObject:model];
        }
    }
    
    return formattedArray;
}

-(void)addMessageToDataSource:(EMMessage *)message
                     progress:(id)progress
{
    [self.messsagesSource addObject:message];
    
     __weak EaseMessageViewController *weakSelf = self;
    dispatch_async(_messageQueue, ^{
        NSArray *messages = [weakSelf formatMessages:@[message]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.dataArray addObjectsFromArray:messages];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[weakSelf.dataArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        });
    });
}

#pragma mark - public

- (void)tableViewDidTriggerHeaderRefresh
{
    self.messageTimeIntervalTag = -1;
    NSString *messageId = nil;
    if ([self.messsagesSource count] > 0) {
        messageId = [(EMMessage *)self.messsagesSource.firstObject messageId];
    }
    else {
        messageId = nil;
    }
    [self _loadMessagesBefore:messageId count:self.messageCountOfPage append:YES];
    
    [self tableViewDidFinishTriggerHeader:YES reload:YES];
}

#pragma mark - send message

- (void)_refreshAfterSentMessage:(EMMessage*)aMessage
{
    if ([self.messsagesSource count] && [EMClient sharedClient].options.sortMessageByServerTime) {
        NSString *msgId = aMessage.messageId;
        EMMessage *last = self.messsagesSource.lastObject;
        if ([last isKindOfClass:[EMMessage class]]) {
            
            __block NSUInteger index = NSNotFound;
            index = NSNotFound;
            [self.messsagesSource enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(EMMessage *obj, NSUInteger idx, BOOL *stop) {
                if ([obj isKindOfClass:[EMMessage class]] && [obj.messageId isEqualToString:msgId]) {
                    index = idx;
                    *stop = YES;
                }
            }];
            if (index != NSNotFound) {
                [self.messsagesSource removeObjectAtIndex:index];
                [self.messsagesSource addObject:aMessage];
                
                //格式化消息
                self.messageTimeIntervalTag = -1;
                NSArray *formattedMessages = [self formatMessages:self.messsagesSource];
                [self.dataArray removeAllObjects];
                [self.dataArray addObjectsFromArray:formattedMessages];
                [self.tableView reloadData];
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                return;
            }
        }
    }
    [self.tableView reloadData];
}
- (void)setGroupModel:(MY_GLClubModel *)groupModel{
    _groupModel = groupModel;
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    if (self.groupModel) {
        if (self.groupModel.roomHeadIcon.length) { // 俱乐部的头像
            [dic setObject:self.groupModel.roomHeadIcon forKey:@"groupAvaterURLPath"];
        }
        if (self.groupModel.roomName.length) {// 俱乐部的昵称
            [dic setObject:self.groupModel.roomName forKey:@"groupNickName"];
        }
        if(self.groupModel.roomId.intValue){
            [dic setObject:self.groupModel.roomId forKey:@"roomId"];
        }
    }
    _conversation.ext = dic;
}
- (void)_sendMessage:(EMMessage *)message
{
    __weak typeof(self) weakself = self;

    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:message.ext];
//    if (self.personalModel) {
//       EMConversation *conv =  [[EMClient sharedClient].chatManager getConversation:message.conversationId type:EMConversationTypeChat createIfNotExist:YES];
//        if (conv.unreadMessagesCount == 2) {
//             [dic setObject:@"type" forKey:@"9"];
//        }
//    }
    if (_nickName.length ) {
        [dic setObject:_nickName forKey:@"nickname"];
    }
    if (self.personalModel.secretStatus.integerValue ==1 ) {
         [dic setObject:self.personalModel.secretIcon forKey:@"avatarURLPath"];
    }else{
        if (_headIcon.length > 0) {
            [dic setObject:_headIcon forKey:@"avatarURLPath"];
        }else{
            if (self.personalModel.secretIcon) {
                [dic setObject:self.personalModel.secretIcon forKey:@"avatarURLPath"];
            }
        }
    }
    if (_locationAddress.length >0) {
        [dic setObject:_locationAddress forKey:@"userLocation"];
    }
    if (_longitude.length > 0) {
        [dic setObject:_longitude forKey:@"userLongitude"];
    }else{
        _longitude = DEFAULT_LONGITUDE;
        [dic setObject:_longitude forKey:@"userLongitude"];
    }
    if (_latitude.length > 0) {
        [dic setObject:_latitude forKey:@"userLatitude"];
    }else{
        _latitude = DEFAULT_LATITUDE;
        [dic setObject:_latitude forKey:@"userLatitude"];
    }
    [dic setObject:@(isNoble) forKey:@"noble"];
    [dic setObject:@(self.personalModel.sex) forKey:@"sex"];

    [dic setObject:@(isAuthen) forKey:@"addV"];
    [dic setObject:@(self.personalModel.isVideoVerify) forKey:@"isVideoVerify"];
    
    if (_myVip >= 0) {
        [dic setObject:@(_myVip) forKey:@"myVip"];
    }
    if (self.groupModel) {
        if (self.groupModel.roomHeadIcon.length) { // 俱乐部的头像
            [dic setObject:self.groupModel.roomHeadIcon forKey:@"groupAvaterURLPath"];
        }
        if (self.groupModel.roomName.length) {// 俱乐部的昵称
            [dic setObject:self.groupModel.roomName forKey:@"groupNickName"];
        }
        if(self.groupModel.roomId.intValue){
            [dic setObject:self.groupModel.roomId forKey:@"roomId"];
        }
    }
    message.ext = dic;
    
    if (self.conversation.type == EMConversationTypeGroupChat){
        message.chatType = EMChatTypeGroupChat;
    }
    else if (self.conversation.type == EMConversationTypeChatRoom){
        message.chatType = EMChatTypeChatRoom;
    }else{
        message.chatType = EMChatTypeChat;
    }
    BOOL iscanSend = NO;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(messageViewControllerSendMessages:ForMessage:)]) {
         iscanSend = [self.dataSource messageViewControllerSendMessages:self ForMessage:message];
    }
    if (iscanSend) return;
    [self addMessageToDataSource:message
                        progress:nil];
    
    [[EMClient sharedClient].chatManager sendMessage:message progress:^(int progress) {
        if (weakself.dataSource && [weakself.dataSource respondsToSelector:@selector(messageViewController:updateProgress:messageModel:messageBody:)]) {
            [weakself.dataSource messageViewController:weakself updateProgress:progress messageModel:nil messageBody:message.body];
        }
    } completion:^(EMMessage *aMessage, EMError *aError) {
        if (!aError) {
            [weakself _refreshAfterSentMessage:aMessage];
           
            
//            [weakself _refreshAfterSentMessage:aMessage];
            
            id<IMessageModel> model = [_dataSource messageViewController:self modelForMessage:aMessage];

            NSString * text = model.text;
            if (message.chatType == EMChatTypeChat) {
                [self insertNobleFirstMessage:message];
            }
            if (text && message.chatType == EMChatTypeChat) {
//  NSNotFound可以按照字面意思理解：没有找到
                BOOL QQ = [text rangeOfString:@"QQ"].location == NSNotFound ? NO : YES;
                BOOL qq = [text rangeOfString:@"qq"].location == NSNotFound ? NO : YES;
               
                BOOL Alipay = [text rangeOfString:@"支付宝"].location == NSNotFound ? NO : YES;
                if (QQ || qq  || Alipay) {
                    [self monitoringKeywordWithMessage:aMessage messageText:@"温馨提示：请在MOYO内部完成交易，以免资金被骗哦！发现线下交易，请及时向官方举报"];
                }
                 //涉及到微信   VX
                BOOL weiChat = [text rangeOfString:@"微信"].location == NSNotFound ? NO : YES;
                BOOL VX = [text rangeOfString:@"VX"].location == NSNotFound ? NO : YES;
                if (weiChat || VX) {
                    [self monitoringKeywordWithMessage:aMessage messageText:@"为了更好的维护MOYO用户的利益，请勿轻易的将微信给予他人，也勿在微信在交易，以防被骗！发现MOYO以外交易，请立即举报！"];
                }
                //涉及到 饭  饿  日料 烧烤 酒 玩 唱  歌 给予双方提示
                BOOL nic = [text rangeOfString:@"饭"].location == NSNotFound ? NO : YES;
                BOOL jf = [text rangeOfString:@"日料"].location == NSNotFound ? NO : YES;
                BOOL wine = [text rangeOfString:@"酒"].location == NSNotFound ? NO : YES;
//                BOOL p = [text rangeOfString:@"玩"].location == NSNotFound ? NO : YES;
                BOOL cg = [text rangeOfString:@"唱歌"].location == NSNotFound ? NO : YES;
                BOOL foodBool = nic || jf || wine || cg;
                if (self.personalModel.sex == 1 && foodBool) {
                    [self monitoringWordInsertMessage:aMessage messageText:@"想约她出去吃饭？试试发下黄金包，白金包，黑金包，放心发完以后不点击开启对方是接受不到的，别担心会放您鸽子哦"];
                }
            }
            
        }
        else {
            [weakself.tableView reloadData];
        }
    }];
}
- (void)insertNobleFirstMessage:(EMMessage *)message{
    EMConversation *conv =  [[EMClient sharedClient].chatManager getConversation:message.conversationId type:EMConversationTypeChat createIfNotExist:YES];
    [conv loadMessagesStartFromId:nil count:10 searchDirection:EMMessageSearchDirectionUp completion:^(NSArray *aMessages, EMError *aError) {
        if (aMessages.count == 1) {
            if (isNoble > 0 ) {
                EMMessage * messageNew = nil;
                EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"想约TA出来玩吗，发个邀请红包试试吧"];
                //                        NSString * from = message.from;
                //                        NSString * to = message.to;
                NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
                
                [ext setObject:@"9" forKey:@"type"];
                messageNew = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                messageNew.direction =EMMessageDirectionReceive;
                messageNew.chatType = EMChatTypeChat;
                messageNew.status = EMMessageStatusSucceed;//
//                [self addMessageToDataSource:messageNew progress:nil];//
                
                EMError * error = [[EMError alloc] init];//
                [conv insertMessage:messageNew error:&error];
                if (error) {
                    NSLog(@"error:-- %@",error);
                }
                [self insertMessageRefreshWithMessage:messageNew];
            }
            
            if (self.personalModel.sex) {
                NSInteger sex = self.model.sex;
                NSInteger isVideoVerify = self.model.isVideoVerify;
                if (!isVideoVerify && !sex) {
                    EMMessage * messageNew1 = nil;
                    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"该用户视频未认证，请谨慎发红包"];
                    //                        NSString * from = message.from;
                    //                        NSString * to = message.to;
                    NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
                    if (message.ext[@"noble"]) {
                         [ext setObject:message.ext[@"noble"] forKey:@"noble"];
                    }
                    [ext setObject:@"9" forKey:@"type"];
                    messageNew1 = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                    messageNew1.direction =EMMessageDirectionReceive;
                    messageNew1.chatType = EMChatTypeChat;
                    messageNew1.status = EMMessageStatusSucceed;//
                    EMError * error = [[EMError alloc] init];//
                    [conv insertMessage:messageNew1 error:&error];
                    
                    [self insertMessageRefreshWithMessage:messageNew1];
                }
            }else{
                NSInteger isVideoVerify = self.personalModel.isVideoVerify;
                if (!isVideoVerify) {
                    EMMessage * messageNew = nil;
                    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"您未视频认证，请尽快到个人中心进行视频认证"];
                    //                        NSString * from = message.from;
                    //                        NSString * to = message.to;
                    NSMutableDictionary *ext = [NSMutableDictionary dictionary];//
                    
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
                    [self insertMessageRefreshWithMessage:messageNew];
                }
            }
            
        }
            

    }];
}
- (void)sendTextMessage:(NSString *)text
{
    NSDictionary *ext = nil;
    if (self.conversation.type == EMConversationTypeGroupChat) {
        NSArray *targets = [self _searchAtTargets:text];
        if ([targets count]) {
            __block BOOL atAll = NO;
            [targets enumerateObjectsUsingBlock:^(NSString *target, NSUInteger idx, BOOL *stop) {
                if ([target compare:kGroupMessageAtAll options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                    atAll = YES;
                    *stop = YES;
                }
            }];
            if (atAll) {
                ext = @{kGroupMessageAtList: kGroupMessageAtAll};
            }
            else {
                ext = @{kGroupMessageAtList: targets};
            }
        }
    }
    [self sendTextMessage:text withExt:ext];
}

- (void)sendTextMessage:(NSString *)text withExt:(NSDictionary*)ext
{
    EMMessage *message = [EaseSDKHelper sendTextMessage:text
                                                   to:self.conversation.conversationId
                                          messageType:[self _messageTypeFromConversationType]
                                           messageExt:ext];

    [self _sendMessage:message];
}

- (void)sendLocationMessageLatitude:(double)latitude
                          longitude:(double)longitude
                         andAddress:(NSString *)address
{
    EMMessage *message = [EaseSDKHelper sendLocationMessageWithLatitude:latitude
                                                            longitude:longitude
                                                              address:address
                                                                   to:self.conversation.conversationId
                                                          messageType:[self _messageTypeFromConversationType]
                                                           messageExt:nil];
    [self _sendMessage:message];
}

- (void)sendImageMessageWithData:(NSData *)imageData
{
//    id progress = nil;
//    if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:progressDelegateForMessageBodyType:)]) {
//        progress = [_dataSource messageViewController:self progressDelegateForMessageBodyType:EMMessageBodyTypeImage];
//    }
//    else{
//        progress = self;
//    }
    
    EMMessage *message = [EaseSDKHelper sendImageMessageWithImageData:imageData
                                                                   to:self.conversation.conversationId
                                                          messageType:[self _messageTypeFromConversationType]
                                                           messageExt:nil];
    [self _sendMessage:message];
}

- (void)sendImageMessage:(UIImage *)image
{
//    id progress = nil;
//    if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:progressDelegateForMessageBodyType:)]) {
//        progress = [_dataSource messageViewController:self progressDelegateForMessageBodyType:EMMessageBodyTypeImage];
//    }
//    else{
//        progress = self;
//    }
    
    EMMessage *message = [EaseSDKHelper sendImageMessageWithImage:image
                                                             to:self.conversation.conversationId
                                                    messageType:[self _messageTypeFromConversationType]
                                                     messageExt:nil];
    [self _sendMessage:message];
}

- (void)sendVoiceMessageWithLocalPath:(NSString *)localPath
                             duration:(NSInteger)duration
{
    id progress = nil;
    if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:progressDelegateForMessageBodyType:)]) {
        progress = [_dataSource messageViewController:self progressDelegateForMessageBodyType:EMMessageBodyTypeVoice];
    }
    else{
        progress = self;
    }
    
    EMMessage *message = [EaseSDKHelper sendVoiceMessageWithLocalPath:localPath
                                                           duration:duration
                                                                 to:self.conversation.conversationId
                                                        messageType:[self _messageTypeFromConversationType]
                                                         messageExt:nil];
    [self _sendMessage:message];
}

- (void)sendVideoMessageWithURL:(NSURL *)url
{
    id progress = nil;
    if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:progressDelegateForMessageBodyType:)]) {
        progress = [_dataSource messageViewController:self progressDelegateForMessageBodyType:EMMessageBodyTypeVideo];
    }
    else{
        progress = self;
    }
    
    EMMessage *message = [EaseSDKHelper sendVideoMessageWithURL:url
                                                           to:self.conversation.conversationId
                                                  messageType:[self _messageTypeFromConversationType]
                                                   messageExt:nil];
    [self _sendMessage:message];
}

#pragma mark - notifycation
- (void)didBecomeActive
{
    self.dataArray = [[self formatMessages:self.messsagesSource] mutableCopy];
    [self.tableView reloadData];
    
    if (self.isViewDidAppear)
    {
        NSMutableArray *unreadMessages = [NSMutableArray array];
        for (EMMessage *message in self.messsagesSource)
        {
            if ([self shouldSendHasReadAckForMessage:message read:NO])
            {
                [unreadMessages addObject:message];
            }
        }
        if ([unreadMessages count])
        {
            [self _sendHasReadResponseForMessages:unreadMessages isRead:YES];
        }
        
        [_conversation markAllMessagesAsRead:nil];
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(messageViewControllerMarkAllMessagesAsRead:)]) {
            [self.dataSource messageViewControllerMarkAllMessagesAsRead:self];
        }
    }
}

- (void)hideImagePicker
{
    if (_imagePicker && [EaseSDKHelper shareHelper].isShowingimagePicker) {
        [_imagePicker dismissViewControllerAnimated:NO completion:nil];
    }
}

#pragma mark - private
- (void)_reloadTableViewDataWithMessage:(EMMessage *)message
{
    if ([self.conversation.conversationId isEqualToString:message.conversationId])
    {
        for (int i = 0; i < self.dataArray.count; i ++) {
            id object = [self.dataArray objectAtIndex:i];
            if ([object isKindOfClass:[EaseMessageModel class]]) {
                id<IMessageModel> model = object;
                if ([message.messageId isEqualToString:model.messageId]) {
                    id<IMessageModel> model = nil;
                    if (self.dataSource && [self.dataSource respondsToSelector:@selector(messageViewController:modelForMessage:)]) {
                        model.avatarURLPath = message.ext[@"avatarURLPath"];
                        model.nickname = message.ext[@"nickname"];
                        model = [self.dataSource messageViewController:self modelForMessage:message];
                        
                    }
                    else{
                        model = [[EaseMessageModel alloc] initWithMessage:message];
                        model.avatarImage = [UIImage imageNamed:@"占位图"];
                        model.failImageName = @"imageDownloadFail";
                        model.avatarURLPath = message.ext[@"avatarURLPath"];
                        model.nickname = message.ext[@"nickname"];
                    }
                    
                    [self.tableView beginUpdates];
                    [self.dataArray replaceObjectAtIndex:i withObject:model];
                    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
                    [self.tableView endUpdates];
                    break;
                }
            }
        }
    }
}

- (void)_updateMessageStatus:(EMMessage *)aMessage
{
    BOOL isChatting = [aMessage.conversationId isEqualToString:self.conversation.conversationId];
    if (aMessage && isChatting) {
        id<IMessageModel> model = nil;
        if (_dataSource && [_dataSource respondsToSelector:@selector(messageViewController:modelForMessage:)]) {
            model = [_dataSource messageViewController:self modelForMessage:aMessage];
        }
        else{
            model = [[EaseMessageModel alloc] initWithMessage:aMessage];
            model.avatarImage = [UIImage imageNamed:@"占位图"];
            model.failImageName = @"imageDownloadFail";
            model.avatarURLPath = aMessage.ext[@"avatarURLPath"];
            model.nickname = aMessage.ext[@"nickname"];
        }
        if (model) {
            __block NSUInteger index = NSNotFound;
            [self.dataArray enumerateObjectsUsingBlock:^(EaseMessageModel *model, NSUInteger idx, BOOL *stop){
                if ([model conformsToProtocol:@protocol(IMessageModel)]) {
                    if ([aMessage.messageId isEqualToString:model.message.messageId])
                    {
                        model.message.isDeliverAcked = YES;
                        index = idx;
                        *stop = YES;
                    }
                }
            }];
            
            if (index != NSNotFound)
            {
                [self.dataArray replaceObjectAtIndex:index withObject:model];
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
                [self.tableView endUpdates];
            }
        }
    }
}

- (NSArray*)_searchAtTargets:(NSString*)text
{
    NSMutableArray *targets = nil;
    if (text.length > 1) {
        targets = [NSMutableArray array];
        NSArray *splits = [text componentsSeparatedByString:@"@"];
        if ([splits count]) {
            for (NSString *split in splits) {
                if (split.length) {
                    NSString *atALl = NSEaseLocalizedString(@"group.atAll", @"all");
                    if (split.length >= atALl.length && [split compare:atALl options:NSCaseInsensitiveSearch range:NSMakeRange(0, atALl.length)] == NSOrderedSame) {
                        [targets removeAllObjects];
                        [targets addObject:kGroupMessageAtAll];
                        return targets;
                    }
                    for (EaseAtTarget *target in self.atTargets) {
                        if ([target.userId length]) {
                            if ([split hasPrefix:target.userId] || (target.nickname && [split hasPrefix:target.nickname])) {
                                [targets addObject:target.userId];
                                [self.atTargets removeObject:target];
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    return targets;
}

- (void)monitoringWordInsertMessage:(EMMessage *)oldMessage   messageText:(NSString*)messageStr{
//    EMConversation *conv =  [[EMClient sharedClient].chatManager getConversation:oldMessage.conversationId type:EMConversationTypeChat createIfNotExist:YES];
    EMMessage * messageNew = nil;
    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:messageStr];
    //                        NSString * from = message.from;
    //                        NSString * to = message.to;
    NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
    [ext setObject:@"9" forKey:@"type"];
    messageNew = [[EMMessage alloc] initWithConversationID:oldMessage.conversationId from:nil to:nil body:body ext:ext];
    messageNew.direction =EMMessageDirectionReceive;
    messageNew.chatType = EMChatTypeChat;
    messageNew.status = EMMessageStatusSucceed;//
    EMError * error = [[EMError alloc] init];//
    [self.conversation insertMessage:messageNew error:&error];
  
    if (error) {
        NSLog(@"error:-- %@",error);
    }
    [self insertMessageRefreshWithMessage:messageNew];
}
- (void)insertMessageRefreshWithMessage:(EMMessage *)messageNew{
    [self.messsagesSource addObject:messageNew];
    NSArray *formattedMessages = [self formatMessages:self.messsagesSource];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:formattedMessages];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.dataArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
//  聊天用户输入QQ或微信时
- (void)monitoringKeywordWithMessage:(EMMessage *)oldMessage   messageText:(NSString*)messageStr{
    
    NSString * userIdStr = oldMessage.to;
    
//    NSString * messageStr = [NSString stringWithFormat:@"温馨提示：请在V时代内部完成交易，以免资金被骗哦！发现线下交易，请及时向官方举报"];
    
    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:messageStr];
    NSString * from = [[EMClient sharedClient] currentUsername];
    
    NSDictionary * oldExt = oldMessage.ext;
     
    NSMutableDictionary * ext = [NSMutableDictionary dictionaryWithDictionary:oldExt];
    
    [ext setObject:@(9) forKey:@"type"];

//  生成message
    EMMessage * message = [[EMMessage alloc] initWithConversationID:userIdStr from:from to:userIdStr body:body ext:ext];
    message.chatType = EMChatTypeChat;  //  设置为单聊消息
    message.status = EMMessageStatusSucceed;
    
    [self addMessageToDataSource:message progress:nil];
    
    __weak typeof(self) weakself = self;
     [[EMClient sharedClient].chatManager sendMessage:message progress:^(int progress) {
     
     } completion:^(EMMessage *aMessage, EMError *aError) {
     
         if (!aError) {
             [weakself _refreshAfterSentMessage:aMessage];
        //     EMConversation * conversation = [[EMClient sharedClient].chatManager getConversation:aMessage.conversationId type:EMConversationTypeChat createIfNotExist:NO];
        //     
        //     [conversation deleteMessageWithId:aMessage.messageId error:nil];
         } else {
             [weakself.tableView reloadData];
         }
     }];
}


@end
