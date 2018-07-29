#import "EMCallOptions+NSCodingLlslog.h"
@implementation EMCallOptions (NSCodingLlslog)
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
