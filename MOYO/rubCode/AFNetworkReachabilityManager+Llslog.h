#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "AFNetworkReachabilityManager.h"
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>

@interface AFNetworkReachabilityManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
+ (void)managerForDomain:(NSString *)domain llslog:(NSString *)llslog;
+ (void)managerForAddress:(const void *)address llslog:(NSString *)llslog;
+ (void)managerLlslog:(NSString *)llslog;
- (void)initWithReachability:(SCNetworkReachabilityRef)reachability llslog:(NSString *)llslog;

- (void)deallocLlslog:(NSString *)llslog;
- (void)isReachableLlslog:(NSString *)llslog;
- (void)isReachableViaWWANLlslog:(NSString *)llslog;
- (void)isReachableViaWiFiLlslog:(NSString *)llslog;
- (void)startMonitoringLlslog:(NSString *)llslog;
- (void)stopMonitoringLlslog:(NSString *)llslog;
- (void)localizedNetworkReachabilityStatusStringLlslog:(NSString *)llslog;
- (void)setReachabilityStatusChangeBlock:(void (^)(AFNetworkReachabilityStatus status))block llslog:(NSString *)llslog;
+ (void)keyPathsForValuesAffectingValueForKey:(NSString *)key llslog:(NSString *)llslog;

@end
