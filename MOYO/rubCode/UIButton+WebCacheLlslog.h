#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIButton+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"

@interface UIButton (WebCacheLlslog)
- (void)sd_currentImageURLLlslog:(NSString *)llslog;
- (void)sd_imageURLForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setImageLoadOperation:(id<SDWebImageOperation>)operation forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)sd_cancelImageLoadForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)sd_setBackgroundImageLoadOperation:(id<SDWebImageOperation>)operation forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)sd_cancelBackgroundImageLoadForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)imageURLStorageLlslog:(NSString *)llslog;

@end
