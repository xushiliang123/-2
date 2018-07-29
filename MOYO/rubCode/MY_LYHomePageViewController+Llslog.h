#import "RootBaseViewController.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import "MY_LYHomePageViewController.h"
#import "GuideTitleView.h"//  导航标题
#import "MY_TTLNewActiveViewController.h"
#import "MY_TTLNewJoinViewController.h"
#import "MY_TTLClubHomeViewController.h"
#import "MY_TTLSendMessageRedEnvelopView.h"
#import "MY_TTLClubChatViewController.h"//  世界频道
#import "FiltratePersonNearByView.h"    //筛选
#import "MY_LYLocationViewController.h"    //定位
#import "MY_LYActivityViewController.h"    //任务列表
#import "MY_GLTaskPageViewController.h"
#import "MY_GLAlivingViewController.h"
#import "MY_GLHomeAddStatusView.h"//挂状态
#import "CRSuspensionView.h"// 世界频道 横幅
#import "EndorsementWebViewController.h"//代言web
#import "LoginTipView.h"//  登录弹框
#import "MY_LYMessageInfoModel.h"
#import "MY_TTLNewPeopleGuideView.h"//新手指导
#import "HomeBlackView.h"
#import "CRWebViewController.h"//邀请好友
#import "MY_LLCreateClubsViewController.h"//创建俱乐部
#import "MY_GLClubListViewController.h"//  我的俱乐部列表
#import "MY_TTLToBeNobilityViewController.h"// 成为贵族
#import "MY_XTGuideViewController.h"// 广告页

@interface MY_LYHomePageViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)addrenwuButtonLlslog:(NSString *)llslog;
- (void)addNewPwopleComeViewLlslog:(NSString *)llslog;
- (void)addSuspensionViewLlslog:(NSString *)llslog;
- (void)gotoWorldClubLlslog:(NSString *)llslog;
- (void)setupUnreadMessageCountLlslog:(NSString *)llslog;
- (void)showWithMessage:(EMMessage*)message llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setupMapLocationLlslog:(NSString *)llslog;
- (void)createHeaderRightItemLlslog:(NSString *)llslog;
- (void)hideHeaderRightItemLlslog:(NSString *)llslog;
- (void)rightChooseClickLlslog:(NSString *)llslog;
- (void)rightJuLeBuClickLlslog:(NSString *)llslog;
- (void)createHeaderLeftItemLlslog:(NSString *)llslog;
- (void)leftMapClickLlslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)statusBtnLlslog:(NSString *)llslog;
- (void)bugleBtnLlslog:(NSString *)llslog;
- (void)inviteBtnLlslog:(NSString *)llslog;
- (void)addInviteButtonClickLlslog:(NSString *)llslog;
- (void)addBugleButtonClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)pageViewControllerLlslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed llslog:(NSString *)llslog;
- (void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex llslog:(NSString *)llslog;
- (void)addStatusBtnButtonClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)requestLocationLlslog:(NSString *)llslog;
- (void)changeLocationWithCity:(NSString *)city address:(NSString *)address longitude:(NSString *)longitude latitude:(NSString *)latitude llslog:(NSString *)llslog;
- (void)refreshActiceViewController:(NSString*)city llslog:(NSString *)llslog;
- (void)refresALivingViewController:(NSString*)city llslog:(NSString *)llslog;
- (void)refresJhoinViewController:(NSString*)city llslog:(NSString *)llslog;
- (void)networkDidReceiveMessage:(NSNotification *)not llslog:(NSString *)llslog;
- (void)showDaiyanViewLlslog:(NSString *)llslog;
- (void)removeUnreadLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
