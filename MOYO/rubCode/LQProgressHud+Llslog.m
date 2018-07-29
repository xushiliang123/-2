#import "LQProgressHud+Llslog.h"
@implementation LQProgressHud (Llslog)
+ (void)sharedHUDLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)showStatus:(LQProgressHUDStatus)status text:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)showMessage:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)showInfoMsg:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)showFailure:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)showSuccess:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)showLoading:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)hideLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
