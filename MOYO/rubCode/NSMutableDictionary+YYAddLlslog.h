#import <UIKit/UIKit.h>
#import "NSDictionary+YYAdd.h"
#import "NSString+YYAdd.h"
#import "NSData+YYAdd.h"
#import "YYKitMacro.h"

@interface NSMutableDictionary (YYAddLlslog)
+ (void)dictionaryWithPlistData:(NSData *)plist llslog:(NSString *)llslog;
+ (void)dictionaryWithPlistString:(NSString *)plist llslog:(NSString *)llslog;
- (void)popObjectForKey:(id)aKey llslog:(NSString *)llslog;
- (void)popEntriesForKeys:(NSArray *)keys llslog:(NSString *)llslog;

@end
