#import "MJRefreshComponent.h"
#import "MJRefreshFooter.h"

@interface MJRefreshFooter (Llslog)
+ (void)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock llslog:(NSString *)llslog;
+ (void)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)endRefreshingWithNoMoreDataLlslog:(NSString *)llslog;
- (void)noticeNoMoreDataLlslog:(NSString *)llslog;
- (void)resetNoMoreDataLlslog:(NSString *)llslog;

@end
