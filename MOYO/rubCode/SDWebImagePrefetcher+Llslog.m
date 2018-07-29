#import "SDWebImagePrefetcher+Llslog.h"
@implementation SDWebImagePrefetcher (Llslog)
+ (void)sharedImagePrefetcherLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithImageManager:(SDWebImageManager *)manager llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setMaxConcurrentDownloads:(NSUInteger)maxConcurrentDownloads llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)maxConcurrentDownloadsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)startPrefetchingAtIndex:(NSUInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)reportStatusLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prefetchURLs:(NSArray *)urls llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prefetchURLs:(NSArray *)urls progress:(SDWebImagePrefetcherProgressBlock)progressBlock completed:(SDWebImagePrefetcherCompletionBlock)completionBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelPrefetchingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
