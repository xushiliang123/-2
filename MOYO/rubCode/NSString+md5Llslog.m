#import "NSString+md5Llslog.h"
@implementation NSString (md5Llslog)
+ (void)zf_keyForRequest:(NSURLRequest *)request llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)zf_cachePathLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cachedFileNameForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
