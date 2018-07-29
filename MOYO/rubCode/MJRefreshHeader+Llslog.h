#import "MJRefreshComponent.h"
#import "MJRefreshHeader.h"

@interface MJRefreshHeader (Llslog)
+ (void)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock llslog:(NSString *)llslog;
+ (void)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)endRefreshingLlslog:(NSString *)llslog;
- (void)lastUpdatedTimeLlslog:(NSString *)llslog;

@end
