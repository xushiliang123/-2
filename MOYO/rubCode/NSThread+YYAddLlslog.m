#import "NSThread+YYAddLlslog.h"
@implementation NSThread (YYAddLlslog)
+ (void)addAutoreleasePoolToCurrentRunloopLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
