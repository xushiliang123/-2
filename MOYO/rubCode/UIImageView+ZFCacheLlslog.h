#import <UIKit/UIKit.h>
#import "UIImageView+ZFCache.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

@interface UIImageView (ZFCacheLlslog)
- (void)completionLlslog:(NSString *)llslog;
- (void)imageDownloaderLlslog:(NSString *)llslog;
- (void)attemptToReloadTimesForFailedURLLlslog:(NSString *)llslog;
- (void)shouldAutoClipImageToViewSizeLlslog:(NSString *)llslog;
- (void)setCompletion:(ZFImageBlock)completion llslog:(NSString *)llslog;
- (void)setImageDownloader:(ZFImageDownloader *)imageDownloader llslog:(NSString *)llslog;
- (void)setAttemptToReloadTimesForFailedURL:(NSUInteger)attemptToReloadTimesForFailedURL llslog:(NSString *)llslog;
- (void)setShouldAutoClipImageToViewSize:(BOOL)shouldAutoClipImageToViewSize llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url
         placeholderImageName:(NSString *)placeholderImageName llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url placeholder:(UIImage *)placeholderImage llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url
         placeholderImageName:(NSString *)placeholderImage
                   completion:(void (^)(UIImage *image))completion llslog:(NSString *)llslog;
- (void)setImageWithURLString:(NSString *)url
                  placeholder:(UIImage *)placeholderImageName
                   completion:(void (^)(UIImage *image))completion llslog:(NSString *)llslog;
- (void)downloadWithReqeust:(NSURLRequest *)theRequest holder:(UIImage *)holder llslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image isFromCache:(BOOL)isFromCache llslog:(NSString *)llslog;
- (void)cancelRequestLlslog:(NSString *)llslog;
- (void)clipImage:(UIImage *)image toSize:(CGSize)size isScaleToMax:(BOOL)isScaleToMax llslog:(NSString *)llslog;

@end
