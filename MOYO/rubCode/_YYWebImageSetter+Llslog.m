#import "_YYWebImageSetter+Llslog.h"
@implementation _YYWebImageSetter (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageURLLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setOperationWithSentinel:(int32_t)sentinel
                                url:(NSURL *)imageURL
                            options:(YYWebImageOptions)options
                            manager:(YYWebImageManager *)manager
                           progress:(YYWebImageProgressBlock)progress
                          transform:(YYWebImageTransformBlock)transform
                         completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelWithNewURL:(NSURL *)imageURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setterQueueLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
