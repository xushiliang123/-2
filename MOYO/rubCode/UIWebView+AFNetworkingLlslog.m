#import "UIWebView+AFNetworkingLlslog.h"
@implementation UIWebView (AFNetworkingLlslog)
- (void)sessionManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSessionManager:(AFHTTPSessionManager *)sessionManager llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)responseSerializerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setResponseSerializer:(AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadRequest:(NSURLRequest *)request
           progress:(NSProgress * _Nullable __autoreleasing * _Nullable)progress
            success:(NSString * (^)(NSHTTPURLResponse *response, NSString *HTML))success
            failure:(void (^)(NSError *error))failure llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadRequest:(NSURLRequest *)request
           MIMEType:(NSString *)MIMEType
   textEncodingName:(NSString *)textEncodingName
           progress:(NSProgress * _Nullable __autoreleasing * _Nullable)progress
            success:(NSData * (^)(NSHTTPURLResponse *response, NSData *data))success
            failure:(void (^)(NSError *error))failure llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
