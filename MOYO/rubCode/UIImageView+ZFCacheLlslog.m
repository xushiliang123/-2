#import "UIImageView+ZFCacheLlslog.h"
@implementation UIImageView (ZFCacheLlslog)
- (void)completionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageDownloaderLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)attemptToReloadTimesForFailedURLLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)shouldAutoClipImageToViewSizeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCompletion:(ZFImageBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageDownloader:(ZFImageDownloader *)imageDownloader llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAttemptToReloadTimesForFailedURL:(NSUInteger)attemptToReloadTimesForFailedURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setShouldAutoClipImageToViewSize:(BOOL)shouldAutoClipImageToViewSize llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURLString:(NSString *)url
         placeholderImageName:(NSString *)placeholderImageName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURLString:(NSString *)url placeholder:(UIImage *)placeholderImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURLString:(NSString *)url
         placeholderImageName:(NSString *)placeholderImage
                   completion:(void (^)(UIImage *image))completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURLString:(NSString *)url
                  placeholder:(UIImage *)placeholderImageName
                   completion:(void (^)(UIImage *image))completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)downloadWithReqeust:(NSURLRequest *)theRequest holder:(UIImage *)holder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImage:(UIImage *)image isFromCache:(BOOL)isFromCache llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelRequestLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)clipImage:(UIImage *)image toSize:(CGSize)size isScaleToMax:(BOOL)isScaleToMax llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
