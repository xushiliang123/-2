#import "YYTextBackedString+Llslog.h"
@implementation YYTextBackedString (Llslog)
+ (void)stringWithString:(NSString *)string llslog:(NSString *)llslog {
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
