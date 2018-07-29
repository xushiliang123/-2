#import "UIScrollView+AdditionsLlslog.h"
@implementation UIScrollView (AdditionsLlslog)
- (void)setShouldRestoreScrollViewContentOffset:(BOOL)shouldRestoreScrollViewContentOffset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)shouldRestoreScrollViewContentOffsetLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
