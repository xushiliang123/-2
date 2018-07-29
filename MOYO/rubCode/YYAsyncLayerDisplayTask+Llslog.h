#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "YYAsyncLayer.h"
#import "YYSentinel.h"
#import "YYDispatchQueuePool.h"
#import <libkern/OSAtomic.h>

@interface YYAsyncLayerDisplayTask (Llslog)
+ (void)defaultValueForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setNeedsDisplayLlslog:(NSString *)llslog;
- (void)displayLlslog:(NSString *)llslog;
- (void)_displayAsync:(BOOL)async llslog:(NSString *)llslog;
- (void)_cancelAsyncDisplayLlslog:(NSString *)llslog;

@end
