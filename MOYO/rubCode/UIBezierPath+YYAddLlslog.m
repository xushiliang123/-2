#import "UIBezierPath+YYAddLlslog.h"
@implementation UIBezierPath (YYAddLlslog)
+ (void)bezierPathWithText:(NSString *)text font:(UIFont *)font llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
