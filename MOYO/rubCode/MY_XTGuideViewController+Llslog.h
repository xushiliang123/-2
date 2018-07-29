#import <UIKit/UIKit.h>
#import "MY_XTGuideViewController.h"
#import "TabBarController.h"
#import "AppDelegate.h"
#import "EAIntroView.h"
#import "MY_LYLoginViewController.h"
#import "CRWebViewController.h"
#import "MY_GLEditMyInfoViewController.h"// 编辑资料
#import "CounterMarkViewController.h"// 设置标签

@interface MY_XTGuideViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)gotoEditOrCounterMarkLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)downloadIntroPageLlslog:(NSString *)llslog;
- (void)showIntroWithCrossDissolveLlslog:(NSString *)llslog;
- (void)clickAdv:(UITapGestureRecognizer *)gestureRecognizer llslog:(NSString *)llslog;
- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSUInteger)pageIndex llslog:(NSString *)llslog;
- (void)skipButtonClick:(id)sender llslog:(NSString *)llslog;
- (void)experienceButtonClick:(id)sender llslog:(NSString *)llslog;
- (void)autoMoveLlslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
