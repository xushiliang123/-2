#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"

@interface UIImageView (WebCacheDeprecatedLlslog)
- (void)imageURLLlslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithPreviousCachedImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)cancelCurrentArrayLoadLlslog:(NSString *)llslog;
- (void)cancelCurrentImageLoadLlslog:(NSString *)llslog;
- (void)setAnimationImagesWithURLs:(NSArray *)arrayOfURLs llslog:(NSString *)llslog;

@end
