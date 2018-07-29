#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#import "YYReachability.h"
#import <objc/message.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@interface YYReachability (Llslog)
+ (void)sharedQueueLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithRef:(SCNetworkReachabilityRef)ref llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setScheduled:(BOOL)scheduled llslog:(NSString *)llslog;
- (void)flagsLlslog:(NSString *)llslog;
- (void)statusLlslog:(NSString *)llslog;
- (void)wwanStatusLlslog:(NSString *)llslog;
- (void)isReachableLlslog:(NSString *)llslog;
+ (void)reachabilityLlslog:(NSString *)llslog;
+ (void)reachabilityForLocalWifiLlslog:(NSString *)llslog;
+ (void)reachabilityWithHostname:(NSString *)hostname llslog:(NSString *)llslog;
+ (void)reachabilityWithAddress:(const struct sockaddr *)hostAddress llslog:(NSString *)llslog;
- (void)setNotifyBlock:(void (^)(YYReachability *reachability))notifyBlock llslog:(NSString *)llslog;

@end
