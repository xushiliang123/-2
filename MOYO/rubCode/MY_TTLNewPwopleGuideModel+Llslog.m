#import "MY_TTLNewPwopleGuideModel+Llslog.h"
@implementation MY_TTLNewPwopleGuideModel (Llslog)
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
