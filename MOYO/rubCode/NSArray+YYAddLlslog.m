#import "NSArray+YYAddLlslog.h"
@implementation NSArray (YYAddLlslog)
+ (void)arrayWithPlistData:(NSData *)plist llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)arrayWithPlistString:(NSString *)plist llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)plistDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)plistStringLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)randomObjectLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectOrNilAtIndex:(NSUInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)jsonStringEncodedLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)jsonPrettyStringEncodedLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
