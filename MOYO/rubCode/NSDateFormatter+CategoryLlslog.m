#import "NSDateFormatter+CategoryLlslog.h"
@implementation NSDateFormatter (CategoryLlslog)
+ (void)dateFormatterLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dateFormatterWithFormat:(NSString *)dateFormat llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)defaultDateFormatterLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
