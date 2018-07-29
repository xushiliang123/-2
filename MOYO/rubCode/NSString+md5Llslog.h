#import <UIKit/UIKit.h>
#import "UIImageView+ZFCache.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (md5Llslog)
+ (void)zf_keyForRequest:(NSURLRequest *)request llslog:(NSString *)llslog;
+ (void)zf_cachePathLlslog:(NSString *)llslog;
+ (void)cachedFileNameForKey:(NSString *)key llslog:(NSString *)llslog;

@end
