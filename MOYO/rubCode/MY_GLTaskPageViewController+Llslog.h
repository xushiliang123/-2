#import "BaseViewController.h"
#import "MY_GLTaskPageViewController.h"
#import "MY_LYActivityViewController.h"
#import "MY_LYCreateAnActivityViewController.h"
#import "GuideTitleView.h"//  导航标题
#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLUpHomePageViewController.h"
#import "CRWebViewController.h"
#import "PublishTaskTipView.h"
#import "MY_LYCustomerLable.h"
#import "MY_LYCustomerButton.h"
#import "MY_LYEvaluationCell.h"
#import "MY_LYHeadIconCell.h"
#import "XCRatingBar.h"

@interface MY_GLTaskPageViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)addLaJiDaiMaLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)addNewPwopleComeViewLlslog:(NSString *)llslog;
- (void)rightChooseClickLlslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)pageViewControllerLlslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed llslog:(NSString *)llslog;
- (void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
