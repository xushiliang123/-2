#import "AppDelegate+EaseMobLlslog.h"
@implementation AppDelegate (EaseMobLlslog)
- (void)easemobApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)easemobApplication:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loginStateChange:(NSNotification *)notification llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loginHuanXinWithModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getPushOptionsWithModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)startAppLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
