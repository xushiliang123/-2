#import "AppDelegate.h"
#import "AppDelegate+EaseMob.h"
#import "MBProgressHUD.h"
#import "ChatDemoHelper.h"
#import "MY_LYLoginViewController.h"
#import "MY_XTGuideViewController.h"// 广告页
#import "AppDelegate+EaseMobLlslog.h"

@interface AppDelegate (EaseMobLlslogLlslog)
- (void)easemobApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)easemobApplication:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)loginStateChange:(NSNotification *)notification llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)loginHuanXinWithModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)getPushOptionsWithModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)startAppLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
