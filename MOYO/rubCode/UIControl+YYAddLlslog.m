#import "UIControl+YYAddLlslog.h"
@implementation UIControl (YYAddLlslog)
- (void)removeAllTargetsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_yy_allUIControlBlockTargetsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
