#import "NSSafeObject+Llslog.h"
@implementation NSSafeObject (Llslog)
- (void)initWithObject:(id)object llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithObject:(id)object withSelector:(SEL)selector llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)excuteLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
