#import "CALayer+YYWebImageLlslog.h"
@implementation CALayer (YYWebImageLlslog)
- (void)imageURLLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageURL:(NSURL *)imageURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL placeholder:(UIImage *)placeholder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL options:(YYWebImageOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
                manager:(YYWebImageManager *)manager
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelCurrentImageRequestLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
