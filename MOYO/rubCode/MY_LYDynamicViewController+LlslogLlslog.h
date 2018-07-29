#import "RootBaseViewController.h"
#import "MY_LYDynamicViewController.h"
#import "EssenceViewController.h"
#import "NearViewController.h"
#import "AttentionViewController.h"
#import "MY_TTLDynamicIssueViewController.h"
#import "GuideTitleView.h"//导航标题
#import "HeadReadNewView.h"                 //  未读动态相关提示
#import "MyInfomationViewController.h"
#import "MY_LYDynamicViewController+Llslog.h"

@interface MY_LYDynamicViewController (LlslogLlslog)
- (void)initLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)refreshDynamicLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createReadNewViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pageViewControllerLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)rightBarButtonClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)readNewBtnClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)networkDidReceiveMessage:(NSNotification *)not llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)showHeadReadNewWith:(NSDictionary *)dict llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hiddenRedBadgeView:(NSNotification *)not llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)isShowBadgeAryLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)refreshDataHideRedPointLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
