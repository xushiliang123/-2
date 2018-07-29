#import "UIButton+AFNetworkingLlslog.h"
@implementation UIButton (AFNetworkingLlslog)
+ (void)sharedImageDownloaderLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setSharedImageDownloader:(AFImageDownloader *)imageDownloader llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageForState:(UIControlState)state
                 withURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageForState:(UIControlState)state
                 withURL:(NSURL *)url
        placeholderImage:(UIImage *)placeholderImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageForState:(UIControlState)state
          withURLRequest:(NSURLRequest *)urlRequest
        placeholderImage:(nullable UIImage *)placeholderImage
                 success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                 failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageForState:(UIControlState)state
                           withURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageForState:(UIControlState)state
                           withURL:(NSURL *)url
                  placeholderImage:(nullable UIImage *)placeholderImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setBackgroundImageForState:(UIControlState)state
                    withURLRequest:(NSURLRequest *)urlRequest
                  placeholderImage:(nullable UIImage *)placeholderImage
                           success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                           failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelImageDownloadTaskForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelBackgroundImageDownloadTaskForState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isActiveTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest forState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isActiveBackgroundTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest forState:(UIControlState)state llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
