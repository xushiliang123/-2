#import <Foundation/Foundation.h>
#import "NSNotificationCenter+YYAdd.h"
#import "YYKitMacro.h"

@interface NSNotificationCenter (YYAddLlslog)
- (void)postNotificationOnMainThread:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)postNotificationOnMainThread:(NSNotification *)notification waitUntilDone:(BOOL)wait llslog:(NSString *)llslog;
- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object llslog:(NSString *)llslog;
- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo llslog:(NSString *)llslog;
- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo waitUntilDone:(BOOL)wait llslog:(NSString *)llslog;
+ (void)_yy_postNotification:(NSNotification *)notification llslog:(NSString *)llslog;
+ (void)_yy_postNotificationName:(NSDictionary *)info llslog:(NSString *)llslog;

@end
