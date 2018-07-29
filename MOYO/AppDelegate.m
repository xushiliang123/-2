//
//  AppDelegate.m
//  VTIME
//
//  Created by MadridLee on 2017/9/5.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "AppDelegate.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AdSupport/AdSupport.h>
#import "AppDelegate+EaseMob.h"
#import "MY_LYLoginViewController.h"
#import <WXApiObject.h>
#import "MY_XTGuideViewController.h"
#import "RootBaseViewController.h"

//系统通知
#import "MY_XTSystemInfoViewController.h"

//官方公告
#import "MY_TTLOfficialNoticeViewController.h"

//联系客服
#import "MY_LLCustomerServiceViewController.h"
#import "MY_GLEditMyInfoViewController.h"
#import "CounterMarkViewController.h"

//俱乐部通知
#import "MY_TTLClubNoticeViewController.h"


// 群聊
#import "MY_TTLClubChatViewController.h"


//model
#import "MY_LYPersonInfoModel.h"

@interface AppDelegate ()<JPUSHRegisterDelegate>
{
    RootBaseViewController * rootViewController;
    NSInteger _pushID;//双击Homde退出时，通过链接重新打开APP时openURL方法会调用，导致2次Push页面；
    
//    NSInteger _nowTime;
    NSTimeInterval _howLong;
}
@property (assign, nonatomic)NSTimeInterval  nowTime;

@property (assign, nonatomic)NSInteger count;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [TLHTTPRequest ];
    
    [self thirdMapParty];
    
    [self iqKeyBoard];
    
    //  环信
    [self easemobApplication:application
didFinishLaunchingWithOptions:launchOptions
                      appkey:HuanXinAppKey
                apnsCertName:HuanXinPushCer
                 otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
    
    /*  [self startApp];  此方法不写在这里 是因为 写在Appdelegate里面   [self easemobApplication:application
     didFinishLaunchingWithOptions:launchOptions
     appkey:HuanXinAppKey
     apnsCertName:HuanXinPushCer
     otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
     
     此方法之后 本地推送不走
     
     此方法之前 语音打不通
     */
    
//      [self startApp];
//    if (!USERKEY) {
    
    //  如果无值 则弹出  否则 不弹
    if (!UserObject(@"GUIDELAUNCHING")){
        
        // 这里判断是否第一次
        MY_XTGuideViewController *guideControl = [[MY_XTGuideViewController alloc]init];
        guideControl.isfirstLogin           = NO;
        BaseNavigationController *nav         = [[BaseNavigationController alloc]initWithRootViewController:guideControl];//为假表示没有文件，没有进入过主页
        [self.window.rootViewController presentViewController:nav animated:NO completion:nil];
        nav.navigationBar.hidden      = YES;
        UserSetObject(@"1", @"GUIDELAUNCHING");
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
//    }
    
    //  极光推送
    [self setJPUSHWithOptions:launchOptions];
    
    //  微信
    [WXApi registerApp:WXChatID];
    
    //URL跳转
    if ([USERID integerValue] > 0 ) {//&& [UserObject(UserName) length] > 0
        
//        MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
//        uModel.nickName
        NSURL *url = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
        if ([url.scheme isEqualToString:@"VTIME"]){
            if (url != nil) {
                [self pushSpecifiedViewCtrl:[NSString stringWithFormat:@"%@", url]];
            }
        }
    }
    

    return YES;
}

- (void)thirdMapParty{
    //  高德
    [AMapServices sharedServices].apiKey = GAOAMAPKEY;
}

-(void)iqKeyBoard
{
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]  setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:RGBCOLOR(51, 51, 51, 1.0)}];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTintColor:RGBCOLOR(51, 51, 51, 1.0)];
}

-(void)startApp{
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]  setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:RGBCOLOR(51, 51, 51, 1.0)}];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTintColor:RGBCOLOR(51, 51, 51, 1.0)];
    
//    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:[[TabBarController alloc]init]];
    
    self.window.rootViewController = [[TabBarController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    if (!USERKEY) {
        //
        ////        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        ////            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        ////            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        ////        }
        ////        else{
        ////            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
        ////        }
        ////
        ////        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        //            // 这里判断是否第一次
        MY_XTGuideViewController *guideControl = [[MY_XTGuideViewController alloc]init];
        guideControl.isfirstLogin           = YES;
        BaseNavigationController *nav         = [[BaseNavigationController alloc]initWithRootViewController:guideControl];//为假表示没有文件，没有进入过主页
        [self.window.rootViewController presentViewController:nav animated:NO completion:nil];        nav.navigationBar.hidden      = YES;
        ////        }
        //
        ////        else{
        ////            MY_TTLLoginViewController * loginVC = [MY_TTLLoginViewController new];
        ////            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        ////
        ////            [self.window.rootViewController presentViewController:nav animated:NO completion:nil];
        ////        }
        //
    }
    //
    //    if (USERKEY) {
    //        // 这里判断是否第一次
    //        MY_XTGuideViewController *guideControl = [[MY_XTGuideViewController alloc]init];
    //        guideControl.isfirstLogin           = NO;
    //        UINavigationController *nav         = [[UINavigationController alloc]initWithRootViewController:guideControl];//为假表示没有文件，没有进入过主页
    //        [self.window.rootViewController presentViewController:nav animated:NO completion:nil];
    //        nav.navigationBar.hidden      = YES;
    //    }
    
}

- (void)setJPUSHWithOptions:(NSDictionary *)launchOptions{
    
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    BOOL isProduction;
#if DEBUG
    isProduction = NO;
#else
    isProduction = YES;
#endif
    
    //  极光  如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchOptions appKey:JPUSH
                          channel:nil
                 apsForProduction:isProduction
            advertisingIdentifier:advertisingId];
    
    // 3.0.0及以后版本注册可以这样写，也可以继续用旧的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            
//            NSLog(@"registrationID获取成功：%@",registrationID);
        }
        else{
//            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
//    NSLog(@"失去活跃");
    
    if (!USERKEY) {

        NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
        NSInteger nowTime = [date timeIntervalSinceNow];
        _nowTime = nowTime;
        
//        NSLog(@" _nowTime ===，code：%d",_nowTime);
        
//        [[NSUserDefaults standardUserDefaults] setObject:@(_nowTime) forKey:@"time"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    [application setApplicationIconBadgeNumber:0];
    [JPUSHService setBadge:0];
    [application cancelAllLocalNotifications];
    [[EMClient sharedClient] applicationWillEnterForeground:application];
    

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    UserRemObject(@"GUIDELAUNCHING");
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    if (USERKEY) {
        NSLog(@"");
    }
    

}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

#pragma mark - 支付成功回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    if ([USERID integerValue] > 0 ) {//&& [UserObject(UserName) length] > 0

    if ([url.scheme isEqualToString:AlipayScheme]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic);
        }];
    }
    else if ([url.host isEqualToString:@"pay"]) {
        [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
    }else if ([url.host isEqualToString:@"platformId=wechat"]){
        
        BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
        return result;
    }
    }
    return YES;
}


// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    
    //这里判断是否发起的请求为微信支付，如果是的话，用WXApi的方法调起微信客户端的支付页面（://pay 之前的那串字符串就是你的APPID，）
    if ([USERID integerValue] > 0 ) {//&& [UserObject(UserName) length] > 0
        if ([url.scheme isEqualToString:@"VTIME"]){
            //        NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
            
            if (_pushID != 1) {
                [self pushSpecifiedViewCtrl:[NSString stringWithFormat:@"%@", url]];
            }else{
                _pushID = 0;
            }
        }else if ([url.scheme isEqualToString:AlipayScheme]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            
            NSLog(@"result = %@",resultDic);
        }];
    }
    else if ([url.host isEqualToString:@"pay"]) {
        [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
        
    }else if ([url.host isEqualToString:@"platformId=wechat"]){
        
        BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
        return result;
 
    }
    }
    return YES;
}



#pragma mark - JPush
//  注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

//    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
//    [JPUSHService registerDeviceToken:deviceToken];
}

//  实现注册APNs失败接口（可选）
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService handleRemoteNotification:userInfo];
    //    NSLog(@"iOS6及以下系统，收到通知:%@", [self logDic:userInfo]0);
    if (_mainController) {
        [_mainController jumpToChatList];
    }
    
    [self easemobApplication:application didReceiveRemoteNotification:userInfo];

    
    // 取得 APNs 标准信息内容
//    NSDictionary *aps = [userInfo valueForKey:@"aps"];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [JPUSHService handleRemoteNotification:userInfo];
    //    NSLog(@"iOS7及以上系统，收到通知:%@", [self logDic:userInfo]);
    completionHandler(UIBackgroundFetchResultNewData);

    // 取得 APNs 标准信息内容
    NSDictionary *aps = [userInfo valueForKey:@"aps"];
//    [self receiveSyetemNotification:userInfo];

    // 打印到日志 textView 中
//    NSLog(@"********** iOS7.0之后 background ********** %@",aps);
//    // 应用在前台 或者后台开启状态下，不跳转页面，让用户选择。
//    if (application.applicationState == UIApplicationStateActive || application.applicationState == UIApplicationStateBackground) {
//        NSLog(@"acitve or background");
//
//
//        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:userInfo[@"aps"][@"alert"][@"body"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"立即查看", nil];
//        [alertView show];
//    }
//    else//杀死状态下，直接跳转到跳转页面。
//    {
//
//        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:userInfo[@"aps"][@"alert"][@"body"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"App外推送立即查看", nil];
//        [alertView show];
////        [self.window  addSubview:nil];
//    }

}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
    
    if (_mainController) {
        [_mainController didReceiveLocalNotification:notification];
    }
}


#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
//        NSLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);

    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    
    
    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    [self easemobApplication:[UIApplication sharedApplication] didReceiveRemoteNotification:userInfo];
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    if (_mainController) {
        [_mainController didReceiveUserNotification:response.notification];
    }
    completionHandler();
}


- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
//        NSLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
//        [rootViewController addNotificationCount];
//        [self receiveSyetemNotification:userInfo];

    }
    else {
        // 判断为本地通知
//        NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    
//        [self receiveSyetemNotification:userInfo];
    
    }
    completionHandler();  // 系统要求执行这个方法
}
#endif

#pragma mark -- 通知、短信URL跳转
#pragma mark ## 判断极光和环信
- (void)receiveSyetemNotification:(NSDictionary *)userInfo {
    
    
//    TabBarController *tabVC = (TabBarController *)self.window.rootViewController;
//    UINavigationController *pushClassStance = (UINavigationController *)tabVC.viewControllers[0];
    _mainController.selectedIndex = 3;
    BaseNavigationController *pushClassStance = (BaseNavigationController *)_mainController.viewControllers[3];

    [pushClassStance popToRootViewControllerAnimated:YES];
    
    if (userInfo[@"ConversationChatter"]) {
        
        EMConversationType chatTp = (EMConversationType)[userInfo[@"MessageType"] integerValue];
        NSString* conversationID = userInfo[@"ConversationChatter"];
        
        EMConversation *conversation =  [[EMClient sharedClient].chatManager getConversation:conversationID type:chatTp createIfNotExist:YES];

        if (chatTp == EMConversationTypeChat) {
            
            ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:conversationID conversationType:chatTp];
            MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
            model.userId = [conversationID integerValue];
            model.userId = conversation.conversationId.integerValue;
            NSString * titleStr = userInfo[@"nickname"];
            NSString * avatarURLPath = userInfo[@"avatarURLPath"];
            
            
//            NSString * titleStr = conversation.ext[@"nickname"];
//            NSString * avatarURLPath = conversation.ext[@"avatarURLPath"];
            if (!titleStr) {
                titleStr = @"暂无昵称";
            }
            
            model.nickName = titleStr;
            model.headIcon = avatarURLPath;
            model.isNoble  =  [conversation.ext[@"noble"] integerValue];

            chatController.model = model;
//            [chatController setHidesBottomBarWhenPushed:YES];
            [pushClassStance pushViewController:chatController animated:YES];
            [conversation markAllMessagesAsRead:nil];
            
        }else if (chatTp == EMConversationTypeGroupChat){
            
            MY_GLClubModel * model = [[MY_GLClubModel alloc] init];
            model.roomId =  @([userInfo[@"roomId"] integerValue]);
            model.roomName = userInfo[@"groupNickName"];
//            model.roomHeadIcon = conversation.ext[@"groupAvaterURLPath"];
            model.roomGroupId = conversationID;
            model.location = userInfo[@"userLocation"];
            if (!model) {
                return;
            }

            
            MY_TTLClubChatViewController *clubChatVC = [[MY_TTLClubChatViewController alloc]initWithConversationChatter:conversationID conversationType:conversation.type];
            clubChatVC.groupModel = model;
//            clubChatVC.hidesBottomBarWhenPushed = YES;
            [pushClassStance pushViewController:clubChatVC animated:YES];
//            [conversation markAllMessagesAsRead:nil];

        }

    }

}

- (void)pushSpecifiedViewCtrl:(NSString *)urlString{
    
    _pushID = 1;
    TabBarController *tabVC = (TabBarController *)self.window.rootViewController;
    BaseNavigationController *pushClassStance = (BaseNavigationController *)tabVC.viewControllers[0];
    [pushClassStance popToRootViewControllerAnimated:YES];
    
    
    NSArray *subArray = [urlString componentsSeparatedByString:@"&"];
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:subArray.count];
    
    for (int j = 0 ; j < subArray.count; j++)
    {
        //在通过=拆分键和值
        NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
        //给字典加入元素
        
        if (dicArray.count>1) {
            [tempDic setObject:dicArray[1] forKey:dicArray[0]];
        }
    }
    

}


/* 以下代码都是垃圾袋   */
- (void)updateDatasdfds{
    [self loadDataaaa];
}
- (void)addHeadView{
    UIView *bgView = [[UIView  alloc]init];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 5, SCREEN_WIDTH, 40);
    searchBar.showsCancelButton = YES;
    searchBar.backgroundImage = [[UIImage alloc] init];

    searchBar.tintColor = [UIColor blueColor];
    searchBar.placeholder = @"搜索";
    [bgView addSubview:searchBar];
    //    // 修改按钮标题文字属性( 颜色, 大小, 字体)
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    //    // 修改标题文字
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:@"取消"];

}
- (void)setIsAddInstaller:(BOOL)isAddInstaller{
   
    if (isAddInstaller) {
        [self updateDatasdfds];
    }else{
        //         [self refreshTableView];
    }
//    [self loadData];
}
- (void)refreshTableView{
    MJRefreshStateHeader *cmphead = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        //        [self loadData];
    }];
    [cmphead setTitle:@"下拉加载！" forState:MJRefreshStateIdle];
    [cmphead setTitle:@"开始加载！" forState:MJRefreshStatePulling];
    [cmphead setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    cmphead.lastUpdatedTimeLabel.hidden = YES;
  
}
- (void)loadMoreData{
    
}
- (void)loadDataaaa{
    NSArray *dataArray;
    BOOL isAddInstaller;
    __weak typeof(self) WeakSelf= self;
    //     NSMutableArray *arry = [NSMutableArray array];
    __block NSMutableArray *arr0 = [NSMutableArray array];
    __block NSMutableArray *arr1 = [NSMutableArray array];
    __block NSMutableArray *arr2 = [NSMutableArray array];
    __block NSMutableArray *arr3 = [NSMutableArray array];
    
    if (isAddInstaller) {

            [dataArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj[@"is_sign"] integerValue] == 1) {
                    [arr0 addObject:obj];
                }else if ([obj[@"is_sign"] integerValue] == 2){
                    [arr1 addObject:obj];
                }else if ([obj[@"is_sign"] integerValue] == 4){
                    [arr2 addObject:obj];
                }
                
            }];
            if (arr0.count >0) {
                [arr3 addObject:arr0];
            }
            if (arr1.count>0){
                [arr3 addObject:arr1];
            }
            if (arr2.count>0){
                [arr3 addObject:arr2];
            }
            dataArray = arr3;

        
    }else{


        
    }
    
    //    self.dataArray = [NSArray arrayWithArray:arry];
}
- (CGFloat)htForFooterInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableVion:(NSInteger)section{
    NSArray *dataArray;
    if ([dataArray[section] isKindOfClass:[NSArray class]]) {
        return 30;
    }else{
        return 1;
    }
    
}

- (CGFloat)tableexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (NSInteger)numberOsInTableView:(UITableView *)tableView{
    NSArray *dataArray;
    if ([dataArray[0] isKindOfClass:[NSArray class]]) {
        return dataArray.count;
    }else{
        return 1;
    }
    
}

- (NSInteger)tableInSection:(NSInteger)section
{
    NSArray *dataArray;
    if ([dataArray[section] isKindOfClass:[NSArray class]]) {
        NSArray *arr = dataArray[section];
        return arr.count;
    }else{
        return dataArray.count;
    }
}

- (void)tableVieth:(NSIndexPath *)indexPath{
    NSDictionary  *dict;
    NSArray *dataArray;
    if ([dataArray[0] isKindOfClass:[NSArray class]]) {
        NSArray *arr = dataArray[indexPath.section];
        dict = arr[indexPath.row];
    }else{
        dict = dataArray[indexPath.row];
    }
    //    NSDictionary  *dict = self.dataArray[indexPath.row];
    MY_TTLNewPeopleGuideView *installerDetail = [[MY_TTLNewPeopleGuideView alloc] init];

    [self.window.rootViewController.navigationController pushViewController:installerDetail animated:NO];
}
- (NSString *)tableitleForHeaderInSection:(NSInteger)section{
    NSArray *dataArray;
    BOOL isAddInstaller;
    if ([dataArray[section] isKindOfClass:[NSArray class]] && isAddInstaller) {
        NSArray *arr = dataArray[section];
        NSDictionary *obj = arr[0];
        if ([obj[@"is_sign"] integerValue] == 1) {
            return @"签约等待确认";
        }else if ([obj[@"is_sign"] integerValue] == 2){
            return @"已完成签约";
        }else if ([obj[@"is_sign"] integerValue] == 4){
            return @"解约待确认";
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}
- (void)nextBtnClick:(UIButton*)sender{
    MY_TTLNewPeopleGuideView *addInstaller = [[MY_TTLNewPeopleGuideView alloc]init];
    [addInstaller show];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] > 20) {
        [LQProgressHud showMessage:@"搜索框字数不能超过20个字符！"];

    }
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //    NSLog(@"searchBarSearchButtonClicked-- %@",searchBar.text);
    BOOL isAddInstaller;
    if (isAddInstaller) {
        NSArray *arry;
        [arry enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSArray class]]) {
                [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj1, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (obj1[@"user_name"]) {
                       
                    }
                }];
            }else{
                if (obj[@"user_name"]) {
             
                }
            }
        }];
    }else{
        
    }
   
  
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarCancelButtonClicked-- %@",searchBar.text);


}
- (void)searchDataaaaa{
   
      NSMutableArray *searchData = [NSMutableArray array];

}



@end
