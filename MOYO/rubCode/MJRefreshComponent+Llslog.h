#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"
#import "UIScrollView+MJExtension.h"
#import "UIScrollView+MJRefresh.h"
#import "NSBundle+MJRefresh.h"
#import "MJRefreshComponent.h"
#import "MJRefreshConst.h"

@interface MJRefreshComponent (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)addObserversLlslog:(NSString *)llslog;
- (void)removeObserversLlslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)scrollViewPanStateDidChange:(NSDictionary *)change llslog:(NSString *)llslog;
- (void)setRefreshingTarget:(id)target refreshingAction:(SEL)action llslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)beginRefreshingLlslog:(NSString *)llslog;
- (void)beginRefreshingWithCompletionBlock:(void (^)())completionBlock llslog:(NSString *)llslog;
- (void)endRefreshingLlslog:(NSString *)llslog;
- (void)endRefreshingWithCompletionBlock:(void (^)())completionBlock llslog:(NSString *)llslog;
- (void)isRefreshingLlslog:(NSString *)llslog;
- (void)setAutoChangeAlpha:(BOOL)autoChangeAlpha llslog:(NSString *)llslog;
- (void)isAutoChangeAlphaLlslog:(NSString *)llslog;
- (void)setAutomaticallyChangeAlpha:(BOOL)automaticallyChangeAlpha llslog:(NSString *)llslog;
- (void)setPullingPercent:(CGFloat)pullingPercent llslog:(NSString *)llslog;
- (void)executeRefreshingCallbackLlslog:(NSString *)llslog;

@end
