#import <UIKit/UIKit.h>
#import <YYKit/YYWebImageManager.h>
#import "YYWebImageManager.h"
#import "UIImageView+YYWebImage.h"
#import "YYWebImageOperation.h"
#import "_YYWebImageSetter.h"
#import "YYKitMacro.h"
#import <objc/runtime.h>

@interface UIImageView (YYWebImageLlslog)
- (void)imageURLLlslog:(NSString *)llslog;
- (void)setImageURL:(NSURL *)imageURL llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL placeholder:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL options:(YYWebImageOptions)options llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
                manager:(YYWebImageManager *)manager
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)cancelCurrentImageRequestLlslog:(NSString *)llslog;
- (void)highlightedImageURLLlslog:(NSString *)llslog;
- (void)setHighlightedImageURL:(NSURL *)imageURL llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)imageURL placeholder:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)imageURL options:(YYWebImageOptions)options llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)imageURL
                       placeholder:(UIImage *)placeholder
                           options:(YYWebImageOptions)options
                        completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)imageURL
                       placeholder:(UIImage *)placeholder
                           options:(YYWebImageOptions)options
                          progress:(YYWebImageProgressBlock)progress
                         transform:(YYWebImageTransformBlock)transform
                        completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setHighlightedImageWithURL:(NSURL *)imageURL
                       placeholder:(UIImage *)placeholder
                           options:(YYWebImageOptions)options
                           manager:(YYWebImageManager *)manager
                          progress:(YYWebImageProgressBlock)progress
                         transform:(YYWebImageTransformBlock)transform
                        completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)cancelCurrentHighlightedImageRequestLlslog:(NSString *)llslog;

@end
