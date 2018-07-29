#import "BaseViewController.h"
#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLPriceBtn.h"
#import "ParallelButton.h"
#import "MY_LYMessageInfoModel.h"

@interface MY_TTLToBeNobilityViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)WXPAYSuccess:(NSNotification *)notificaiton llslog:(NSString *)llslog;
- (void)WXPAYERROR:(NSNotification *)not llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)headerCreateLlslog:(NSString *)llslog;
- (void)parClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)guiClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)payClickLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
