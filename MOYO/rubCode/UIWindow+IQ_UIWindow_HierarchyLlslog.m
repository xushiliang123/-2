#import "UIWindow+IQ_UIWindow_HierarchyLlslog.h"
@implementation UIWindow (IQ_UIWindow_HierarchyLlslog)
- (void)topMostWindowControllerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)currentViewControllerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
