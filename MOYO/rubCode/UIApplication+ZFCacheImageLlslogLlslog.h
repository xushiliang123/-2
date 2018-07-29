#import <UIKit/UIKit.h>
#import "UIImageView+ZFCache.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>
#import "UIApplication+ZFCacheImageLlslog.h"

@interface UIApplication (ZFCacheImageLlslogLlslog)
- (void)zf_cacheFaileTimesLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setZf_cacheFaileTimes:(NSMutableDictionary *)zf_cacheFaileTimes llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_clearCacheLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_clearDiskCachesLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_cacheImageForRequest:(NSURLRequest *)request llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_failTimesForRequest:(NSURLRequest *)request llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_cacheFailRequest:(NSURLRequest *)request llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
