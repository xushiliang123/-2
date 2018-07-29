#import "YYDispatchQueuePool+Llslog.h"
@implementation YYDispatchQueuePool (Llslog)
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)queueLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)defaultPoolForQOS:(NSQualityOfService)qos llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
