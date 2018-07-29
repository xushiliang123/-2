#import <Foundation/Foundation.h>
#import "AFURLResponseSerialization.h"
#import "AFURLRequestSerialization.h"
#import "AFSecurityPolicy.h"
#import "AFNetworkReachabilityManager.h"
#import "AFURLSessionManager.h"
#import <objc/runtime.h>

@interface AFURLSessionManager (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)taskDescriptionForSessionTasksLlslog:(NSString *)llslog;
- (void)taskDidResume:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)taskDidSuspend:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)delegateForTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;

- (void)addDelegateForDataTask:(NSURLSessionDataTask *)dataTask
                uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
              downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
             completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)addDelegateForUploadTask:(NSURLSessionUploadTask *)uploadTask
                        progress:(void (^)(NSProgress *uploadProgress)) uploadProgressBlock
               completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)addDelegateForDownloadTask:(NSURLSessionDownloadTask *)downloadTask
                          progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                       destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                 completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)removeDelegateForTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;
- (void)tasksForKeyPath:(NSString *)keyPath llslog:(NSString *)llslog;
- (void)tasksLlslog:(NSString *)llslog;
- (void)dataTasksLlslog:(NSString *)llslog;
- (void)uploadTasksLlslog:(NSString *)llslog;
- (void)downloadTasksLlslog:(NSString *)llslog;
- (void)invalidateSessionCancelingTasks:(BOOL)cancelPendingTasks llslog:(NSString *)llslog;
- (void)setResponseSerializer:(id <AFURLResponseSerialization>)responseSerializer llslog:(NSString *)llslog;
- (void)addNotificationObserverForTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;
- (void)removeNotificationObserverForTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;
- (void)dataTaskWithRequest:(NSURLRequest *)request
                            completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)dataTaskWithRequest:(NSURLRequest *)request
                               uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
                             downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                            completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler llslog:(NSString *)llslog;
- (void)uploadTaskWithRequest:(NSURLRequest *)request
                                         fromFile:(NSURL *)fileURL
                                         progress:(void (^)(NSProgress *uploadProgress)) uploadProgressBlock
                                completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)uploadTaskWithRequest:(NSURLRequest *)request
                                         fromData:(NSData *)bodyData
                                         progress:(void (^)(NSProgress *uploadProgress)) uploadProgressBlock
                                completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)uploadTaskWithStreamedRequest:(NSURLRequest *)request
                                                 progress:(void (^)(NSProgress *uploadProgress)) uploadProgressBlock
                                        completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)downloadTaskWithRequest:(NSURLRequest *)request
                                             progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                                          destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                                    completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)downloadTaskWithResumeData:(NSData *)resumeData
                                                progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                                             destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                                       completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler llslog:(NSString *)llslog;
- (void)uploadProgressForTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;
- (void)downloadProgressForTask:(NSURLSessionTask *)task llslog:(NSString *)llslog;
- (void)setSessionDidBecomeInvalidBlock:(void (^)(NSURLSession *session, NSError *error))block llslog:(NSString *)llslog;
- (void)setSessionDidReceiveAuthenticationChallengeBlock:(NSURLSessionAuthChallengeDisposition (^)(NSURLSession *session, NSURLAuthenticationChallenge *challenge, NSURLCredential * __autoreleasing *credential))block llslog:(NSString *)llslog;
- (void)setDidFinishEventsForBackgroundURLSessionBlock:(void (^)(NSURLSession *session))block llslog:(NSString *)llslog;
- (void)setTaskNeedNewBodyStreamBlock:(NSInputStream * (^)(NSURLSession *session, NSURLSessionTask *task))block llslog:(NSString *)llslog;
- (void)setTaskWillPerformHTTPRedirectionBlock:(NSURLRequest * (^)(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request))block llslog:(NSString *)llslog;
- (void)setTaskDidReceiveAuthenticationChallengeBlock:(NSURLSessionAuthChallengeDisposition (^)(NSURLSession *session, NSURLSessionTask *task, NSURLAuthenticationChallenge *challenge, NSURLCredential * __autoreleasing *credential))block llslog:(NSString *)llslog;
- (void)setTaskDidSendBodyDataBlock:(void (^)(NSURLSession *session, NSURLSessionTask *task, int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend))block llslog:(NSString *)llslog;
- (void)setTaskDidCompleteBlock:(void (^)(NSURLSession *session, NSURLSessionTask *task, NSError *error))block llslog:(NSString *)llslog;
- (void)setDataTaskDidReceiveResponseBlock:(NSURLSessionResponseDisposition (^)(NSURLSession *session, NSURLSessionDataTask *dataTask, NSURLResponse *response))block llslog:(NSString *)llslog;
- (void)setDataTaskDidBecomeDownloadTaskBlock:(void (^)(NSURLSession *session, NSURLSessionDataTask *dataTask, NSURLSessionDownloadTask *downloadTask))block llslog:(NSString *)llslog;
- (void)setDataTaskDidReceiveDataBlock:(void (^)(NSURLSession *session, NSURLSessionDataTask *dataTask, NSData *data))block llslog:(NSString *)llslog;
- (void)setDataTaskWillCacheResponseBlock:(NSCachedURLResponse * (^)(NSURLSession *session, NSURLSessionDataTask *dataTask, NSCachedURLResponse *proposedResponse))block llslog:(NSString *)llslog;
- (void)setDownloadTaskDidFinishDownloadingBlock:(NSURL * (^)(NSURLSession *session, NSURLSessionDownloadTask *downloadTask, NSURL *location))block llslog:(NSString *)llslog;
- (void)setDownloadTaskDidWriteDataBlock:(void (^)(NSURLSession *session, NSURLSessionDownloadTask *downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite))block llslog:(NSString *)llslog;
- (void)setDownloadTaskDidResumeBlock:(void (^)(NSURLSession *session, NSURLSessionDownloadTask *downloadTask, int64_t fileOffset, int64_t expectedTotalBytes))block llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;
- (void)respondsToSelector:(SEL)selector llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
didBecomeInvalidWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
willPerformHTTPRedirection:(NSHTTPURLResponse *)response
        newRequest:(NSURLRequest *)request
 completionHandler:(void (^)(NSURLRequest *))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
 needNewBodyStream:(void (^)(NSInputStream *bodyStream))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent
totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
 willCacheResponse:(NSCachedURLResponse *)proposedResponse
 completionHandler:(void (^)(NSCachedURLResponse *cachedResponse))completionHandler llslog:(NSString *)llslog;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite llslog:(NSString *)llslog;
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes llslog:(NSString *)llslog;
+ (void)supportsSecureCodingLlslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
