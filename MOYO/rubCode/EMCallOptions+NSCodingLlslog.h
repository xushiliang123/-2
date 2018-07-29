#import <Hyphenate/EMCallOptions.h>
#import "EMCallOptions+NSCoding.h"

@interface EMCallOptions (NSCodingLlslog)
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;

@end
