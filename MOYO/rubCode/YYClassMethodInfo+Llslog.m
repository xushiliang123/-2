#import "YYClassMethodInfo+Llslog.h"
@implementation YYClassMethodInfo (Llslog)
- (void)initWithMethod:(Method)method llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
