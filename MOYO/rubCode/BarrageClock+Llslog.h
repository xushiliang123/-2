#import <Foundation/Foundation.h>
#import "BarrageClock.h"

@interface BarrageClock (Llslog)
+ (void)clockWithHandler:(void (^)(NSTimeInterval time))block llslog:(NSString *)llslog;
- (void)initWithHandler:(void (^)(NSTimeInterval time))block llslog:(NSString *)llslog;
- (void)resetLlslog:(NSString *)llslog;
- (void)updateLlslog:(NSString *)llslog;
- (void)startLlslog:(NSString *)llslog;
- (void)setSpeed:(CGFloat)speed llslog:(NSString *)llslog;
- (void)pauseLlslog:(NSString *)llslog;
- (void)stopLlslog:(NSString *)llslog;
- (void)updateTimeLlslog:(NSString *)llslog;

@end
