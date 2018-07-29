#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshHeader.h"
#import "MJRefreshFooter.h"
#import <objc/runtime.h>

@interface UITableView (MJRefreshLlslog)
+ (void)loadLlslog:(NSString *)llslog;
- (void)mj_reloadDataLlslog:(NSString *)llslog;

@end
