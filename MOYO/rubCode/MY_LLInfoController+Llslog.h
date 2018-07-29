#import "ViewController.h"
#import "MY_LLInfoController.h"
#import "MY_LLInfomationViewController.h"
#import "MY_LYAddressListViewController.h"
#import "MY_LYLoginViewController.h"

@interface MY_LLInfoController (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)addRedPoint:(NSNotification *)not llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createHeaderLlslog:(NSString *)llslog;
- (void)clickButton:(UIButton*)sender llslog:(NSString *)llslog;
- (void)changeCurrentSelectedIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)createPageViewLlslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController llslog:(NSString *)llslog;
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed llslog:(NSString *)llslog;
- (void)setupUnreadMessageCountLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
