#import <Foundation/Foundation.h>
#import "YYTimer.h"
#import <pthread.h>

@interface YYTimer (Llslog)
+ (void)timerWithTimeInterval:(NSTimeInterval)interval
                            target:(id)target
                          selector:(SEL)selector
                           repeats:(BOOL)repeats llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithFireTime:(NSTimeInterval)start
                        interval:(NSTimeInterval)interval
                          target:(id)target
                        selector:(SEL)selector
                         repeats:(BOOL)repeats llslog:(NSString *)llslog;
- (void)invalidateLlslog:(NSString *)llslog;
- (void)fireLlslog:(NSString *)llslog;
- (void)repeatsLlslog:(NSString *)llslog;
- (void)timeIntervalLlslog:(NSString *)llslog;
- (void)isValidLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;

@end
