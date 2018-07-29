#import <Foundation/Foundation.h>
#import "SDWebImageManager.h"
#import "SDWebImagePrefetcher.h"

@interface SDWebImagePrefetcher (Llslog)
+ (void)sharedImagePrefetcherLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithImageManager:(SDWebImageManager *)manager llslog:(NSString *)llslog;
- (void)setMaxConcurrentDownloads:(NSUInteger)maxConcurrentDownloads llslog:(NSString *)llslog;
- (void)maxConcurrentDownloadsLlslog:(NSString *)llslog;
- (void)startPrefetchingAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)reportStatusLlslog:(NSString *)llslog;
- (void)prefetchURLs:(NSArray *)urls llslog:(NSString *)llslog;
- (void)prefetchURLs:(NSArray *)urls progress:(SDWebImagePrefetcherProgressBlock)progressBlock completed:(SDWebImagePrefetcherCompletionBlock)completionBlock llslog:(NSString *)llslog;
- (void)cancelPrefetchingLlslog:(NSString *)llslog;

@end
