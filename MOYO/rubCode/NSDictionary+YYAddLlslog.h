#import <UIKit/UIKit.h>
#import "NSDictionary+YYAdd.h"
#import "NSString+YYAdd.h"
#import "NSData+YYAdd.h"
#import "YYKitMacro.h"

@interface NSDictionary (YYAddLlslog)
+ (void)dictionaryWithPlistData:(NSData *)plist llslog:(NSString *)llslog;
+ (void)dictionaryWithPlistString:(NSString *)plist llslog:(NSString *)llslog;
- (void)plistDataLlslog:(NSString *)llslog;
- (void)plistStringLlslog:(NSString *)llslog;
- (void)allKeysSortedLlslog:(NSString *)llslog;
- (void)allValuesSortedByKeysLlslog:(NSString *)llslog;
- (void)containsObjectForKey:(id)key llslog:(NSString *)llslog;
- (void)entriesForKeys:(NSArray *)keys llslog:(NSString *)llslog;
- (void)jsonStringEncodedLlslog:(NSString *)llslog;
- (void)jsonPrettyStringEncodedLlslog:(NSString *)llslog;
+ (void)dictionaryWithXML:(id)xml llslog:(NSString *)llslog;
- (void)boolValueForKey:(NSString *)key default:(BOOL)def llslog:(NSString *)llslog;
- (void)charValueForKey:(NSString *)key default:(char)def llslog:(NSString *)llslog;
- (void)unsignedCharValueForKey:(NSString *)key default:(unsigned char)def llslog:(NSString *)llslog;
- (void)shortValueForKey:(NSString *)key default:(short)def llslog:(NSString *)llslog;
- (void)unsignedShortValueForKey:(NSString *)key default:(unsigned short)def llslog:(NSString *)llslog;
- (void)intValueForKey:(NSString *)key default:(int)def llslog:(NSString *)llslog;
- (void)unsignedIntValueForKey:(NSString *)key default:(unsigned int)def llslog:(NSString *)llslog;
- (void)longValueForKey:(NSString *)key default:(long)def llslog:(NSString *)llslog;
- (void)unsignedLongValueForKey:(NSString *)key default:(unsigned long)def llslog:(NSString *)llslog;
- (void)longLongValueForKey:(NSString *)key default:(long long)def llslog:(NSString *)llslog;
- (void)unsignedLongLongValueForKey:(NSString *)key default:(unsigned long long)def llslog:(NSString *)llslog;
- (void)floatValueForKey:(NSString *)key default:(float)def llslog:(NSString *)llslog;
- (void)doubleValueForKey:(NSString *)key default:(double)def llslog:(NSString *)llslog;
- (void)integerValueForKey:(NSString *)key default:(NSInteger)def llslog:(NSString *)llslog;
- (void)unsignedIntegerValueForKey:(NSString *)key default:(NSUInteger)def llslog:(NSString *)llslog;
- (void)numberValueForKey:(NSString *)key default:(NSNumber *)def llslog:(NSString *)llslog;
- (void)stringValueForKey:(NSString *)key default:(NSString *)def llslog:(NSString *)llslog;

@end
