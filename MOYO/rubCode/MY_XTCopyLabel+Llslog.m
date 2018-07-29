#import "MY_XTCopyLabel+Llslog.h"
@implementation MY_XTCopyLabel (Llslog)
- (void)canBecomeFirstResponderLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)canPerformAction:(SEL)action withSender:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)copy:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)attachTapHandlerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleTap:(UIGestureRecognizer*) recognizer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
