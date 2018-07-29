#import <UIKit/UIKit.h>
#import "JPVideoPlayerDownloader.h"
#import "JPVideoPlayerDownloaderOperation.h"
#import "JPVideoPlayerCachePathTool.h"
#import "JPVideoPlayerManager.h"

@interface JPVideoPlayerDownloaderOperation (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithRequest:(nullable NSURLRequest *)request
                              inSession:(nullable NSURLSession *)session
                                options:(JPVideoPlayerDownloaderOptions)options llslog:(NSString *)llslog;
- (void)addHandlersForProgress:(nullable JPVideoPlayerDownloaderProgressBlock)progressBlock error:(nullable JPVideoPlayerDownloaderErrorBlock)errorBlock llslog:(NSString *)llslog;
- (void)cancel:(nullable id)token llslog:(NSString *)llslog;
- (void)startLlslog:(NSString *)llslog;
- (void)cancelLlslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask willCacheResponse:(NSCachedURLResponse *)proposedResponse completionHandler:(void (^)(NSCachedURLResponse *cachedResponse))completionHandler llslog:(NSString *)llslog;
- (void)cancelInternalLlslog:(NSString *)llslog;
- (void)doneLlslog:(NSString *)llslog;
- (void)callErrorBlocksWithError:(nullable NSError *)error llslog:(NSString *)llslog;
- (void)callbacksForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)shouldContinueWhenAppEntersBackgroundLlslog:(NSString *)llslog;
- (void)resetLlslog:(NSString *)llslog;
- (void)setFinished:(BOOL)finished llslog:(NSString *)llslog;
- (void)setExecuting:(BOOL)executing llslog:(NSString *)llslog;
- (void)isConcurrentLlslog:(NSString *)llslog;

@end
