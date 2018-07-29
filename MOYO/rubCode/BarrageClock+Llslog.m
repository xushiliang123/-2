#import "BarrageClock+Llslog.h"
@implementation BarrageClock (Llslog)
+ (void)clockWithHandler:(void (^)(NSTimeInterval time))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithHandler:(void (^)(NSTimeInterval time))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resetLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)startLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSpeed:(CGFloat)speed llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pauseLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)stopLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateTimeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
