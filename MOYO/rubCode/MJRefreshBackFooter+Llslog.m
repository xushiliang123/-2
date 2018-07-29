#import "MJRefreshBackFooter+Llslog.h"
@implementation MJRefreshBackFooter (Llslog)
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)endRefreshingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)endRefreshingWithNoMoreDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)heightForContentBreakViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)happenOffsetYLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
