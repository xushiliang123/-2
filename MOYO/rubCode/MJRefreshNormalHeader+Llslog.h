#import "MJRefreshStateHeader.h"
#import "MJRefreshNormalHeader.h"
#import "NSBundle+MJRefresh.h"

@interface MJRefreshNormalHeader (Llslog)
- (void)arrowViewLlslog:(NSString *)llslog;
- (void)loadingViewLlslog:(NSString *)llslog;
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;

@end
