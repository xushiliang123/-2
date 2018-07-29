#import "YYTransaction+Llslog.h"
@implementation YYTransaction (Llslog)
+ (void)transactionWithTarget:(id)target selector:(SEL)selector llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)commitLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hashLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isEqual:(id)object llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
