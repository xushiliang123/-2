#import "MJRefreshHeader+Llslog.h"
@implementation MJRefreshHeader (Llslog)
+ (void)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)placeSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)endRefreshingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)lastUpdatedTimeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
