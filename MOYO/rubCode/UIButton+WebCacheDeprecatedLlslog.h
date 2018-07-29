#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIButton+WebCache.h"
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"

@interface UIButton (WebCacheDeprecatedLlslog)
- (void)currentImageURLLlslog:(NSString *)llslog;
- (void)imageURLForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)cancelCurrentImageLoadLlslog:(NSString *)llslog;
- (void)cancelBackgroundImageLoadForState:(UIControlState)state llslog:(NSString *)llslog;

@end
