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

@interface UIImage (YYImageCoderLlslog)
- (void)imageByDecodedLlslog:(NSString *)llslog;
- (void)isDecodedForDisplayLlslog:(NSString *)llslog;
- (void)setIsDecodedForDisplay:(BOOL)isDecodedForDisplay llslog:(NSString *)llslog;
- (void)saveToAlbumWithCompletionBlock:(void(^)(NSURL *assetURL, NSError *error))completionBlock llslog:(NSString *)llslog;
- (void)imageDataRepresentationLlslog:(NSString *)llslog;
- (void)_imageDataRepresentationForSystem:(BOOL)forSystem llslog:(NSString *)llslog;

@end
