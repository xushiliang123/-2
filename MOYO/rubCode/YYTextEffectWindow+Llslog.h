#import <UIKit/UIKit.h>
#import <YYKit/YYTextMagnifier.h>
#import <YYKit/YYTextSelectionView.h>
#import "YYTextMagnifier.h"
#import "YYTextSelectionView.h"
#import "YYTextEffectWindow.h"
#import "YYTextKeyboardManager.h"
#import "YYKitMacro.h"
#import "YYCGUtilities.h"
#import "UIView+YYAdd.h"
#import "UIApplication+YYAdd.h"

@interface YYTextEffectWindow (Llslog)
+ (void)sharedWindowLlslog:(NSString *)llslog;
- (void)becomeKeyWindowLlslog:(NSString *)llslog;
- (void)rootViewControllerLlslog:(NSString *)llslog;
- (void)_updateWindowLevelLlslog:(NSString *)llslog;
- (void)_keyboardDirectionLlslog:(NSString *)llslog;
- (void)_correctedCaptureCenter:(CGPoint)center llslog:(NSString *)llslog;
- (void)_correctedCenter:(CGPoint)center forMagnifier:(YYTextMagnifier *)mag rotation:(CGFloat)rotation llslog:(NSString *)llslog;
- (void)_updateMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog;
- (void)showMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog;
- (void)moveMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog;
- (void)hideMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog;
- (void)_updateSelectionGrabberDot:(YYSelectionGrabberDot *)dot selection:(YYTextSelectionView *)selection llslog:(NSString *)llslog;
- (void)showSelectionDot:(YYTextSelectionView *)selection llslog:(NSString *)llslog;
- (void)hideSelectionDot:(YYTextSelectionView *)selection llslog:(NSString *)llslog;

@end
