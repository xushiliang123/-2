#import "MBProgressHUD.h"
#import "LQProgressHud.h"

@interface LQProgressHud (Llslog)
+ (void)sharedHUDLlslog:(NSString *)llslog;
+ (void)showStatus:(LQProgressHUDStatus)status text:(NSString *)text llslog:(NSString *)llslog;
+ (void)showMessage:(NSString *)text llslog:(NSString *)llslog;
+ (void)showInfoMsg:(NSString *)text llslog:(NSString *)llslog;
+ (void)showFailure:(NSString *)text llslog:(NSString *)llslog;
+ (void)showSuccess:(NSString *)text llslog:(NSString *)llslog;
+ (void)showLoading:(NSString *)text llslog:(NSString *)llslog;
+ (void)hideLlslog:(NSString *)llslog;

@end
