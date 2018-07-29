#import "BaseViewController.h"
#import "MY_GLFindRootViewController.h"
#import "GuideTitleView.h"//导航标题
#import "MY_TTLFindViewController.h"//地图
#import "MY_GLWorldTVViewController.h"//世界频道
#import "MY_LYActivityViewController.h"//活动
#import "MY_LYCreateAnActivityViewController.h"

@interface MY_GLFindRootViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)notificationSelect:(NSNotification*)nito llslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)pageViewControllerLlslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed llslog:(NSString *)llslog;
- (void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex llslog:(NSString *)llslog;
- (void)StatAActivityLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
