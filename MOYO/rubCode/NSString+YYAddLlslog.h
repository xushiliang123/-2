#import <UIKit/UIKit.h>
#import "NSString+YYAdd.h"
#import "NSData+YYAdd.h"
#import "NSNumber+YYAdd.h"
#import "UIDevice+YYAdd.h"
#import "YYKitMacro.h"

@interface NSString (YYAddLlslog)
- (void)md2StringLlslog:(NSString *)llslog;
- (void)md4StringLlslog:(NSString *)llslog;
- (void)md5StringLlslog:(NSString *)llslog;
- (void)sha1StringLlslog:(NSString *)llslog;
- (void)sha224StringLlslog:(NSString *)llslog;
- (void)sha256StringLlslog:(NSString *)llslog;
- (void)sha384StringLlslog:(NSString *)llslog;
- (void)sha512StringLlslog:(NSString *)llslog;
- (void)crc32StringLlslog:(NSString *)llslog;
- (void)hmacMD5StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA1StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA224StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA256StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA384StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA512StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)base64EncodedStringLlslog:(NSString *)llslog;
+ (void)stringWithBase64EncodedString:(NSString *)base64EncodedString llslog:(NSString *)llslog;
- (void)stringByURLEncodeLlslog:(NSString *)llslog;
- (void)stringByURLDecodeLlslog:(NSString *)llslog;
- (void)stringByEscapingHTMLLlslog:(NSString *)llslog;
- (void)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode llslog:(NSString *)llslog;
- (void)widthForFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)heightForFont:(UIFont *)font width:(CGFloat)width llslog:(NSString *)llslog;
- (void)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options llslog:(NSString *)llslog;
- (void)enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block llslog:(NSString *)llslog;
- (void)stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement llslog:(NSString *)llslog;
- (void)charValueLlslog:(NSString *)llslog;
- (void)unsignedCharValueLlslog:(NSString *)llslog;
- (void)shortValueLlslog:(NSString *)llslog;
- (void)unsignedShortValueLlslog:(NSString *)llslog;
- (void)unsignedIntValueLlslog:(NSString *)llslog;
- (void)longValueLlslog:(NSString *)llslog;
- (void)unsignedLongValueLlslog:(NSString *)llslog;
- (void)unsignedLongLongValueLlslog:(NSString *)llslog;
- (void)unsignedIntegerValueLlslog:(NSString *)llslog;
+ (void)stringWithUUIDLlslog:(NSString *)llslog;
+ (void)stringWithUTF32Char:(UTF32Char)char32 llslog:(NSString *)llslog;
+ (void)stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length llslog:(NSString *)llslog;
- (void)enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block llslog:(NSString *)llslog;
- (void)stringByTrimLlslog:(NSString *)llslog;
- (void)stringByAppendingNameScale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)stringByAppendingPathScale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)pathScaleLlslog:(NSString *)llslog;
- (void)isNotBlankLlslog:(NSString *)llslog;
- (void)containsString:(NSString *)string llslog:(NSString *)llslog;
- (void)containsCharacterSet:(NSCharacterSet *)set llslog:(NSString *)llslog;
- (void)numberValueLlslog:(NSString *)llslog;
- (void)dataValueLlslog:(NSString *)llslog;
- (void)rangeOfAllLlslog:(NSString *)llslog;
- (void)jsonValueDecodedLlslog:(NSString *)llslog;
+ (void)stringNamed:(NSString *)name llslog:(NSString *)llslog;

@end
