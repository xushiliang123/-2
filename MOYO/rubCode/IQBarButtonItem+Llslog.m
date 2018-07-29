#import "IQBarButtonItem+Llslog.h"
@implementation IQBarButtonItem (Llslog)
+ (void)initializeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(nullable id)target action:(nullable SEL)action llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setTarget:(nullable id)target action:(nullable SEL)action llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
