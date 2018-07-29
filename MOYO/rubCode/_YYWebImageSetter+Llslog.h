#import <YYKit/YYWebImageManager.h>
#import "YYWebImageManager.h"
#import "_YYWebImageSetter.h"
#import "YYWebImageOperation.h"
#import <libkern/OSAtomic.h>

@interface _YYWebImageSetter (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)imageURLLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setOperationWithSentinel:(int32_t)sentinel
                                url:(NSURL *)imageURL
                            options:(YYWebImageOptions)options
                            manager:(YYWebImageManager *)manager
                           progress:(YYWebImageProgressBlock)progress
                          transform:(YYWebImageTransformBlock)transform
                         completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)cancelLlslog:(NSString *)llslog;
- (void)cancelWithNewURL:(NSURL *)imageURL llslog:(NSString *)llslog;
+ (void)setterQueueLlslog:(NSString *)llslog;

@end
