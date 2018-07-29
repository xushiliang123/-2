#import <UIKit/UIKit.h>
#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+HighlightedWebCache.h"
#import "UIView+WebCacheOperation.h"

@interface UIImageView (HighlightedWebCacheDeprecatedLlslog)
- (void)setHighlightedImageWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)cancelCurrentHighlightedImageLoadLlslog:(NSString *)llslog;

@end
