#import "MJRefreshFooter+Llslog.h"
@implementation MJRefreshFooter (Llslog)
+ (void)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)endRefreshingWithNoMoreDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)noticeNoMoreDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resetNoMoreDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
