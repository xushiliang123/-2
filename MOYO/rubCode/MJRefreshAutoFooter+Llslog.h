#import "MJRefreshFooter.h"
#import "MJRefreshAutoFooter.h"

@interface MJRefreshAutoFooter (Llslog)
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)setAppearencePercentTriggerAutoRefresh:(CGFloat)appearencePercentTriggerAutoRefresh llslog:(NSString *)llslog;
- (void)appearencePercentTriggerAutoRefreshLlslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)scrollViewPanStateDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)setHidden:(BOOL)hidden llslog:(NSString *)llslog;

@end
