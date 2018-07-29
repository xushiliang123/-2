#import "UIBarButtonItem+YYAddLlslog.h"
@implementation UIBarButtonItem (YYAddLlslog)
- (void)setActionBlock:(void (^)(id sender))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
