#import <UIKit/UIKit.h>
#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

@interface UIViewController (HUDLlslog)
- (void)HUDLlslog:(NSString *)llslog;
- (void)setHUD:(MBProgressHUD *)HUD llslog:(NSString *)llslog;
- (void)showHudInView:(UIView *)view hint:(NSString *)hint llslog:(NSString *)llslog;
- (void)showHint:(NSString *)hint llslog:(NSString *)llslog;
- (void)showHint:(NSString *)hint yOffset:(float)yOffset llslog:(NSString *)llslog;
- (void)hideHudLlslog:(NSString *)llslog;

@end
