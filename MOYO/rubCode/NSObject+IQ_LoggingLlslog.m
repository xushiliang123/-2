#import "NSObject+IQ_LoggingLlslog.h"
@implementation NSObject (IQ_LoggingLlslog)
- (void)_IQDescriptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
