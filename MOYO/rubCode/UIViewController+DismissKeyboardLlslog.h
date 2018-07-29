#import <UIKit/UIKit.h>
#import "UIViewController+DismissKeyboard.h"

@interface UIViewController (DismissKeyboardLlslog)
- (void)setupForDismissKeyboardLlslog:(NSString *)llslog;
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer llslog:(NSString *)llslog;

@end
