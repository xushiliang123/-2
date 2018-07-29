#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "AppDelegate.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AdSupport/AdSupport.h>
#import "AppDelegate+EaseMob.h"
#import "MY_LYLoginViewController.h"
#import <WXApiObject.h>
#import "MY_XTGuideViewController.h"
#import "RootBaseViewController.h"
#import "MY_XTSystemInfoViewController.h"
#import "MY_TTLOfficialNoticeViewController.h"
#import "MY_LLCustomerServiceViewController.h"
#import "MY_GLEditMyInfoViewController.h"
#import "CounterMarkViewController.h"
#import "MY_TTLClubNoticeViewController.h"
#import "MY_TTLClubChatViewController.h"
#import "MY_LYPersonInfoModel.h"

@interface AppDelegate (Llslog)
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions llslog:(NSString *)llslog;
- (void)thirdMapPartyLlslog:(NSString *)llslog;
- (void)iqKeyBoardLlslog:(NSString *)llslog;
- (void)startAppLlslog:(NSString *)llslog;
- (void)setJPUSHWithOptions:(NSDictionary *)launchOptions llslog:(NSString *)llslog;
- (void)applicationWillResignActive:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationDidEnterBackground:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationWillEnterForeground:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationDidBecomeActive:(UIApplication *)application llslog:(NSString *)llslog;
- (void)applicationWillTerminate:(UIApplication *)application llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation llslog:(NSString *)llslog;
- (void)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler llslog:(NSString *)llslog;
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification llslog:(NSString *)llslog;
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler llslog:(NSString *)llslog;
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler llslog:(NSString *)llslog;
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler llslog:(NSString *)llslog;
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler llslog:(NSString *)llslog;
- (void)receiveSyetemNotification:(NSDictionary *)userInfo llslog:(NSString *)llslog;
- (void)pushSpecifiedViewCtrl:(NSString *)urlString llslog:(NSString *)llslog;
- (void)updateDatasdfdsLlslog:(NSString *)llslog;
- (void)addHeadViewLlslog:(NSString *)llslog;
- (void)setIsAddInstaller:(BOOL)isAddInstaller llslog:(NSString *)llslog;
- (void)refreshTableViewLlslog:(NSString *)llslog;
- (void)loadMoreDataLlslog:(NSString *)llslog;
- (void)loadDataaaaLlslog:(NSString *)llslog;
- (void)htForFooterInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableVion:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)numberOsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableVieth:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableitleForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)nextBtnClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText llslog:(NSString *)llslog;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar llslog:(NSString *)llslog;
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar llslog:(NSString *)llslog;
- (void)searchDataaaaaLlslog:(NSString *)llslog;

@end
