#import "YYClassIvarInfo+Llslog.h"
@implementation YYClassIvarInfo (Llslog)
- (void)initWithIvar:(Ivar)ivar llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
