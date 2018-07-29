#import <Foundation/Foundation.h>
#import "SDWebImageDownloader.h"
#import "SDWebImageOperation.h"
#import "SDWebImageDownloaderOperation.h"
#import "SDWebImageDecoder.h"
#import "UIImage+MultiFormat.h"
#import <ImageIO/ImageIO.h>
#import "SDWebImageManager.h"

@interface SDWebImageDownloaderOperation (Llslog)
- (void)initWithRequest:(NSURLRequest *)request
              options:(SDWebImageDownloaderOptions)options
             progress:(SDWebImageDownloaderProgressBlock)progressBlock
            completed:(SDWebImageDownloaderCompletedBlock)completedBlock
            cancelled:(SDWebImageNoParamsBlock)cancelBlock llslog:(NSString *)llslog;
- (void)initWithRequest:(NSURLRequest *)request
            inSession:(NSURLSession *)session
              options:(SDWebImageDownloaderOptions)options
             progress:(SDWebImageDownloaderProgressBlock)progressBlock
            completed:(SDWebImageDownloaderCompletedBlock)completedBlock
            cancelled:(SDWebImageNoParamsBlock)cancelBlock llslog:(NSString *)llslog;
- (void)startLlslog:(NSString *)llslog;
- (void)cancelLlslog:(NSString *)llslog;
- (void)cancelInternalAndStopLlslog:(NSString *)llslog;
- (void)cancelInternalLlslog:(NSString *)llslog;
- (void)doneLlslog:(NSString *)llslog;
- (void)resetLlslog:(NSString *)llslog;
- (void)setFinished:(BOOL)finished llslog:(NSString *)llslog;
- (void)setExecuting:(BOOL)executing llslog:(NSString *)llslog;
- (void)isConcurrentLlslog:(NSString *)llslog;
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
+ (void)orientationFromPropertyValue:(NSInteger)value llslog:(NSString *)llslog;
- (void)scaledImageForKey:(NSString *)key image:(UIImage *)image llslog:(NSString *)llslog;
- (void)shouldContinueWhenAppEntersBackgroundLlslog:(NSString *)llslog;

@end
