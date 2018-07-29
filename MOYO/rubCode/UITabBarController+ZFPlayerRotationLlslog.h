#import <UIKit/UIKit.h>
#import "UITabBarController+ZFPlayerRotation.h"
#import <objc/runtime.h>

@interface UITabBarController (ZFPlayerRotationLlslog)
+ (void)loadLlslog:(NSString *)llslog;
- (void)zf_selectedIndexLlslog:(NSString *)llslog;
- (void)shouldAutorotateLlslog:(NSString *)llslog;
- (void)supportedInterfaceOrientationsLlslog:(NSString *)llslog;
- (void)preferredInterfaceOrientationForPresentationLlslog:(NSString *)llslog;

@end
