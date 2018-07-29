#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import "UIButton+AFNetworking.h"
#import <objc/runtime.h>
#import "UIImageView+AFNetworking.h"
#import "AFImageDownloader.h"

@interface UIButton (AFNetworkingLlslog)
+ (void)sharedImageDownloaderLlslog:(NSString *)llslog;
+ (void)setSharedImageDownloader:(AFImageDownloader *)imageDownloader llslog:(NSString *)llslog;
- (void)setImageForState:(UIControlState)state
                 withURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)setImageForState:(UIControlState)state
                 withURL:(NSURL *)url
        placeholderImage:(UIImage *)placeholderImage llslog:(NSString *)llslog;
- (void)setImageForState:(UIControlState)state
          withURLRequest:(NSURLRequest *)urlRequest
        placeholderImage:(nullable UIImage *)placeholderImage
                 success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                 failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog;
- (void)setBackgroundImageForState:(UIControlState)state
                           withURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)setBackgroundImageForState:(UIControlState)state
                           withURL:(NSURL *)url
                  placeholderImage:(nullable UIImage *)placeholderImage llslog:(NSString *)llslog;
- (void)setBackgroundImageForState:(UIControlState)state
                    withURLRequest:(NSURLRequest *)urlRequest
                  placeholderImage:(nullable UIImage *)placeholderImage
                           success:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, UIImage *image))success
                           failure:(nullable void (^)(NSURLRequest *request, NSHTTPURLResponse * _Nullable response, NSError *error))failure llslog:(NSString *)llslog;
- (void)cancelImageDownloadTaskForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)cancelBackgroundImageDownloadTaskForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)isActiveTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest forState:(UIControlState)state llslog:(NSString *)llslog;
- (void)isActiveBackgroundTaskURLEqualToURLRequest:(NSURLRequest *)urlRequest forState:(UIControlState)state llslog:(NSString *)llslog;

@end
