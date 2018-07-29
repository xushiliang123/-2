#import "UIButton+YYWebImageLlslog.h"
@implementation UIButton (YYWebImageLlslog)
- (void)_setImageWithURL:(NSURL *)imageURL
          forSingleState:(NSNumber *)state
             placeholder:(UIImage *)placeholder
                 options:(YYWebImageOptions)options
                 manager:(YYWebImageManager *)manager
                progress:(YYWebImageProgressBlock)progress
               transform:(YYWebImageTransformBlock)transform
              completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_cancelImageRequestForSingleState:(NSNumber *)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageURLForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
                manager:(YYWebImageManager *)manager
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelImageRequestForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_setBackgroundImageWithURL:(NSURL *)imageURL
                    forSingleState:(NSNumber *)state
                       placeholder:(UIImage *)placeholder
                           options:(YYWebImageOptions)options
                           manager:(YYWebImageManager *)manager
                          progress:(YYWebImageProgressBlock)progress
                         transform:(YYWebImageTransformBlock)transform
                        completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_cancelBackgroundImageRequestForSingleState:(NSNumber *)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)backgroundImageURLForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageWithURL:(NSURL *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageWithURL:(NSURL *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
                manager:(YYWebImageManager *)manager
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelBackgroundImageRequestForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
