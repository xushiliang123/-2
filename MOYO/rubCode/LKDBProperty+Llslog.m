#import "LKDBProperty+Llslog.h"
@implementation LKDBProperty (Llslog)
- (void)initWithType:(NSString *)type cname:(NSString *)cname ctype:(NSString *)ctype pname:(NSString *)pname ptype:(NSString *)ptype llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)enableUserCalculateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isUserCalculateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
