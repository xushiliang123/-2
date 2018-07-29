#import <UIKit/UIKit.h>
#import "UIImageView+ZFCache.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

@interface ZFImageDownloader (Llslog)
- (void)startDownloadImageWithUrl:(NSString *)url
                         progress:(ZFDownloadProgressBlock)progress
                         finished:(ZFDownLoadDataCallBack)finished llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error llslog:(NSString *)llslog;

@end
