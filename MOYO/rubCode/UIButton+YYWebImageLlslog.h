#import <UIKit/UIKit.h>
#import <YYKit/YYWebImageManager.h>
#import "YYWebImageManager.h"
#import "UIButton+YYWebImage.h"
#import "YYWebImageOperation.h"
#import "_YYWebImageSetter.h"
#import "YYKitMacro.h"
#import <objc/runtime.h>

@interface UIButton (YYWebImageLlslog)
- (void)_setImageWithURL:(NSURL *)imageURL
          forSingleState:(NSNumber *)state
             placeholder:(UIImage *)placeholder
                 options:(YYWebImageOptions)options
                 manager:(YYWebImageManager *)manager
                progress:(YYWebImageProgressBlock)progress
               transform:(YYWebImageTransformBlock)transform
              completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)_cancelImageRequestForSingleState:(NSNumber *)state llslog:(NSString *)llslog;
- (void)imageURLForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
                manager:(YYWebImageManager *)manager
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)cancelImageRequestForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)_setBackgroundImageWithURL:(NSURL *)imageURL
                    forSingleState:(NSNumber *)state
                       placeholder:(UIImage *)placeholder
                           options:(YYWebImageOptions)options
                           manager:(YYWebImageManager *)manager
                          progress:(YYWebImageProgressBlock)progress
                         transform:(YYWebImageTransformBlock)transform
                        completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)_cancelBackgroundImageRequestForSingleState:(NSNumber *)state llslog:(NSString *)llslog;
- (void)backgroundImageURLForState:(UIControlState)state llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)setBackgroundImageWithURL:(NSURL *)imageURL
               forState:(UIControlState)state
            placeholder:(UIImage *)placeholder
                options:(YYWebImageOptions)options
                manager:(YYWebImageManager *)manager
               progress:(YYWebImageProgressBlock)progress
              transform:(YYWebImageTransformBlock)transform
             completion:(YYWebImageCompletionBlock)completion llslog:(NSString *)llslog;
- (void)cancelBackgroundImageRequestForState:(UIControlState)state llslog:(NSString *)llslog;

@end
