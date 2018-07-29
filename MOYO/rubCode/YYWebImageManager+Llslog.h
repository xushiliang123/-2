#import <UIKit/UIKit.h>
#import <YYKit/YYImageCache.h>
#import "YYImageCache.h"
#import "YYWebImageManager.h"
#import "YYImageCache.h"
#import "YYWebImageOperation.h"
#import "YYImageCoder.h"

@interface YYWebImageManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithCache:(YYImageCache *)cache queue:(NSOperationQueue *)queue llslog:(NSString *)llslog;
- (void)requestImageWithURL:(NSURL *)url
                                     options:(YYWebImageOptions)options
                                    progress:(YYWebImageProgressBlock)progress
                                   transform:(YYWebImageTransformBlock)transform
                                  completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)headersForURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)cacheKeyForURL:(NSURL *)url llslog:(NSString *)llslog;

@end
