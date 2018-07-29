#import "NSTimer+YYAddLlslog.h"
@implementation NSTimer (YYAddLlslog)
+ (void)_yy_ExecBlock:(NSTimer *)timer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
