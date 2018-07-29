#import <UIKit/UIKit.h>
#import "MY_XTGuideViewController.h"
#import "TabBarController.h"
#import "AppDelegate.h"
#import "EAIntroView.h"
#import "MY_LYLoginViewController.h"
#import "CRWebViewController.h"
#import "MY_GLEditMyInfoViewController.h"// 编辑资料
#import "CounterMarkViewController.h"// 设置标签
#import "MY_XTGuideViewController+Llslog.h"

@interface MY_XTGuideViewController (LlslogLlslog)
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)gotoEditOrCounterMarkLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)downloadIntroPageLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)showIntroWithCrossDissolveLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)clickAdv:(UITapGestureRecognizer *)gestureRecognizer llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSUInteger)pageIndex llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)skipButtonClick:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)experienceButtonClick:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)autoMoveLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
