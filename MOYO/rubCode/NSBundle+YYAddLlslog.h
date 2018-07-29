#import <Foundation/Foundation.h>
#import "NSBundle+YYAdd.h"
#import "NSString+YYAdd.h"
#import "YYKitMacro.h"

@interface NSBundle (YYAddLlslog)
+ (void)preferredScalesLlslog:(NSString *)llslog;
+ (void)pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath llslog:(NSString *)llslog;
- (void)pathForScaledResource:(NSString *)name ofType:(NSString *)ext llslog:(NSString *)llslog;
- (void)pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath llslog:(NSString *)llslog;

@end
