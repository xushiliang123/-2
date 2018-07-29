#import "UITableView+MJRefreshLlslog.h"
@implementation UITableView (MJRefreshLlslog)
+ (void)loadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mj_reloadDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
