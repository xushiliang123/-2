#import "YYTextPosition+Llslog.h"
@implementation YYTextPosition (Llslog)
+ (void)positionWithOffset:(NSInteger)offset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)positionWithOffset:(NSInteger)offset affinity:(YYTextAffinity)affinity llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)descriptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hashLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isEqual:(YYTextPosition *)object llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)compare:(YYTextPosition *)otherPosition llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
