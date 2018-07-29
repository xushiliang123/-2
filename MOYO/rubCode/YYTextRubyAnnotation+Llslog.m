#import "YYTextRubyAnnotation+Llslog.h"
@implementation YYTextRubyAnnotation (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)rubyWithCTRubyRef:(CTRubyAnnotationRef)ctRuby llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
