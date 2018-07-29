#import "YYTextEffectWindow+Llslog.h"
@implementation YYTextEffectWindow (Llslog)
+ (void)sharedWindowLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)becomeKeyWindowLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rootViewControllerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_updateWindowLevelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_keyboardDirectionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_correctedCaptureCenter:(CGPoint)center llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_correctedCenter:(CGPoint)center forMagnifier:(YYTextMagnifier *)mag rotation:(CGFloat)rotation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_updateMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)moveMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideMagnifier:(YYTextMagnifier *)mag llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_updateSelectionGrabberDot:(YYSelectionGrabberDot *)dot selection:(YYTextSelectionView *)selection llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showSelectionDot:(YYTextSelectionView *)selection llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideSelectionDot:(YYTextSelectionView *)selection llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
