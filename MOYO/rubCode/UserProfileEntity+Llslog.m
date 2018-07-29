#import "UserProfileEntity+Llslog.h"
@implementation UserProfileEntity (Llslog)
+ (void)initWithPFObject:(PFObject *)object llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
