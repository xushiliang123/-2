#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIWebView+AFNetworking.h"
#import <objc/runtime.h>
#import "AFHTTPSessionManager.h"
#import "AFURLResponseSerialization.h"
#import "AFURLRequestSerialization.h"

@interface UIWebView (_AFNetworkingLlslog)
- (void)af_URLSessionTaskLlslog:(NSString *)llslog;
- (void)af_setURLSessionTask:(NSURLSessionDataTask *)af_URLSessionTask llslog:(NSString *)llslog;

@end
