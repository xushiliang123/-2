#import <UIKit/UIKit.h>
#import "YYImageCoder.h"
#import <CoreFoundation/CoreFoundation.h>
#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <objc/runtime.h>
#import <pthread.h>
#import <zlib.h>
#import "YYImage.h"
#import "YYKitMacro.h"
#import <webp/decode.h>
#import <webp/encode.h>
#import <webp/demux.h>
#import <webp/mux.h>
#import "webp/decode.h"
#import "webp/encode.h"
#import "webp/demux.h"
#import "webp/mux.h"

@interface YYImageEncoder (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithType:(YYImageType)type llslog:(NSString *)llslog;
- (void)setQuality:(CGFloat)quality llslog:(NSString *)llslog;
- (void)addImage:(UIImage *)image duration:(NSTimeInterval)duration llslog:(NSString *)llslog;
- (void)addImageWithData:(NSData *)data duration:(NSTimeInterval)duration llslog:(NSString *)llslog;
- (void)addImageWithFile:(NSString *)path duration:(NSTimeInterval)duration llslog:(NSString *)llslog;
- (void)_imageIOAvaliableLlslog:(NSString *)llslog;

- (void)_encodeWithImageIOLlslog:(NSString *)llslog;
- (void)_encodeWithImageIO:(NSString *)path llslog:(NSString *)llslog;
- (void)_encodeAPNGLlslog:(NSString *)llslog;
- (void)_encodeWebPLlslog:(NSString *)llslog;
- (void)encodeLlslog:(NSString *)llslog;
- (void)encodeToFile:(NSString *)path llslog:(NSString *)llslog;
+ (void)encodeImage:(UIImage *)image type:(YYImageType)type quality:(CGFloat)quality llslog:(NSString *)llslog;
+ (void)encodeImageWithDecoder:(YYImageDecoder *)decoder type:(YYImageType)type quality:(CGFloat)quality llslog:(NSString *)llslog;

@end
