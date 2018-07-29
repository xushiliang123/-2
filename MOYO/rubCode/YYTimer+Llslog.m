#import "YYTimer+Llslog.h"
@implementation YYTimer (Llslog)
+ (void)timerWithTimeInterval:(NSTimeInterval)interval
                            target:(id)target
                          selector:(SEL)selector
                           repeats:(BOOL)repeats llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFireTime:(NSTimeInterval)start
                        interval:(NSTimeInterval)interval
                          target:(id)target
                        selector:(SEL)selector
                         repeats:(BOOL)repeats llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)invalidateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)fireLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)repeatsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)timeIntervalLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isValidLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
