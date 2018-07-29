#import "YYClassPropertyInfo+Llslog.h"
@implementation YYClassPropertyInfo (Llslog)
- (void)initWithProperty:(objc_property_t)property llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
