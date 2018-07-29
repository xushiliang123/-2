#import "SDWebImageCompat.h"
#import "SDWebImageOperation.h"
#import "SDWebImageDownloader.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import <objc/message.h>

@interface SDWebImageManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithCache:(SDImageCache *)cache downloader:(SDWebImageDownloader *)downloader llslog:(NSString *)llslog;
- (void)cacheKeyForURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)cachedImageExistsForURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)diskImageExistsForURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)cachedImageExistsForURL:(NSURL *)url
                     completion:(SDWebImageCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog;
- (void)diskImageExistsForURL:(NSURL *)url
                   completion:(SDWebImageCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog;
- (void)downloadImageWithURL:(NSURL *)url
                                         options:(SDWebImageOptions)options
                                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(SDWebImageCompletionWithFinishedBlock)completedBlock llslog:(NSString *)llslog;
- (void)saveImageToCache:(UIImage *)image forURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)cancelAllLlslog:(NSString *)llslog;
- (void)isRunningLlslog:(NSString *)llslog;

@end
