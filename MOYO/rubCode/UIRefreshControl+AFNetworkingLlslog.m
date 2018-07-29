#import "UIRefreshControl+AFNetworkingLlslog.h"
@implementation UIRefreshControl (AFNetworkingLlslog)
- (void)af_notificationObserverLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setRefreshingWithStateOfTask:(NSURLSessionTask *)task llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
