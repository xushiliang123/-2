#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
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
#import "MY_GLEditMyInfoViewController.h"
#import "CounterMarkViewController.h"
#import "MY_XTGuideViewController.h"
#import "MY_LLInfomationViewController.h"
#import "UserProfileManager.h"
#import "DemoCallManager.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_GLBeGZViewController.h"
#import "MY_TTLMapCheckViewController.h"
#import "MY_LYTitlesViewController.h"
#import "MY_LLCustomerServiceViewController.h"
#import "MY_LLCreateClubsViewController.h"
#import "MY_LYTTPlayViewController.h"
#import <Hyphenate/Hyphenate.h>

@interface TabBarController (Llslog)
+ (void)shareInstanceLlslog:(NSString *)llslog;
- (void)MY_TTPlayVLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)createViewLlslog:(NSString *)llslog;
- (void)setupLlslog:(NSString *)llslog;
- (void)addCenterButtonWithImage:(UIImage*)buttonImage llslog:(NSString *)llslog;
- (void)setIsForbiddenForTabLlslog:(NSString *)llslog;
- (void)setUpAllViewControlllerLlslog:(NSString *)llslog;
- (void)pressChange:(UIButton*)sender llslog:(NSString *)llslog;
- (void)setUpOneChildViewController:(UIViewController *)vController image:(UIImage *)image selectImage:(UIImage *)selectImage llslog:(NSString *)llslog;
- (void)setupUnreadMessageCountLlslog:(NSString *)llslog;
- (void)networkChanged:(EMConnectionState)connectionState llslog:(NSString *)llslog;
- (void)playSoundAndVibrationLlslog:(NSString *)llslog;
- (void)showNotificationWithMessage:(EMMessage *)message llslog:(NSString *)llslog;
- (void)willAutoReconnectLlslog:(NSString *)llslog;
- (void)didAutoReconnectFinishedWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)conversationTypeFromMessageType:(EMChatType)type llslog:(NSString *)llslog;
- (void)automaticLoginLlslog:(NSString *)llslog;
- (void)presentToLoginPageLlslog:(NSString *)llslog;
- (void)gotoVC:(NSInteger)tag llslog:(NSString *)llslog;
- (void)loginHuanXinServerLlslog:(NSString *)llslog;
- (void)tabBarController:(TabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;

@end
