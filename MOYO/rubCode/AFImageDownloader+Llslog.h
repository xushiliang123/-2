#import <TargetConditionals.h>
#import <Foundation/Foundation.h>
#import "AFAutoPurgingImageCache.h"
#import "AFHTTPSessionManager.h"
#import <TargetConditionals.h>
#import "AFImageDownloader.h"
#import "AFHTTPSessionManager.h"

@interface AFImageDownloader (Llslog)
+ (void)defaultURLCacheLlslog:(NSString *)llslog;
+ (void)defaultURLSessionConfigurationLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithSessionManager:(AFHTTPSessionManager *)sessionManager
                downloadPrioritization:(AFImageDownloadPrioritization)downloadPrioritization
                maximumActiveDownloads:(NSInteger)maximumActiveDownloads
                            imageCache:(id <AFImageRequestCache>)imageCache llslog:(NSString *)llslog;
+ (void)defaultInstanceLlslog:(NSString *)llslog;
- (void)downloadImageForURLRequest:(NSURLRequest *)request
                                                        success:(void (^)(NSURLRequest * _Nonnull, NSHTTPURLResponse * _Nullable, UIImage * _Nonnull))success
                                                        failure:(void (^)(NSURLRequest * _Nonnull, NSHTTPURLResponse * _Nullable, NSError * _Nonnull))failure llslog:(NSString *)llslog;
- (void)downloadImageForURLRequest:(NSURLRequest *)request
                                                  withReceiptID:(nonnull NSUUID *)receiptID
                                                        success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse  * _Nullable response, UIImage *responseObject))success
                                                        failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog;
- (void)cancelTaskForImageDownloadReceipt:(AFImageDownloadReceipt *)imageDownloadReceipt llslog:(NSString *)llslog;
- (void)safelyRemoveMergedTaskWithURLIdentifier:(NSString *)URLIdentifier llslog:(NSString *)llslog;
- (void)removeMergedTaskWithURLIdentifier:(NSString *)URLIdentifier llslog:(NSString *)llslog;
- (void)safelyDecrementActiveTaskCountLlslog:(NSString *)llslog;
- (void)safelyStartNextTaskIfNecessaryLlslog:(NSString *)llslog;

- (void)dequeueMergedTaskLlslog:(NSString *)llslog;
- (void)isActiveRequestCountBelowMaximumLimitLlslog:(NSString *)llslog;

@end
