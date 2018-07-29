#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIActivityIndicatorView+AFNetworking.h"
#import <objc/runtime.h>
#import "AFURLSessionManager.h"

@interface UIActivityIndicatorView (AFNetworkingLlslog)
- (void)af_notificationObserverLlslog:(NSString *)llslog;
- (void)setAnimatingWithStateOfTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;

@end
