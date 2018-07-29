#import "NSBundle+MJRefreshLlslog.h"
@implementation NSBundle (MJRefreshLlslog)
+ (void)mj_refreshBundleLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)mj_arrowImageLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)mj_localizedStringForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)mj_localizedStringForKey:(NSString *)key value:(NSString *)value llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
