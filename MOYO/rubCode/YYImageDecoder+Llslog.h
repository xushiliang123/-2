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

@interface YYImageDecoder (Llslog)
- (void)deallocLlslog:(NSString *)llslog;
+ (void)decoderWithData:(NSData *)data scale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithScale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)updateData:(NSData *)data final:(BOOL)final llslog:(NSString *)llslog;
- (void)frameAtIndex:(NSUInteger)index decodeForDisplay:(BOOL)decodeForDisplay llslog:(NSString *)llslog;
- (void)frameDurationAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)framePropertiesAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)imagePropertiesLlslog:(NSString *)llslog;
- (void)_updateData:(NSData *)data final:(BOOL)final llslog:(NSString *)llslog;
- (void)_frameAtIndex:(NSUInteger)index decodeForDisplay:(BOOL)decodeForDisplay llslog:(NSString *)llslog;
- (void)_framePropertiesAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)_imagePropertiesLlslog:(NSString *)llslog;
- (void)_updateSourceLlslog:(NSString *)llslog;
- (void)_updateSourceWebPLlslog:(NSString *)llslog;
- (void)_updateSourceAPNGLlslog:(NSString *)llslog;
- (void)_updateSourceImageIOLlslog:(NSString *)llslog;


@end
