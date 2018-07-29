//
//  TabBarController.m
//
//
//  Created by huangdl on 15-5-4.
//  Copyright (c) 2015年 liq. All rights reserved.
//

#import "TabBarController.h"
#import "TabBarItem.h"
#import "AppDelegate.h"

#import "MY_LYHomePageViewController.h"
#import "MY_TTLFindViewController.h"
#import "MY_LYDynamicViewController.h"
#import "MY_LLInfoController.h"
#import "MY_LYMyViewController.h"

#import "MY_GLFindRootViewController.h"

#import "MY_LYLoginViewController.h"

//  编辑过资料
#import "MY_GLEditMyInfoViewController.h"
//  标签
#import "CounterMarkViewController.h"
#import "MY_XTGuideViewController.h"

#import "MY_LLInfomationViewController.h"
#import "UserProfileManager.h"
#import "DemoCallManager.h"
#import "MY_LYMessageInfoModel.h"
//  成为贵族
#import "MY_GLBeGZViewController.h"
#import "MY_TTLMapCheckViewController.h"
#import "MY_LYTitlesViewController.h"
#import "MY_LLCustomerServiceViewController.h"

#import "MY_LLCreateClubsViewController.h"
#import "MY_LYTTPlayViewController.h"
//两次提示的默认间隔
static const CGFloat kDefaultPlaySoundInterval = 3.0;
static NSString *kMessageType = @"MessageType";
static NSString *kConversationChatter = @"ConversationChatter";
static NSString *kGroupName = @"GroupName";

//@interface TabBarController ()<UINavigationControllerDelegate, UITabBarControllerDelegate, UITabBarDelegate, EMCallManagerDelegate>{
//    UIImageView *_tabbar;
//}
//
//@property (nonatomic,strong)UIButton *button;
//
//@end

#if DEMO_CALL == 1
#import <Hyphenate/Hyphenate.h>

@interface TabBarController () <UINavigationControllerDelegate, UIAlertViewDelegate, EMCallManagerDelegate, UITabBarDelegate, UITabBarControllerDelegate>

#else
@interface TabBarController () <UINavigationControllerDelegate, UIAlertViewDelegate, UITabBarDelegate>
#endif
{
    MY_LLInfoController * _chatListVC;
    UIImageView *_tabbar;
    NSInteger pullNum;
}

@property (strong, nonatomic) NSDate *lastPlaySoundDate;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)BaseNavigationController *TTPlayV;
@end

@implementation TabBarController

+ (TabBarController *)shareInstance {
    static TabBarController *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}
- (BaseNavigationController *)MY_TTPlayV{
    if (nil == _TTPlayV) {
        MY_LYTTPlayViewController* playVc = [[MY_LYTTPlayViewController alloc]init];
        playVc.webURL =  [Utility getH5Url:PlayGameURL];
        playVc.strTitle = @"玩法攻略";
        BaseNavigationController *naVC = [[BaseNavigationController alloc] initWithRootViewController:playVc];
        
        // 防止返回根视图控制器，不走viewWillAppear
        naVC.delegate = self;
        //        BaseNavigationController *naVC = self.viewControllers[2];
        // 防止返回根视图控制器，不走viewWillAppear
        naVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        naVC.tabBarItem.image = [[UIImage imageNamed:@"starTabSel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        naVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"starTabSel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _TTPlayV = naVC;
    }
    return _TTPlayV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    pullNum = 0;
    //  自动登录时认证key
    if (USERKEY) {
        [self automaticLogin];
    }
    
    [self createView];
    
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout: UIRectEdgeNone];
    }
    
    self.title = NSLocalizedString(@"title.conversation", @"Conversations");
    
    //获取未读消息数，此时并没有把self注册为SDK的delegate，读取出的未读数是上次退出程序时的
    //    [self didUnreadMessagesCountChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUntreatedApplyCount) name:@"setupUntreatedApplyCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUnreadMessageCount) name:@"setupUnreadMessageCount" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setIsForbiddenForTab) name:KNoticationIsForbidden object:nil];
    [self setupUnreadMessageCount];
//    [self setupUntreatedApplyCount];
#if DEMO_CALL == 1
    [[DemoCallManager sharedManager] setMainController:self];
#endif
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([Utility isAuditEnvironment]) {
        _button.hidden = YES;
        BaseNavigationController *naVC = self.viewControllers[2];
        
        naVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        naVC.tabBarItem.image = [[UIImage imageNamed:@"starTabSel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        naVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"starTabSel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }else{
        _button.hidden = NO;
    }
}
#pragma mark - createView
-(void)createView{
    
//    UIImageView *backImgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, .5)];
//    [self.tabBar insertSubview:backImgv atIndex:0];
    self.tabBarController.tabBar.opaque = YES;
    [self.tabBarController.tabBar setTintColor:[Utility colorWithHexString:@"ffffff" alpha:1]];
    [[UITabBar appearance] setBarTintColor:[Utility colorWithHexString:@"ffffff" alpha:1]];
    [UITabBar appearance].translucent = NO;
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[Utility colorWithHexString:@"272729" alpha:1]} forState:UIControlStateNormal];

    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[Utility colorWithHexString:@"272729" alpha:1]} forState:UIControlStateSelected];
    
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabBarBackgroundImage.png"]];
    [self setUpAllViewControlller];
    [self setup];

}

//  添加突出按钮
-(void)setup
{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"goldenRose"]];
    self.delegate=self;
}
// addCenterButton
-(void) addCenterButtonWithImage:(UIImage*)buttonImage{
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    //  设定button大小为适应图片
    CGFloat W = buttonImage.size.width;
    CGFloat H = buttonImage.size.height;
    _button.frame = CGRectMake(self.tabBar.center.x - W/2, CGRectGetHeight(self.tabBar.bounds)-H, W, H);
    
    [_button setImage:buttonImage forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"goldenRoseSel"] forState:UIControlStateSelected];
    _button.adjustsImageWhenHighlighted=NO;
    [self.tabBar addSubview:_button];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_button removeFromSuperview];
        [self.tabBar addSubview:_button];
    });
   
}

- (void)setIsForbiddenForTab{
    [self setSelectedIndex:4];
    MY_LLCustomerServiceViewController* cusVc = [[MY_LLCustomerServiceViewController alloc]initWithConversationChatter:@"kefu1" conversationType:EMConversationTypeChat];
    cusVc.title = @"客服";
//    cusVc.hidesBottomBarWhenPushed = YES;
    [((BaseNavigationController *)self.selectedViewController) pushViewController:cusVc animated:YES];
}
-(void)setUpAllViewControlller
{
    MY_LYHomePageViewController *shou = [[MY_LYHomePageViewController alloc] init];
    shou.navigationController.title = @"首页";
//    shou.navigationController.delegate = self;
    shou.tabBarController.navigationController.delegate = self;
    [self setUpOneChildViewController:shou image:[UIImage imageNamed:@"home-page_gray"] selectImage:[[UIImage imageNamed:@"home-page_gold"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    MY_LYDynamicViewController *daVc = [[MY_LYDynamicViewController alloc] init];
    daVc.navigationController.title = @"动态";
    [self setUpOneChildViewController:daVc image:[UIImage imageNamed:@"main_btn_dynamic"] selectImage:[[UIImage imageNamed:@"main_btn_dynamic_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    MY_TTLFindViewController *comVc = [[MY_TTLFindViewController alloc] init];
    comVc.navigationController.title = @"发现";
    
    
//    MY_LYTTPlayViewController* playVc = [[MY_LYTTPlayViewController alloc]init];
//    //                            playVc.hidesBottomBarWhenPushed = YES;
//    playVc.webURL =  [Utility getH5Url:PlayGameURL];
//    playVc.strTitle = @"玩法攻略";
//
//    if ([Utility isAuditEnvironment]) {
//        [self setUpOneChildViewController:playVc image:[UIImage imageNamed:@"starTab"] selectImage:[[UIImage imageNamed:@"starTabSel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    }else{
        [self setUpOneChildViewController:comVc image:nil selectImage:nil];
//    }
    
 

    
    MY_LLInfoController *chatVc = [[MY_LLInfoController alloc] init];
    chatVc.navigationController.title = @"消息";
    _chatListVC = chatVc;
    [self setUpOneChildViewController:chatVc image:[UIImage imageNamed:@"chat_gray"] selectImage:[[UIImage imageNamed:@"chat_gold"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    MY_LYMyViewController *meVc = [[MY_LYMyViewController alloc] init];
    meVc.navigationController.title = @"我的";
    [self setUpOneChildViewController:meVc image:[UIImage imageNamed:@"mine_gray"]  selectImage:[UIImage imageNamed:@"mine_gold"]];
    
}

#pragma mark - Action
//中间按钮点击
-(void)pressChange:(UIButton*)sender{
    if ([Utility isAuditEnvironment]) {
        return;
    }
    sender.selected = YES;
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    if(uModel.available == 0)
    {
        self.selectedIndex=4;
        MY_GLBeGZViewController* noVc = [[MY_GLBeGZViewController alloc]init];
//        noVc.hidesBottomBarWhenPushed = YES;
        noVc.pullNum = [NSString stringWithFormat:@"%ld",uModel.pullNum];
        noVc.inviteNum = [NSString stringWithFormat:@"%ld",uModel.inviteNum];
        [((BaseNavigationController *)self.selectedViewController) pushViewController:noVc animated:YES];
//    }else if (!uModel.isNoble && ![uModel.inIndex integerValue]){
//        self.selectedIndex=4;
//        MY_TTLMapCheckViewController *mapCheckVC = [[MY_TTLMapCheckViewController alloc]init];
////        mapCheckVC.hidesBottomBarWhenPushed = YES;
//        [((BaseNavigationController *)self.selectedViewController) pushViewController:mapCheckVC animated:YES];
    }else if(uModel.isForbidden.integerValue == 1){
        self.selectedIndex=4;
        MY_LYTitlesViewController* tVc = [[MY_LYTitlesViewController alloc]init];
//        tVc.hidesBottomBarWhenPushed = YES;
        [((BaseNavigationController *)self.selectedViewController) pushViewController:tVc animated:YES];
    }else{
        self.selectedIndex=2;
        _button.selected=YES;
        
    }
 
  
}

// 添加一个子控制器的方法
- (void)setUpOneChildViewController:(UIViewController *)vController image:(UIImage *)image selectImage:(UIImage *)selectImage
{
    BaseNavigationController *naVC = [[BaseNavigationController alloc] initWithRootViewController:vController];
    
    // 防止返回根视图控制器，不走viewWillAppear
    naVC.delegate = self;
    // 调整图片的位置,代码的位置写在tabbar添加子导航控制器
    naVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    naVC.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naVC.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:naVC];
}


// 统计未读消息数
-(void)setupUnreadMessageCount
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSInteger unreadCount = 0;
    for (EMConversation *conversation in conversations) {
        if (conversation.type == EMConversationTypeChat) {
            unreadCount += conversation.unreadMessagesCount;
        }else if (conversation.type == EMConversationTypeGroupChat){
            // 世界频道的消息去除
            if (![conversation.conversationId isEqualToString: WorldChannelID]) {// 30514076516355
                unreadCount += conversation.unreadMessagesCount;
            }
        }
//        NSLog(@" WorldChannelID == %@, \n  conversationId == %@ -----------  %td",WorldChannelID,conversation.conversationId ,unreadCount);
    }
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:@(unreadCount) forKey:@"unreadCount"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"messageCount" object:nil userInfo:dict];
    
    UIApplication *application = [UIApplication sharedApplication];
    [application setApplicationIconBadgeNumber:unreadCount];
    
    if (unreadCount > 0) {
        [self.tabBar showBadgeOnItemIndex:2 badgeValue:(int)unreadCount];
    }
    else {
        [self.tabBar hideBadgeOnItemIndex:2];
    }
}


//- (void)setupUntreatedApplyCount
//{
//
//}

- (void)networkChanged:(EMConnectionState)connectionState
{
    _connectionState = connectionState;
    
    for (UIViewController * vc in _chatListVC.pageViewController.viewControllers) {
        
        if ([vc isKindOfClass:[MY_LLInfomationViewController class]]) {
            
            MY_LLInfomationViewController * infoVC = (MY_LLInfomationViewController *)vc;
            
            [infoVC networkChanged:connectionState];
        }
    }
}

- (void)playSoundAndVibration {
    
    NSTimeInterval timeInterval = [[NSDate date]
                                   timeIntervalSinceDate:self.lastPlaySoundDate];
    if (timeInterval < kDefaultPlaySoundInterval) {
        //如果距离上次响铃和震动时间太短, 则跳过响铃
        NSLog(@"skip ringing & vibration %@, %@", [NSDate date], self.lastPlaySoundDate);
        return;
    }
    
    //保存最后一次响铃时间
    self.lastPlaySoundDate = [NSDate date];
    
    NSInteger voice = [MYVOCIE integerValue];
    NSInteger shocks = [MYSHOCKS integerValue];
    
    if (!voice) {
//         收到消息时，播放音频
        [[EMCDDeviceManager sharedInstance] playNewMessageSound];
    }
    
    if (!shocks) {
        // 收到消息时，震动
        [[EMCDDeviceManager sharedInstance] playVibration];
    }
}

- (void)showNotificationWithMessage:(EMMessage *)message
{
    EMPushOptions *options = [[EMClient sharedClient] pushOptions];
    NSString *alertBody = nil;
    //    if (options.displayStyle == EMPushDisplayStyleMessageSummary) {
    EMMessageBody *messageBody = message.body;
    NSString *messageStr = nil;
    switch (messageBody.type) {
        case EMMessageBodyTypeText:
        {
            messageStr = ((EMTextMessageBody *)messageBody).text;
        }
            break;
        case EMMessageBodyTypeImage:
        {
            messageStr = NSLocalizedString(@"[图片]", @"Image");
        }
            break;
        case EMMessageBodyTypeLocation:
        {
            messageStr = NSLocalizedString(@"[定位]", @"Location");
        }
            break;
        case EMMessageBodyTypeVoice:
        {
            messageStr = NSLocalizedString(@"[语音]", @"Voice");
        }
            break;
        case EMMessageBodyTypeVideo:{
            messageStr = NSLocalizedString(@"[视频]", @"Video");
        }
            break;
        default:
            break;
    }
    
    do {
//        NSString *title = [[UserProfileManager sharedInstance] getNickNameWithUsername:message.from];
//        MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[message.from integerValue]];
        NSDictionary *dicExt = message.ext;
        NSString *title;
        NSString *messageType = message.from;
        if([messageType isEqualToString:VTaskM] || [messageType containsString:@"tingting"] || [messageType isEqualToString:@"kefu1"]){
            title = [Utility setNickNameWithConversationId:messageType];
        }else{
            title = dicExt[@"nickname"];
        }
        NSString *headIcon = dicExt[@"avatarURLPath"];

        if (message.chatType == EMChatTypeGroupChat) {
            NSDictionary *ext = message.ext;
            
            if (ext && ext[kGroupMessageAtList]) {
                id target = ext[kGroupMessageAtList];
                if ([target isKindOfClass:[NSString class]]) {
                    if ([kGroupMessageAtAll compare:target options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                        alertBody = [NSString stringWithFormat:@"%@%@", title, NSLocalizedString(@"group.atPushTitle", @" @ me in the group")];
                        break;
                    }
                }
                else if ([target isKindOfClass:[NSArray class]]) {
                    NSArray *atTargets = (NSArray*)target;
                    if ([atTargets containsObject:[EMClient sharedClient].currentUsername]) {
                        alertBody = [NSString stringWithFormat:@"%@%@", title, NSLocalizedString(@"group.atPushTitle", @" @ me in the group")];
                        break;
                    }
                }
            }
            
            NSArray *groupArray = [[EMClient sharedClient].groupManager getJoinedGroups];
//            for (EMGroup *group in groupArray) {
//                if ([group.groupId isEqualToString:message.conversationId]) {
            if (ext[@"groupNickName"]) {
                title = [NSString stringWithFormat:@"%@(%@)", title, ext[@"groupNickName"]];
            }else{
                 title = [NSString stringWithFormat:@"%@", title];
            }
//                    break;
//                }
//            }
        }
        else if (message.chatType == EMChatTypeChatRoom)
        {
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            NSString *key = [NSString stringWithFormat:@"OnceJoinedChatrooms_%@", [[EMClient sharedClient] currentUsername]];
            NSMutableDictionary *chatrooms = [NSMutableDictionary dictionaryWithDictionary:[ud objectForKey:key]];
            NSString *chatroomName = [chatrooms objectForKey:message.conversationId];
            if (chatroomName)
            {
                title = [NSString stringWithFormat:@"%@(%@)", title, chatroomName];
            }
        }else{
            
        }
        
        alertBody = [NSString stringWithFormat:@"%@:%@", title, messageStr];
    } while (0);
    //    }
    //    else{
    //        alertBody = NSLocalizedString(@"receiveMessage", @"you have a new message");
    //    }
    
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.lastPlaySoundDate];
    BOOL playSound = NO;
    if (!self.lastPlaySoundDate || timeInterval >= kDefaultPlaySoundInterval) {
        self.lastPlaySoundDate = [NSDate date];
        playSound = YES;
    }
//    NSLog(@"%@",message.ext);
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:[NSNumber numberWithInt:message.chatType] forKey:kMessageType];
    if (message.chatType == EMChatTypeGroupChat) {
        if (message.ext[@"userLocation"]) {
            [userInfo setObject:message.ext[@"userLocation"] forKey:@"userLocation"];
        }
        if (message.ext[@"roomId"]) {
            [userInfo setObject:message.ext[@"roomId"] forKey:@"roomId"];
        }
        
        if ([message.ext[@"roomId"] integerValue] == 0) {
            [userInfo setObject:@"世界频道" forKey:@"groupNickName"];
        }else{
            if (message.ext[@"groupNickName"]) {
                 [userInfo setObject:message.ext[@"groupNickName"] forKey:@"groupNickName"];
            }
           
        }
    }
    [userInfo setObject:message.conversationId forKey:kConversationChatter];
    if (message.ext[@"avatarURLPath"]) {
        [userInfo setObject:message.ext[@"avatarURLPath"] forKey:@"avatarURLPath"];
    }
    if(message.ext[@"nickname"]){
         [userInfo setObject:message.ext[@"nickname"] forKey:@"nickname"];
    }
    if(message.ext[@"noble"]){
        [userInfo setObject:message.ext[@"noble"] forKey:@"noble"];
    }

    //发送本地推送
    if (NSClassFromString(@"UNUserNotificationCenter")) {
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.01 repeats:NO];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        if (playSound) {
            content.sound = [UNNotificationSound defaultSound];
        }
//[[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:imgStr textFont: [UIFont systemFontOfSize:14]];
        content.body =alertBody;
        content.userInfo = userInfo;
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:message.messageId content:content trigger:trigger];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
    }
    else {
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate date]; //触发通知的时间
        notification.alertBody = alertBody;
        notification.alertAction = NSLocalizedString(@"open", @"Open");
        notification.timeZone = [NSTimeZone defaultTimeZone];
        if (playSound) {
            notification.soundName = UILocalNotificationDefaultSoundName;
        }
        notification.userInfo = userInfo;
        
        //发送通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

#pragma mark - 自动登录回调
- (void)willAutoReconnect{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSNumber *showreconnect = [ud objectForKey:@"identifier_showreconnect_enable"];
    if (showreconnect && [showreconnect boolValue]) {
        [self hideHud];
        [self showHint:NSLocalizedString(@"reconnection.ongoing", @"reconnecting...")];
    }
}

- (void)didAutoReconnectFinishedWithError:(NSError *)error{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSNumber *showreconnect = [ud objectForKey:@"identifier_showreconnect_enable"];
    if (showreconnect && [showreconnect boolValue]) {
        [self hideHud];
        if (error) {
            [self showHint:NSLocalizedString(@"reconnection.fail", @"reconnection failure, later will continue to reconnection")];
        }else{
            [self showHint:NSLocalizedString(@"reconnection.success", @"reconnection successful！")];
        }
    }
}


- (EMConversationType)conversationTypeFromMessageType:(EMChatType)type
{
    EMConversationType conversatinType = EMConversationTypeChat;
    switch (type) {
        case EMChatTypeChat:
            conversatinType = EMConversationTypeChat;
            break;
        case EMChatTypeGroupChat:
            conversatinType = EMConversationTypeGroupChat;
            break;
        case EMChatTypeChatRoom:
            conversatinType = EMConversationTypeChatRoom;
            break;
        default:
            break;
    }
    return conversatinType;
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
            if ([[data objectForKey:@"info"] objectForKey:@"key"]) {
                UserRemObject(Key);
                REMVERSION;
                NSString* strKey = [[data objectForKey:@"info"] objectForKey:@"key"];
                ADDUSERKEY(strKey);
                [[NSUserDefaults standardUserDefaults] synchronize];
                ADDVERSION(data[@"info"][@"iosVersion"]);
                //  存入等级数据到归档
//                MY_LLPersonInfoModel * model = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
                
                NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                MY_LYPersonInfoModel *model = arry.firstObject;
                
                model.iscreateClub = data[@"info"][@"iscreateClub"];
                model.secretIcon = data[@"info"][@"secretIcon"];
                model.available = [data[@"info"][@"available"] integerValue];
                model.isAuthen = [data[@"info"][@"isAuthen"] integerValue];
                model.isNoble = [data[@"info"][@"isNoble"] integerValue];
                model.isForbidden =  data[@"info"][@"isForbidden"];
                model.consumptionLevel = [data[@"info"][@"consumptionLevel"] integerValue];
  
//                [[MessageInfoModel sharedManager] insertModelWith:model];
                
                [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
                
                
//                [self updateUserInfoMethod:[data[@"info"][@"consumptionLevel"] integerValue]];
                [self  loginHuanXinServer];
                //  重新刷新首页
                [[NSNotificationCenter defaultCenter]postNotificationName:@"LoginSuccessHeaderRefreshing" object:nil];
               
                NSInteger isGotoVC = 0;
                
                //  没有编辑过资料
                if (0 == [data[@"info"][@"isEdit"] integerValue]) {
                    isGotoVC = 1;
                }
                //  没有标签
                if (0 == [data[@"info"][@"isSetTag"] integerValue]) {
                    if(1 == isGotoVC){
                        isGotoVC = 3;
                    }else{
                        isGotoVC = 2;
                    }
                }

                [self gotoVC:isGotoVC];
//                MY_XTGuideViewController *guideControl = [[MY_XTGuideViewController alloc]init];
//                guideControl.isEditInfo             = isGotoVC;
//                guideControl.isfirstLogin           = NO;
//                UINavigationController *nav         = [[UINavigationController alloc]initWithRootViewController:guideControl];
//                //为假表示没有文件，没有进入过主页
//                [self presentViewController:nav animated:NO completion:nil];
                //                    nav.navigationBar.hidden      = YES;
                
                if (![Utility isAuditEnvironment]) { // 正式服 环境
                    
                    if(model.available == 0 || model.isForbidden.integerValue == 1){
                        self.selectedIndex = 4;
                    }
                    if(0 == [data[@"info"][@"available"] integerValue]){
                        // 是否可查看首页 0 NO 1 YES
                        
                        self.selectedIndex = 4 ;
                        
//                        MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
                        model.pullNum = [data[@"info"][@"pullNum"] integerValue];
                        model.inviteNum = [data[@"info"][@"inviteNum"] integerValue];
//                        [[MessageInfoModel sharedManager] insertModelWith:uModel];
                         [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
                        //                    MY_GLBeGZViewController* noVc = [[MY_GLBeGZViewController alloc]init];
                        //
                        //                    UINavigationController * begzNav = [[UINavigationController alloc]initWithRootViewController:noVc];
                        //
                        //                    noVc.pullNum = data[@"info"][@"pullNum"];
                        //
                        //                    //                noVc.hidesBottomBarWhenPushed = YES;
                        //                    [self presentViewController:begzNav animated:YES completion:nil];
                        
                    }
                }else{
                    
//                    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
                    
                    model.available = 1;
                    model.isNoble = 1;
                    [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
                }
            } else {
            
                [Utility alertViewWithTitle:@"登录失败，请重新登录" withBlockCancle:^{
            
                } withBlockSure:^{
                    
                    UserRemObject(UserId);
                    UserRemObject(Key);
                    
                    EMError *error = [[EMClient sharedClient] logout:YES];
                    [self presentToLoginPage];
                } withBlock:^(UIAlertController *alertView) {
                    [self presentViewController:alertView animated:YES completion:nil];
                }];
            }
        }else{
            UserRemObject(UserId);
            UserRemObject(Key);
            [self presentToLoginPage];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        UserRemObject(UserId);
//        UserRemObject(Key);
        NSLog(@"%@",error.debugDescription);
        [LQProgressHud showMessage:@"网络异常!"];
//        self.view.window.rootViewController = [[LoginViewController alloc]init];
    }];
}
- (void)presentToLoginPage{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MY_LYLoginViewController * loginVC = [[MY_LYLoginViewController alloc]init];
    [window.rootViewController presentViewController:loginVC animated:NO completion:nil];
}


-(void)gotoVC:(NSInteger)tag{
    
    //  跳转编辑资料
    if (1 == tag || 3 == tag) {
        
        MY_GLEditMyInfoViewController * vc = [MY_GLEditMyInfoViewController new];
        vc.isEditInfo = tag;
        //        UINavigationController * begzNav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [((BaseNavigationController *)self.selectedViewController) pushViewController:vc animated:YES];
//        [self presentViewController:vc animated:YES completion:nil];
        
    }else if (2 == tag){
        // 跳转标签
        CounterMarkViewController * vc = [CounterMarkViewController new];
        //        UINavigationController * markNav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [((BaseNavigationController *)self.selectedViewController) pushViewController:vc animated:YES];
        //        [self presentViewController:markNav animated:YES completion:nil];
    }
    
//    else{
//        [self dismissViewControllerAnimated:YES completion:^{
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
//            [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationFirstComeHome" object:nil];
//        }];
//    }
    
}

#pragma mark - - 登录环信
- (void)loginHuanXinServer{
    BOOL isLogin = [[EMClient sharedClient] isLoggedIn];

    if (!isLogin) {
        NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *model = arry.firstObject;
//        MY_LLPersonInfoModel * model = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
        [[EMClient sharedClient] loginWithUsername:model.hxusername password:model.hxpassword completion:^(NSString *aUsername, EMError *aError) {
            if (!aError) {
                NSLog(@"登陆成功");
                 [[EMClient sharedClient].options setIsAutoLogin:YES];

                [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];

//                [self getPushOptionsWithModel:model];
            } else {
                NSLog(@"登陆环信失败");
            }
        }];
    }else{
         [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
    }
}


- (BOOL)tabBarController:(TabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
     if(viewController == [tabBarController.viewControllers objectAtIndex:0] || viewController == [tabBarController.viewControllers objectAtIndex:1] || viewController == [tabBarController.viewControllers objectAtIndex:2]
        || viewController == [tabBarController.viewControllers objectAtIndex:3])
     {
//         NSInteger *indexVC = [tabBarController.viewControllers indexOfObject:viewController];
         if(viewController != [tabBarController.viewControllers objectAtIndex:2]){
             _button.selected = NO;
         }
         NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
         NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
         MY_LYPersonInfoModel *uModel = arry.firstObject;
//         MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
         if(uModel.isForbidden.integerValue == 1)
         {
             MY_LYTitlesViewController* noVc = [[MY_LYTitlesViewController alloc]init];
//             noVc.hidesBottomBarWhenPushed = YES;
             [((BaseNavigationController *)tabBarController.selectedViewController) pushViewController:noVc animated:YES];
             return NO;
         }
         else if(uModel.available == 0)
         {
             MY_GLBeGZViewController* noVc = [[MY_GLBeGZViewController alloc]init];
//             noVc.hidesBottomBarWhenPushed = YES;
             noVc.pullNum = [NSString stringWithFormat:@"%ld",uModel.pullNum];
             noVc.inviteNum = [NSString stringWithFormat:@"%ld",uModel.inviteNum];
             [((BaseNavigationController *)tabBarController.selectedViewController) pushViewController:noVc animated:YES];
             return NO;
         }
         else
             return YES;
     }
     else{
         _button.selected = NO;
          return YES;
     }
    
}


//-(void)updateUserInfoMethod:(NSInteger)level{
//
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
//    uModel.consumptionLevel = level;
//    [[MessageInfoModel sharedManager] insertModelWith:uModel];

//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//            if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//
//                MY_LLPersonInfoModel * model = dataArray.firstObject;
//                model.consumptionLevel = level;
//
//                [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
    
                
//                [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//                    if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                        MY_LLPersonInfoModel * model = dataArray.firstObject;
//                        NSLog(@"%@",model);
//                    }
//                }];
//            }
//        }];
//    });
//}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
