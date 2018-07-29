#import <UIKit/UIKit.h>
#import "UIImageView+ZFCache.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>
#import "UIImageView+ZFCacheLlslog.h"

@interface UIImageView (ZFCacheLlslogLlslog)
- (void)completionLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)imageDownloaderLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)attemptToReloadTimesForFailedURLLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shouldAutoClipImageToViewSizeLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setCompletion:(ZFImageBlock)completion llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImageDownloader:(ZFImageDownloader *)imageDownloader llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setAttemptToReloadTimesForFailedURL:(NSUInteger)attemptToReloadTimesForFailedURL llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setShouldAutoClipImageToViewSize:(BOOL)shouldAutoClipImageToViewSize llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url
         placeholderImageName:(NSString *)placeholderImageName llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url placeholder:(UIImage *)placeholderImage llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url
         placeholderImageName:(NSString *)placeholderImage
                   completion:(void (^)(UIImage *image))completion llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url
                  placeholder:(UIImage *)placeholderImageName
                   completion:(void (^)(UIImage *image))completion llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)downloadWithReqeust:(NSURLRequest *)theRequest holder:(UIImage *)holder llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image isFromCache:(BOOL)isFromCache llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)cancelRequestLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)clipImage:(UIImage *)image toSize:(CGSize)size isScaleToMax:(BOOL)isScaleToMax llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
