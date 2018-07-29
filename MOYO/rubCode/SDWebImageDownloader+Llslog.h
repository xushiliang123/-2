#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"
#import "SDWebImageOperation.h"
#import "SDWebImageDownloader.h"
#import "SDWebImageDownloaderOperation.h"
#import <ImageIO/ImageIO.h>

@interface SDWebImageDownloader (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
+ (void)sharedDownloaderLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field llslog:(NSString *)llslog;
- (void)valueForHTTPHeaderField:(NSString *)field llslog:(NSString *)llslog;
- (void)setMaxConcurrentDownloads:(NSInteger)maxConcurrentDownloads llslog:(NSString *)llslog;
- (void)currentDownloadCountLlslog:(NSString *)llslog;
- (void)maxConcurrentDownloadsLlslog:(NSString *)llslog;
- (void)setOperationClass:(Class)operationClass llslog:(NSString *)llslog;
- (void)downloadImageWithURL:(NSURL *)url options:(SDWebImageDownloaderOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageDownloaderCompletedBlock)completedBlock llslog:(NSString *)llslog;
- (void)addProgressCallback:(SDWebImageDownloaderProgressBlock)progressBlock completedBlock:(SDWebImageDownloaderCompletedBlock)completedBlock forURL:(NSURL *)url createCallback:(SDWebImageNoParamsBlock)createCallback llslog:(NSString *)llslog;
- (void)setSuspended:(BOOL)suspended llslog:(NSString *)llslog;
- (void)cancelAllDownloadsLlslog:(NSString *)llslog;
- (void)operationWithTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
 willCacheResponse:(NSCachedURLResponse *)proposedResponse
 completionHandler:(void (^)(NSCachedURLResponse *cachedResponse))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler llslog:(NSString *)llslog;

@end
