#import "UIImageView+AFNetworkingLlslog.h"
@implementation UIImageView (AFNetworkingLlslog)
+ (void)sharedImageDownloaderLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setSharedImageDownloader:(AFImageDownloader *)imageDownloader llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelImageDownloadTaskLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)clearActiveDownloadInformationLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isActiveTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
