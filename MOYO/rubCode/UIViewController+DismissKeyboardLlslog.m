#import "UIViewController+DismissKeyboardLlslog.h"
@implementation UIViewController (DismissKeyboardLlslog)
- (void)setupForDismissKeyboardLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
