#import "UIActivityIndicatorView+AFNetworkingLlslog.h"
@implementation UIActivityIndicatorView (AFNetworkingLlslog)
- (void)af_notificationObserverLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAnimatingWithStateOfTask:(NSURLSessionTask *)task llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
