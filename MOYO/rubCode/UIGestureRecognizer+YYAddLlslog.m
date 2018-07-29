#import "UIGestureRecognizer+YYAddLlslog.h"
@implementation UIGestureRecognizer (YYAddLlslog)
- (void)initWithActionBlock:(void (^)(id sender))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addActionBlock:(void (^)(id sender))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAllActionBlocksLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_yy_allUIGestureRecognizerBlockTargetsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
