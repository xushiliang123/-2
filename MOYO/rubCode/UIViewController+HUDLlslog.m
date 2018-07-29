#import "UIViewController+HUDLlslog.h"
@implementation UIViewController (HUDLlslog)
- (void)HUDLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setHUD:(MBProgressHUD *)HUD llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showHudInView:(UIView *)view hint:(NSString *)hint llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showHint:(NSString *)hint llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showHint:(NSString *)hint yOffset:(float)yOffset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideHudLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
