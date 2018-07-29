#import "SDWebImageManager+Llslog.h"
@implementation SDWebImageManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCache:(SDImageCache *)cache downloader:(SDWebImageDownloader *)downloader llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cacheKeyForURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cachedImageExistsForURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)diskImageExistsForURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cachedImageExistsForURL:(NSURL *)url
                     completion:(SDWebImageCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)diskImageExistsForURL:(NSURL *)url
                   completion:(SDWebImageCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)downloadImageWithURL:(NSURL *)url
                                         options:(SDWebImageOptions)options
                                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(SDWebImageCompletionWithFinishedBlock)completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)saveImageToCache:(UIImage *)image forURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelAllLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isRunningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
