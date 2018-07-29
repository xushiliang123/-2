#import "YYWebImageManager+Llslog.h"
@implementation YYWebImageManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCache:(YYImageCache *)cache queue:(NSOperationQueue *)queue llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)requestImageWithURL:(NSURL *)url
                                     options:(YYWebImageOptions)options
                                    progress:(YYWebImageProgressBlock)progress
                                   transform:(YYWebImageTransformBlock)transform
                                  completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)headersForURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cacheKeyForURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
