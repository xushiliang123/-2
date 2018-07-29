#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"

@interface UIImageView (WebCacheLlslog)
- (void)sd_setImageWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithPreviousCachedImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_imageURLLlslog:(NSString *)llslog;
- (void)sd_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs llslog:(NSString *)llslog;
- (void)sd_cancelCurrentImageLoadLlslog:(NSString *)llslog;
- (void)sd_cancelCurrentAnimationImagesLoadLlslog:(NSString *)llslog;
- (void)activityIndicatorLlslog:(NSString *)llslog;
- (void)setActivityIndicator:(UIActivityIndicatorView *)activityIndicator llslog:(NSString *)llslog;
- (void)setShowActivityIndicatorView:(BOOL)show llslog:(NSString *)llslog;
- (void)showActivityIndicatorViewLlslog:(NSString *)llslog;
- (void)setIndicatorStyle:(UIActivityIndicatorViewStyle)style llslog:(NSString *)llslog;
- (void)getIndicatorStyleLlslog:(NSString *)llslog;
- (void)addActivityIndicatorLlslog:(NSString *)llslog;
- (void)removeActivityIndicatorLlslog:(NSString *)llslog;

@end
