#import "NSObject+YYAddForARCLlslog.h"
@implementation NSObject (YYAddForARCLlslog)
- (void)arcDebugRetainLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)arcDebugReleaseLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)arcDebugAutoreleaseLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)arcDebugRetainCountLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
