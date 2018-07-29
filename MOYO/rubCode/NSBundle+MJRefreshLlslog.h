#import <UIKit/UIKit.h>
#import "NSBundle+MJRefresh.h"
#import "MJRefreshComponent.h"

@interface NSBundle (MJRefreshLlslog)
+ (void)mj_refreshBundleLlslog:(NSString *)llslog;
+ (void)mj_arrowImageLlslog:(NSString *)llslog;
+ (void)mj_localizedStringForKey:(NSString *)key llslog:(NSString *)llslog;
+ (void)mj_localizedStringForKey:(NSString *)key value:(NSString *)value llslog:(NSString *)llslog;

@end
