#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshHeader.h"
#import "MJRefreshFooter.h"
#import <objc/runtime.h>

@interface UIScrollView (MJRefreshLlslog)
- (void)setMj_header:(MJRefreshHeader *)mj_header llslog:(NSString *)llslog;
- (void)mj_headerLlslog:(NSString *)llslog;
- (void)setMj_footer:(MJRefreshFooter *)mj_footer llslog:(NSString *)llslog;
- (void)mj_footerLlslog:(NSString *)llslog;
- (void)setFooter:(MJRefreshFooter *)footer llslog:(NSString *)llslog;
- (void)footerLlslog:(NSString *)llslog;
- (void)setHeader:(MJRefreshHeader *)header llslog:(NSString *)llslog;
- (void)headerLlslog:(NSString *)llslog;
- (void)mj_totalDataCountLlslog:(NSString *)llslog;
- (void)setMj_reloadDataBlock:(void (^)(NSInteger))mj_reloadDataBlock llslog:(NSString *)llslog;
- (void)executeReloadDataBlockLlslog:(NSString *)llslog;

@end
