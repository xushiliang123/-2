#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"
#import <objc/runtime.h>
#import "AFImageDownloader.h"

@interface UIImageView (AFNetworkingLlslog)
+ (void)sharedImageDownloaderLlslog:(NSString *)llslog;
+ (void)setSharedImageDownloader:(AFImageDownloader *)imageDownloader llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage llslog:(NSString *)llslog;
- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog;
- (void)cancelImageDownloadTaskLlslog:(NSString *)llslog;
- (void)clearActiveDownloadInformationLlslog:(NSString *)llslog;
- (void)isActiveTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest llslog:(NSString *)llslog;

@end
