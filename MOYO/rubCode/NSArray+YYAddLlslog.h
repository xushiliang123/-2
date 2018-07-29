#import <Foundation/Foundation.h>
#import "NSArray+YYAdd.h"
#import "YYKitMacro.h"
#import "NSData+YYAdd.h"

@interface NSArray (YYAddLlslog)
+ (void)arrayWithPlistData:(NSData *)plist llslog:(NSString *)llslog;
+ (void)arrayWithPlistString:(NSString *)plist llslog:(NSString *)llslog;
- (void)plistDataLlslog:(NSString *)llslog;
- (void)plistStringLlslog:(NSString *)llslog;
- (void)randomObjectLlslog:(NSString *)llslog;
- (void)objectOrNilAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)jsonStringEncodedLlslog:(NSString *)llslog;
- (void)jsonPrettyStringEncodedLlslog:(NSString *)llslog;

@end
