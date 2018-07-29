#import "YYTextDecoration+Llslog.h"
@implementation YYTextDecoration (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)decorationWithStyle:(YYTextLineStyle)style llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)decorationWithStyle:(YYTextLineStyle)style width:(NSNumber *)width color:(UIColor *)color llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
