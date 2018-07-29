#import "MWTapDetectingView+Llslog.h"
@implementation MWTapDetectingView (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleSingleTap:(UITouch *)touch llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleDoubleTap:(UITouch *)touch llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleTripleTap:(UITouch *)touch llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
