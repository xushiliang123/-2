#import "YYTextShadow+Llslog.h"
@implementation YYTextShadow (Llslog)
+ (void)shadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)shadowWithNSShadow:(NSShadow *)nsShadow llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)nsShadowLlslog:(NSString *)llslog {
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
