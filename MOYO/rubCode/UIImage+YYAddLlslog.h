#import <UIKit/UIKit.h>
#import "UIImage+YYAdd.h"
#import "UIDevice+YYAdd.h"
#import "NSString+YYAdd.h"
#import "YYKitMacro.h"
#import "YYCGUtilities.h"
#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>
#import <CoreText/CoreText.h>
#import <objc/runtime.h>
#import "YYCGUtilities.h"

@interface UIImage (YYAddLlslog)
+ (void)imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale llslog:(NSString *)llslog;
+ (void)isAnimatedGIFData:(NSData *)data llslog:(NSString *)llslog;
+ (void)isAnimatedGIFFile:(NSString *)path llslog:(NSString *)llslog;
+ (void)imageWithPDF:(id)dataOrPath llslog:(NSString *)llslog;
+ (void)imageWithPDF:(id)dataOrPath size:(CGSize)size llslog:(NSString *)llslog;
+ (void)imageWithEmoji:(NSString *)emoji size:(CGFloat)size llslog:(NSString *)llslog;
+ (void)_yy_imageWithPDF:(id)dataOrPath resize:(BOOL)resize size:(CGSize)size llslog:(NSString *)llslog;
+ (void)imageWithColor:(UIColor *)color llslog:(NSString *)llslog;
+ (void)imageWithColor:(UIColor *)color size:(CGSize)size llslog:(NSString *)llslog;
+ (void)imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock llslog:(NSString *)llslog;
- (void)hasAlphaChannelLlslog:(NSString *)llslog;
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips llslog:(NSString *)llslog;
- (void)imageByResizeToSize:(CGSize)size llslog:(NSString *)llslog;
- (void)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode llslog:(NSString *)llslog;
- (void)imageByCropToRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)imageByInsetEdge:(UIEdgeInsets)insets withColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)imageByRoundCornerRadius:(CGFloat)radius llslog:(NSString *)llslog;
- (void)imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor llslog:(NSString *)llslog;
- (void)imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin llslog:(NSString *)llslog;
- (void)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize llslog:(NSString *)llslog;
- (void)_yy_flipHorizontal:(BOOL)horizontal vertical:(BOOL)vertical llslog:(NSString *)llslog;
- (void)imageByRotateLeft90Llslog:(NSString *)llslog;
- (void)imageByRotateRight90Llslog:(NSString *)llslog;
- (void)imageByRotate180Llslog:(NSString *)llslog;
- (void)imageByFlipVerticalLlslog:(NSString *)llslog;
- (void)imageByFlipHorizontalLlslog:(NSString *)llslog;
- (void)imageByTintColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)imageByGrayscaleLlslog:(NSString *)llslog;
- (void)imageByBlurSoftLlslog:(NSString *)llslog;
- (void)imageByBlurLightLlslog:(NSString *)llslog;
- (void)imageByBlurExtraLightLlslog:(NSString *)llslog;
- (void)imageByBlurDarkLlslog:(NSString *)llslog;
- (void)imageByBlurWithTint:(UIColor *)tintColor llslog:(NSString *)llslog;
- (void)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage llslog:(NSString *)llslog;
- (void)_yy_mergeImageRef:(CGImageRef)effectCGImage
                     tintColor:(UIColor *)tintColor
                 tintBlendMode:(CGBlendMode)tintBlendMode
                     maskImage:(UIImage *)maskImage
                        opaque:(BOOL)opaque llslog:(NSString *)llslog;

@end
