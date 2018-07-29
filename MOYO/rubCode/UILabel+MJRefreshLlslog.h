#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIView+MJExtension.h"
#import "UIScrollView+MJExtension.h"
#import "UIScrollView+MJRefresh.h"
#import "NSBundle+MJRefresh.h"
#import "MJRefreshComponent.h"
#import "MJRefreshConst.h"

@interface UILabel (MJRefreshLlslog)
+ (void)mj_labelLlslog:(NSString *)llslog;
- (void)mj_textWithLlslog:(NSString *)llslog;

@end
