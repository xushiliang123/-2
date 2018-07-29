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


#import "AppDelegate+EaseMob.h"
#import "MBProgressHUD.h"
#import "ChatDemoHelper.h"
#import "MY_LYLoginViewController.h"

#import "MY_XTGuideViewController.h"// 广告页

//#import "MY_XTGuideViewController.h"
// 引入JPush功能所需头文件
//#import "JPUSHService.h"
/**
 *  本类中做了EaseMob初始化和推送等操作
 */

@implementation AppDelegate (EaseMob)

- (void)easemobApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig
{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNOTIFICATION_LOGINCHANGE
                                               object:nil];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL isHttpsOnly = [ud boolForKey:@"identifier_httpsonly"];
    
//    HOptions *option = [[HOptions alloc] init];
//    option.appkey = @"Your appkey"; //(必填项)
//    option.tenantId = @"Your tenantId";//(必填项)
//    //推送证书名字
//    option.apnsCertName = @"your apnsCerName";//(集成离线推送必填)
//    //Kefu SDK 初始化,初始化失败后将不能使用Kefu SDK
//    HError *initError = [[HChatClient sharedClient] initializeSDKWithOptions:option];
//        if (initError) { // 初始化错误
//    }
    
    //  注册sdk
    EMOptions *options = [EMOptions optionsWithAppkey:appkey];
    options.enableConsoleLog = YES;
    options.apnsCertName = apnsCertName;
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    [[EaseSDKHelper shareHelper] hyphenateApplication:application
                    didFinishLaunchingWithOptions:launchOptions
                                           appkey:appkey
                                     apnsCertName:apnsCertName
                                      otherConfig:@{
                                                    @"httpsOnly":[NSNumber numberWithBool:isHttpsOnly],
                                                    kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES],
                                                    @"easeSandBox":[NSNumber numberWithBool:YES]
                                                    }];
    
    [ChatDemoHelper shareHelper];
    

    //  是否自动登录
//    if (USERKEY) {
        BOOL isAutoLogin = [EMClient sharedClient].isAutoLogin;
        
        if (isAutoLogin){
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
        }
        else
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
        }
//    }
    [EMClient sharedClient].options.enableDeliveryAck = YES;

}

- (void)easemobApplication:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [[EaseSDKHelper shareHelper] hyphenateApplication:application didReceiveRemoteNotification:userInfo];
}

#pragma mark - App Delegate
// 将得到的deviceToken传给SDK
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[EMClient sharedClient] bindDeviceToken:deviceToken];
//        NSLog(@"error = %@",error);

    });
    [JPUSHService registerDeviceToken:deviceToken];
}

// 注册deviceToken失败，此处失败，与环信SDK无关，一般是您的环境配置或者证书配置有误
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"apns.failToRegisterApns", Fail to register apns)
                                                    message:error.description
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                                          otherButtonTitles:nil];
    [alert show];
}


#pragma mark - login changed

- (void)loginStateChange:(NSNotification *)notification
{
    BOOL loginSuccess = [notification.object boolValue];
    if (self.mainController == nil) {
        
        /*  [self startApp];  此方法写在这里 是因为 写在Appdelegate里面   [self easemobApplication:application
             didFinishLaunchingWithOptions:launchOptions
             appkey:HuanXinAppKey
             apnsCertName:HuanXinPushCer
             otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
         
         此方法之后 本地推送不走
         
         此方法之前 语音打不通
         */
        [self startApp];
    }else{
        self.mainController = (TabBarController *)self.window.rootViewController;
    }
    if (loginSuccess) {//登陆成功加载主窗口控制器
        //加载申请通知的数据
//        NSLog(@"mainController-- %@", self.mainController);
        [ChatDemoHelper shareHelper].mainVC = self.mainController;
        //
        [[ChatDemoHelper shareHelper] asyncGroupFromServer];
        [[ChatDemoHelper shareHelper] asyncConversationFromDB];
        [[ChatDemoHelper shareHelper] asyncPushOptions];
    }else{//登陆失败加载登陆页面控制器
        if ([self.window.rootViewController.class isSubclassOfClass:[TabBarController class]]) {
            EMError *error = [[EMClient sharedClient] logout:YES];
            //  重新登录环信
            if (USERID) {
                NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
                NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                MY_LYPersonInfoModel *userModel = arry.firstObject;
                [self loginHuanXinWithModel:userModel];
            }else{
            
                MY_LYLoginViewController * loginVC = [MY_LYLoginViewController new];
                BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
                [self.window.rootViewController presentViewController:nav animated:NO completion:nil];
            }
           
        }
//        self.mainController = nil;
//        [ChatDemoHelper shareHelper].mainVC = nil;
    }
}

#pragma mark - 登录环信
- (void)loginHuanXinWithModel:(MY_LYPersonInfoModel *)model {

    [[EMClient sharedClient] loginWithUsername:model.hxusername password:model.hxpassword completion:^(NSString *aUsername, EMError *aError) {
        if (!aError) {
            NSLog(@"登陆成功");
            [[EMClient sharedClient].options setIsAutoLogin:YES];

            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];

            [self getPushOptionsWithModel:model];
        } else {
            NSLog(@"登陆失败");
        }
    }];


}
//  修改推送昵称
- (void)getPushOptionsWithModel:(MY_LYPersonInfoModel *)model {
    BOOL isUpdate = NO;
    
    EMPushOptions *options = [[EMClient sharedClient] pushOptions];
    
    if (EMPushDisplayStyleMessageSummary != options.displayStyle) {
        options.displayStyle = EMPushDisplayStyleMessageSummary;
        isUpdate = YES;
    }
    
    if (model.nickName)
    {
        options.displayName = model.nickName;
        isUpdate = YES;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = nil;
        if (isUpdate) {
            error = [[EMClient sharedClient] updatePushOptionsToServer];
            
            NSLog(@"%@", error);
        }
    });
}


-(void)startApp{
    
    TabBarController * tabCtrl = [[TabBarController alloc]init];
    self.window.rootViewController = tabCtrl;
    self.window.backgroundColor = [UIColor whiteColor];
    self.mainController = tabCtrl;
    [self.window makeKeyAndVisible];
    
    if (!USERKEY) {
//        ALERT_SHOW(@"又弹启动页了", @"自动登录认证key", nil, nil, @"OK")

        MY_XTGuideViewController *guideControl = [[MY_XTGuideViewController alloc]init];
        guideControl.isfirstLogin           = YES;
        UINavigationController *nav         = [[UINavigationController alloc]initWithRootViewController:guideControl];//为假表示没有文件，没有进入过主页
        [self.window.rootViewController presentViewController:nav animated:NO completion:nil];
        nav.navigationBar.hidden      = YES;
        //        }
    }
    
}
#pragma mark - EMPushManagerDelegateDevice

// 打印收到的apns信息
-(void)didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:userInfo
                                                        options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *str =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"apns.content", @"Apns content")
                                                    message:str
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                                          otherButtonTitles:nil];
    [alert show];
}





@end
