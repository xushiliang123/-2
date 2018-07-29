#import "MJRefreshFooter.h"
#import "MJRefreshBackFooter.h"

@interface MJRefreshBackFooter (Llslog)
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)endRefreshingLlslog:(NSString *)llslog;
- (void)endRefreshingWithNoMoreDataLlslog:(NSString *)llslog;
- (void)heightForContentBreakViewLlslog:(NSString *)llslog;
- (void)happenOffsetYLlslog:(NSString *)llslog;

@end
