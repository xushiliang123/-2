#import <Foundation/Foundation.h>
#import "YYMemoryCache.h"
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import <pthread.h>
#import "YYDispatchQueuePool.h"

@interface YYMemoryCache (Llslog)
- (void)_trimRecursivelyLlslog:(NSString *)llslog;
- (void)_trimInBackgroundLlslog:(NSString *)llslog;
- (void)_trimToCost:(NSUInteger)costLimit llslog:(NSString *)llslog;
- (void)_trimToCount:(NSUInteger)countLimit llslog:(NSString *)llslog;
- (void)_trimToAge:(NSTimeInterval)ageLimit llslog:(NSString *)llslog;
- (void)_appDidReceiveMemoryWarningNotificationLlslog:(NSString *)llslog;
- (void)_appDidEnterBackgroundNotificationLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)totalCountLlslog:(NSString *)llslog;
- (void)totalCostLlslog:(NSString *)llslog;
- (void)releaseOnMainThreadLlslog:(NSString *)llslog;
- (void)setReleaseOnMainThread:(BOOL)releaseOnMainThread llslog:(NSString *)llslog;
- (void)releaseAsynchronouslyLlslog:(NSString *)llslog;
- (void)setReleaseAsynchronously:(BOOL)releaseAsynchronously llslog:(NSString *)llslog;
- (void)containsObjectForKey:(id)key llslog:(NSString *)llslog;
- (void)objectForKey:(id)key llslog:(NSString *)llslog;
- (void)setObject:(id)object forKey:(id)key llslog:(NSString *)llslog;
- (void)setObject:(id)object forKey:(id)key withCost:(NSUInteger)cost llslog:(NSString *)llslog;
- (void)removeObjectForKey:(id)key llslog:(NSString *)llslog;
- (void)removeAllObjectsLlslog:(NSString *)llslog;
- (void)trimToCount:(NSUInteger)count llslog:(NSString *)llslog;
- (void)trimToCost:(NSUInteger)cost llslog:(NSString *)llslog;
- (void)trimToAge:(NSTimeInterval)age llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
