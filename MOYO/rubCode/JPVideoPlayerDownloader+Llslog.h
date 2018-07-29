#import <Foundation/Foundation.h>
#import "JPVideoPlayerCompat.h"
#import "JPVideoPlayerDownloader.h"
#import "JPVideoPlayerDownloaderOperation.h"

@interface JPVideoPlayerDownloader (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithSessionConfiguration:(nullable NSURLSessionConfiguration *)sessionConfiguration llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setValue:(nullable NSString *)value forHTTPHeaderField:(nullable NSString *)field llslog:(NSString *)llslog;
- (void)valueForHTTPHeaderField:(nullable NSString *)field llslog:(NSString *)llslog;
+ (void)sharedDownloaderLlslog:(NSString *)llslog;
- (void)downloadVideoWithURL:(NSURL *)url options:(JPVideoPlayerDownloaderOptions)options progress:(JPVideoPlayerDownloaderProgressBlock)progressBlock completed:(JPVideoPlayerDownloaderErrorBlock)errorBlock llslog:(NSString *)llslog;
- (void)cancel:(JPVideoPlayerDownloadToken *)token llslog:(NSString *)llslog;
- (void)cancelAllDownloadsLlslog:(NSString *)llslog;
- (void)addProgressCallback:(JPVideoPlayerDownloaderProgressBlock)progressBlock completedBlock:(JPVideoPlayerDownloaderErrorBlock)errorBlock forURL:(nullable NSURL *)url createCallback:(JPVideoPlayerDownloaderOperation *(^)())createCallback llslog:(NSString *)llslog;

@end
