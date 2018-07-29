#import "YYTextDebugOption+Llslog.h"
@implementation YYTextDebugOption (Llslog)
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)needDrawDebugLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)clearLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)addDebugTarget:(id<YYTextDebugTarget>)target llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)removeDebugTarget:(id<YYTextDebugTarget>)target llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sharedDebugOptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setSharedDebugOption:(YYTextDebugOption *)option llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
