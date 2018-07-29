#import "IQTitleBarButtonItem+Llslog.h"
@implementation IQTitleBarButtonItem (Llslog)
- (void)initWithTitle:(nullable NSString *)title llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setTitleFont:(UIFont *)titleFont llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setTitle:(NSString *)title llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelectableTextColor:(UIColor*)selectableTextColor llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setInvocation:(NSInvocation *)invocation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
