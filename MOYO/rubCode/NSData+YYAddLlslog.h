#import <Foundation/Foundation.h>
#import "NSData+YYAdd.h"
#import "YYKitMacro.h"

@interface NSData (YYAddLlslog)
- (void)md2StringLlslog:(NSString *)llslog;
- (void)md2DataLlslog:(NSString *)llslog;
- (void)md4StringLlslog:(NSString *)llslog;
- (void)md4DataLlslog:(NSString *)llslog;
- (void)md5StringLlslog:(NSString *)llslog;
- (void)md5DataLlslog:(NSString *)llslog;
- (void)sha1StringLlslog:(NSString *)llslog;
- (void)sha1DataLlslog:(NSString *)llslog;
- (void)sha224StringLlslog:(NSString *)llslog;
- (void)sha224DataLlslog:(NSString *)llslog;
- (void)sha256StringLlslog:(NSString *)llslog;
- (void)sha256DataLlslog:(NSString *)llslog;
- (void)sha384StringLlslog:(NSString *)llslog;
- (void)sha384DataLlslog:(NSString *)llslog;
- (void)sha512StringLlslog:(NSString *)llslog;
- (void)sha512DataLlslog:(NSString *)llslog;

- (void)hmacMD5StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacMD5DataWithKey:(NSData *)key llslog:(NSString *)llslog;
- (void)hmacSHA1StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA1DataWithKey:(NSData *)key llslog:(NSString *)llslog;
- (void)hmacSHA224StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA224DataWithKey:(NSData *)key llslog:(NSString *)llslog;
- (void)hmacSHA256StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA256DataWithKey:(NSData *)key llslog:(NSString *)llslog;
- (void)hmacSHA384StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA384DataWithKey:(NSData *)key llslog:(NSString *)llslog;
- (void)hmacSHA512StringWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)hmacSHA512DataWithKey:(NSData *)key llslog:(NSString *)llslog;
- (void)crc32StringLlslog:(NSString *)llslog;
- (void)crc32Llslog:(NSString *)llslog;
- (void)aes256EncryptWithKey:(NSData *)key iv:(NSData *)iv llslog:(NSString *)llslog;
- (void)aes256DecryptWithkey:(NSData *)key iv:(NSData *)iv llslog:(NSString *)llslog;
- (void)utf8StringLlslog:(NSString *)llslog;
- (void)hexStringLlslog:(NSString *)llslog;
+ (void)dataWithHexString:(NSString *)hexStr llslog:(NSString *)llslog;
- (void)base64EncodedStringLlslog:(NSString *)llslog;
+ (void)dataWithBase64EncodedString:(NSString *)base64EncodedString llslog:(NSString *)llslog;
- (void)jsonValueDecodedLlslog:(NSString *)llslog;
- (void)gzipInflateLlslog:(NSString *)llslog;
- (void)gzipDeflateLlslog:(NSString *)llslog;
- (void)zlibInflateLlslog:(NSString *)llslog;
- (void)zlibDeflateLlslog:(NSString *)llslog;
+ (void)dataNamed:(NSString *)name llslog:(NSString *)llslog;

@end
