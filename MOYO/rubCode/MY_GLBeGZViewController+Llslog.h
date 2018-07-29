#import "BaseViewController.h"
#import "MY_TTLMeModel.h"
#import "MY_GLBeGZViewController.h"
#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLInviteFriendViewController.h"
#import "MY_LLCustomerServiceViewController.h"
#import "CRWebViewController.h"
#import "MY_TTLMeModel.h"
#import "MY_LYMessageInfoModel.h"

@interface MY_GLBeGZViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)gotoguizuClick:(UIButton *)sender llslog:(NSString *)llslog;
- (void)connectKeFu:(id)sender llslog:(NSString *)llslog;
- (void)gotoinviteFriendClick:(UIButton *)sender llslog:(NSString *)llslog;
- (void)backBtn:(UIButton *)sender llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
