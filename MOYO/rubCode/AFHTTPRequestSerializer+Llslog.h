#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import "AFURLRequestSerialization.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface AFHTTPRequestSerializer (Llslog)
+ (void)serializerLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess llslog:(NSString *)llslog;
- (void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy llslog:(NSString *)llslog;
- (void)setHTTPShouldHandleCookies:(BOOL)HTTPShouldHandleCookies llslog:(NSString *)llslog;
- (void)setHTTPShouldUsePipelining:(BOOL)HTTPShouldUsePipelining llslog:(NSString *)llslog;
- (void)setNetworkServiceType:(NSURLRequestNetworkServiceType)networkServiceType llslog:(NSString *)llslog;
- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval llslog:(NSString *)llslog;
- (void)HTTPRequestHeadersLlslog:(NSString *)llslog;
- (void)setValue:(NSString *)value
forHTTPHeaderField:(NSString *)field llslog:(NSString *)llslog;
- (void)valueForHTTPHeaderField:(NSString *)field llslog:(NSString *)llslog;
- (void)setAuthorizationHeaderFieldWithUsername:(NSString *)username
                                       password:(NSString *)password llslog:(NSString *)llslog;
- (void)clearAuthorizationHeaderLlslog:(NSString *)llslog;
- (void)setQueryStringSerializationWithStyle:(AFHTTPRequestQueryStringSerializationStyle)style llslog:(NSString *)llslog;
- (void)setQueryStringSerializationWithBlock:(NSString *(^)(NSURLRequest *, id, NSError *__autoreleasing *))block llslog:(NSString *)llslog;
- (void)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)URLString
                                parameters:(id)parameters
                                     error:(NSError *__autoreleasing *)error llslog:(NSString *)llslog;
- (void)multipartFormRequestWithMethod:(NSString *)method
                                              URLString:(NSString *)URLString
                                             parameters:(NSDictionary *)parameters
                              constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                                                  error:(NSError *__autoreleasing *)error llslog:(NSString *)llslog;
- (void)requestWithMultipartFormRequest:(NSURLRequest *)request
                             writingStreamContentsToFile:(NSURL *)fileURL
                                       completionHandler:(void (^)(NSError *error))handler llslog:(NSString *)llslog;
- (void)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error llslog:(NSString *)llslog;
+ (void)automaticallyNotifiesObserversForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(__unused id)object
                        change:(NSDictionary *)change
                       context:(void *)context llslog:(NSString *)llslog;
+ (void)supportsSecureCodingLlslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
