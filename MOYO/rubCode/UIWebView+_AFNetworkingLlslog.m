#import "UIWebView+_AFNetworkingLlslog.h"
@implementation UIWebView (_AFNetworkingLlslog)
- (void)af_URLSessionTaskLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)af_setURLSessionTask:(NSURLSessionDataTask *)af_URLSessionTask llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
