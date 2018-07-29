#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIRefreshControl+AFNetworking.h"
#import <objc/runtime.h>
#import "AFURLSessionManager.h"

@interface UIRefreshControl (AFNetworkingLlslog)
- (void)af_notificationObserverLlslog:(NSString *)llslog;
- (void)setRefreshingWithStateOfTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;

@end
