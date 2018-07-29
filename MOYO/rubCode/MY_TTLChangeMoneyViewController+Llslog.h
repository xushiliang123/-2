#import "BaseViewController.h"
#import "MY_TTLMeModel.h"
#import "MY_TTLChangeMoneyViewController.h"
#import "MY_TTLIncomeDetailViewController.h"
#import "MY_TTLIncomeModel.h"
#import "MY_TTLTiXianViewController.h"
#import "RechargeViewController.h"
#import "MY_XTTiXianViewController.h"

@interface MY_TTLChangeMoneyViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setNewUILlslog:(NSString *)llslog;
- (void)upLoadData:(MY_TTLMeModel *)model llslog:(NSString *)llslog;
- (void)inComeClickLlslog:(NSString *)llslog;
- (void)withdraClickLlslog:(NSString *)llslog;
- (void)rechargeMoney:(UIButton *)btn llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
