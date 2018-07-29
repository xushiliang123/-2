#import "NSNumber+YYAddLlslog.h"
@implementation NSNumber (YYAddLlslog)
+ (void)numberWithString:(NSString *)string llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
