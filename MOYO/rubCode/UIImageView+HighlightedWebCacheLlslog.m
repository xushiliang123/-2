#import "UIImageView+HighlightedWebCacheLlslog.h"
@implementation UIImageView (HighlightedWebCacheLlslog)
- (void)sd_setHighlightedImageWithURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_setHighlightedImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_setHighlightedImageWithURL:(NSURL *)url options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_cancelCurrentHighlightedImageLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
