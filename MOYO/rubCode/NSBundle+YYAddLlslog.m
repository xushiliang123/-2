#import "NSBundle+YYAddLlslog.h"
@implementation NSBundle (YYAddLlslog)
+ (void)preferredScalesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pathForScaledResource:(NSString *)name ofType:(NSString *)ext llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
