#import "NSObject+MJRefreshLlslog.h"
@implementation NSObject (MJRefreshLlslog)
+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2 llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2 llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
