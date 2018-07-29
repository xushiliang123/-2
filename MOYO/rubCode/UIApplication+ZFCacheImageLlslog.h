#import <UIKit/UIKit.h>
#import "UIImageView+ZFCache.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

@interface UIApplication (ZFCacheImageLlslog)
- (void)zf_cacheFaileTimesLlslog:(NSString *)llslog;
- (void)setZf_cacheFaileTimes:(NSMutableDictionary *)zf_cacheFaileTimes llslog:(NSString *)llslog;
- (void)zf_clearCacheLlslog:(NSString *)llslog;
- (void)zf_clearDiskCachesLlslog:(NSString *)llslog;
- (void)zf_cacheImageForRequest:(NSURLRequest *)request llslog:(NSString *)llslog;
- (void)zf_failTimesForRequest:(NSURLRequest *)request llslog:(NSString *)llslog;
- (void)zf_cacheFailRequest:(NSURLRequest *)request llslog:(NSString *)llslog;
- (void)zf_cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request llslog:(NSString *)llslog;

@end
