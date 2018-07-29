#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import "MWPhotoProtocol.h"
#import <SDWebImage/SDWebImageDecoder.h>
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/SDWebImageOperation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MWPhoto.h"
#import "MWPhotoBrowser.h"

@interface MWPhoto (Llslog)
+ (void)photoWithImage:(UIImage *)image llslog:(NSString *)llslog;
+ (void)photoWithURL:(NSURL *)url llslog:(NSString *)llslog;
+ (void)photoWithAsset:(PHAsset *)asset targetSize:(CGSize)targetSize llslog:(NSString *)llslog;
+ (void)videoWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)initWithAsset:(PHAsset *)asset targetSize:(CGSize)targetSize llslog:(NSString *)llslog;
- (void)initWithVideoURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)setupLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setVideoURL:(NSURL *)videoURL llslog:(NSString *)llslog;
- (void)getVideoURL:(void (^)(NSURL *url))completion llslog:(NSString *)llslog;
- (void)underlyingImageLlslog:(NSString *)llslog;
- (void)loadUnderlyingImageAndNotifyLlslog:(NSString *)llslog;
- (void)performLoadUnderlyingImageAndNotifyLlslog:(NSString *)llslog;
- (void)_performLoadUnderlyingImageAndNotifyWithWebURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)_performLoadUnderlyingImageAndNotifyWithLocalFileURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)_performLoadUnderlyingImageAndNotifyWithAssetsLibraryURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)_performLoadUnderlyingImageAndNotifyWithAsset:(PHAsset *)asset targetSize:(CGSize)targetSize llslog:(NSString *)llslog;
- (void)unloadUnderlyingImageLlslog:(NSString *)llslog;
- (void)imageLoadingCompleteLlslog:(NSString *)llslog;
- (void)postCompleteNotificationLlslog:(NSString *)llslog;
- (void)cancelAnyLoadingLlslog:(NSString *)llslog;
- (void)cancelImageRequestLlslog:(NSString *)llslog;
- (void)cancelVideoRequestLlslog:(NSString *)llslog;

@end
