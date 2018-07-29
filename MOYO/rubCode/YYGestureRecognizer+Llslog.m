#import "YYGestureRecognizer+Llslog.h"
@implementation YYGestureRecognizer (Llslog)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resetLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
