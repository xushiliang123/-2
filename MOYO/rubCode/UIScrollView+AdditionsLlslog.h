#import <UIKit/UIKit.h>
#import "IQUIScrollView+Additions.h"
#import <objc/runtime.h>

@interface UIScrollView (AdditionsLlslog)
- (void)setShouldRestoreScrollViewContentOffset:(BOOL)shouldRestoreScrollViewContentOffset llslog:(NSString *)llslog;
- (void)shouldRestoreScrollViewContentOffsetLlslog:(NSString *)llslog;

@end
