#import <Foundation/Foundation.h>
#import "NSTimer+YYAdd.h"
#import "YYKitMacro.h"

@interface NSTimer (YYAddLlslog)
+ (void)_yy_ExecBlock:(NSTimer *)timer llslog:(NSString *)llslog;
+ (void)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats llslog:(NSString *)llslog;
+ (void)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats llslog:(NSString *)llslog;

@end
