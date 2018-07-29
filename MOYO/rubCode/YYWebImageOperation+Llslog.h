#import <UIKit/UIKit.h>
#import <YYKit/YYImageCache.h>
#import <YYKit/YYWebImageManager.h>
#import "YYImageCache.h"
#import "YYWebImageManager.h"
#import "YYWebImageOperation.h"
#import "UIApplication+YYAdd.h"
#import "YYImage.h"
#import "YYWeakProxy.h"
#import "UIImage+YYAdd.h"
#import <ImageIO/ImageIO.h>
#import "YYKitMacro.h"
#import "YYDispatchQueuePool.h"
#import <libkern/OSAtomic.h>

@interface YYWebImageOperation (Llslog)
+ (void)_networkThreadMain:(id)object llslog:(NSString *)llslog;
+ (void)_networkThreadLlslog:(NSString *)llslog;
+ (void)_imageQueueLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithRequest:(NSURLRequest *)request
                        options:(YYWebImageOptions)options
                          cache:(YYImageCache *)cache
                       cacheKey:(NSString *)cacheKey
                       progress:(YYWebImageProgressBlock)progress
                      transform:(YYWebImageTransformBlock)transform
                     completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)_endBackgroundTaskLlslog:(NSString *)llslog;
- (void)_finishLlslog:(NSString *)llslog;
- (void)_startOperationLlslog:(NSString *)llslog;
- (void)_startRequest:(id)object llslog:(NSString *)llslog;
- (void)_cancelOperationLlslog:(NSString *)llslog;
- (void)_didReceiveImageFromDiskCache:(UIImage *)image llslog:(NSString *)llslog;
- (void)_didReceiveImageFromWeb:(UIImage *)image llslog:(NSString *)llslog;
- (void)connectionShouldUseCredentialStorage:(NSURLConnection *)connection llslog:(NSString *)llslog;
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge llslog:(NSString *)llslog;
- (void)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse llslog:(NSString *)llslog;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response llslog:(NSString *)llslog;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data llslog:(NSString *)llslog;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection llslog:(NSString *)llslog;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)startLlslog:(NSString *)llslog;
- (void)cancelLlslog:(NSString *)llslog;
- (void)setExecuting:(BOOL)executing llslog:(NSString *)llslog;
- (void)isExecutingLlslog:(NSString *)llslog;
- (void)setFinished:(BOOL)finished llslog:(NSString *)llslog;
- (void)isFinishedLlslog:(NSString *)llslog;
- (void)setCancelled:(BOOL)cancelled llslog:(NSString *)llslog;
- (void)isCancelledLlslog:(NSString *)llslog;
- (void)isConcurrentLlslog:(NSString *)llslog;
- (void)isAsynchronousLlslog:(NSString *)llslog;
+ (void)automaticallyNotifiesObserversForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
