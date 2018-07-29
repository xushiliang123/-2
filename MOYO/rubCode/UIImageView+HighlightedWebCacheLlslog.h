#import <UIKit/UIKit.h>
#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+HighlightedWebCache.h"
#import "UIView+WebCacheOperation.h"

@interface UIImageView (HighlightedWebCacheLlslog)
- (void)sd_setHighlightedImageWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)sd_setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)sd_setHighlightedImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)sd_cancelCurrentHighlightedImageLoadLlslog:(NSString *)llslog;

@end
