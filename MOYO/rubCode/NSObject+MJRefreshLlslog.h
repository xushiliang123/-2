#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshHeader.h"
#import "MJRefreshFooter.h"
#import <objc/runtime.h>

@interface NSObject (MJRefreshLlslog)
+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2 llslog:(NSString *)llslog;
+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2 llslog:(NSString *)llslog;

@end
