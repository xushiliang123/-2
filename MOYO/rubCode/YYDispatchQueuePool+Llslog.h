#import <Foundation/Foundation.h>
#import "YYDispatchQueuePool.h"
#import <UIKit/UIKit.h>
#import <libkern/OSAtomic.h>

@interface YYDispatchQueuePool (Llslog)
- (void)deallocLlslog:(NSString *)llslog;
- (void)queueLlslog:(NSString *)llslog;
+ (void)defaultPoolForQOS:(NSQualityOfService)qos llslog:(NSString *)llslog;

@end
