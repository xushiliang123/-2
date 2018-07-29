#import <Foundation/Foundation.h>
#import "NSArray+YYAdd.h"
#import "YYKitMacro.h"
#import "NSData+YYAdd.h"

@interface NSMutableArray (YYAddLlslog)
+ (void)arrayWithPlistData:(NSData *)plist llslog:(NSString *)llslog;
+ (void)arrayWithPlistString:(NSString *)plist llslog:(NSString *)llslog;
- (void)removeFirstObjectLlslog:(NSString *)llslog;
- (void)removeLastObjectLlslog:(NSString *)llslog;
- (void)popFirstObjectLlslog:(NSString *)llslog;
- (void)popLastObjectLlslog:(NSString *)llslog;
- (void)appendObject:(id)anObject llslog:(NSString *)llslog;
- (void)prependObject:(id)anObject llslog:(NSString *)llslog;
- (void)appendObjects:(NSArray *)objects llslog:(NSString *)llslog;
- (void)prependObjects:(NSArray *)objects llslog:(NSString *)llslog;
- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)reverseLlslog:(NSString *)llslog;
- (void)shuffleLlslog:(NSString *)llslog;

@end
