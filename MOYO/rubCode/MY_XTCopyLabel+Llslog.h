#import <UIKit/UIKit.h>
#import "MY_XTCopyLabel.h"

@interface MY_XTCopyLabel (Llslog)
- (void)canBecomeFirstResponderLlslog:(NSString *)llslog;
- (void)canPerformAction:(SEL)action withSender:(id)sender llslog:(NSString *)llslog;
- (void)copy:(id)sender llslog:(NSString *)llslog;
- (void)attachTapHandlerLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)handleTap:(UIGestureRecognizer*) recognizer llslog:(NSString *)llslog;

@end
