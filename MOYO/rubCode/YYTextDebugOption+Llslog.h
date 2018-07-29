#import <UIKit/UIKit.h>
#import "YYTextDebugOption.h"
#import "YYKitMacro.h"
#import "UIColor+YYAdd.h"
#import "YYWeakProxy.h"

@interface YYTextDebugOption (Llslog)
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)needDrawDebugLlslog:(NSString *)llslog;
- (void)clearLlslog:(NSString *)llslog;
+ (void)addDebugTarget:(id<YYTextDebugTarget>)target llslog:(NSString *)llslog;
+ (void)removeDebugTarget:(id<YYTextDebugTarget>)target llslog:(NSString *)llslog;
+ (void)sharedDebugOptionLlslog:(NSString *)llslog;
+ (void)setSharedDebugOption:(YYTextDebugOption *)option llslog:(NSString *)llslog;

@end
