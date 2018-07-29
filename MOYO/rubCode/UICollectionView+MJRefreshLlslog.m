#import "UICollectionView+MJRefreshLlslog.h"
@implementation UICollectionView (MJRefreshLlslog)
+ (void)loadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mj_reloadDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
