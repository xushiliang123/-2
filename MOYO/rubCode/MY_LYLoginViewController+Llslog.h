#import "RootBaseViewController.h"
#import "MY_LYLoginViewController.h"
#import "MY_GLEditMyInfoViewController.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "MY_TTLMySetViewController.h"
#import "MY_XTContactViewController.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_GLBeGZViewController.h"
#import "MY_XTGuideViewController.h"
#import "CounterMarkViewController.h"

@interface MY_LYLoginViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)showAlertViewLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)GocontactLlslog:(NSString *)llslog;
- (void)getCodeBtnClickLlslog:(NSString *)llslog;
- (void)autoMoveLlslog:(NSString *)llslog;
- (void)loginBtnClickLlslog:(NSString *)llslog;
- (void)logPushWithAlias:(NSString *)userId llslog:(NSString *)llslog;
- (void)loginHuanXinWithModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog;
- (void)getPushOptionsWithModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog;
- (void)gotoBeGuiZuVCLlslog:(NSString *)llslog;
- (void)isEmpty:(NSString *) str llslog:(NSString *)llslog;
- (void)textFieldShouldReturn:(UITextField *)textField llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
