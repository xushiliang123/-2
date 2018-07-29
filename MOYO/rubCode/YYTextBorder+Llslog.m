#import "YYTextBorder+Llslog.h"
@implementation YYTextBorder (Llslog)
+ (void)borderWithLineStyle:(YYTextLineStyle)lineStyle lineWidth:(CGFloat)width strokeColor:(UIColor *)color llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)borderWithFillColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
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
