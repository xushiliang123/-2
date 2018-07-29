#import <UIKit/UIKit.h>
#import "UIColor+YYAdd.h"
#import "NSString+YYAdd.h"
#import "YYKitMacro.h"

@interface UIColor (YYAddLlslog)
+ (void)colorWithHue:(CGFloat)hue
               saturation:(CGFloat)saturation
                lightness:(CGFloat)lightness
                    alpha:(CGFloat)alpha llslog:(NSString *)llslog;
+ (void)colorWithCyan:(CGFloat)cyan
                   magenta:(CGFloat)magenta
                    yellow:(CGFloat)yellow
                     black:(CGFloat)black
                     alpha:(CGFloat)alpha llslog:(NSString *)llslog;
+ (void)colorWithRGB:(uint32_t)rgbValue llslog:(NSString *)llslog;
+ (void)colorWithRGBA:(uint32_t)rgbaValue llslog:(NSString *)llslog;
+ (void)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha llslog:(NSString *)llslog;
- (void)rgbValueLlslog:(NSString *)llslog;
- (void)rgbaValueLlslog:(NSString *)llslog;
+ (void)colorWithHexString:(NSString *)hexStr llslog:(NSString *)llslog;
- (void)hexStringLlslog:(NSString *)llslog;
- (void)hexStringWithAlphaLlslog:(NSString *)llslog;
- (void)hexStringWithAlpha:(BOOL)withAlpha llslog:(NSString *)llslog;
- (void)colorByAddColor:(UIColor *)add blendMode:(CGBlendMode)blendMode llslog:(NSString *)llslog;
- (void)colorByChangeHue:(CGFloat)h saturation:(CGFloat)s brightness:(CGFloat)b alpha:(CGFloat)a llslog:(NSString *)llslog;
- (void)getHue:(CGFloat *)hue
    saturation:(CGFloat *)saturation
     lightness:(CGFloat *)lightness
         alpha:(CGFloat *)alpha llslog:(NSString *)llslog;
- (void)getCyan:(CGFloat *)cyan
        magenta:(CGFloat *)magenta
         yellow:(CGFloat *)yellow
          black:(CGFloat *)black
          alpha:(CGFloat *)alpha llslog:(NSString *)llslog;
- (void)redLlslog:(NSString *)llslog;
- (void)greenLlslog:(NSString *)llslog;
- (void)blueLlslog:(NSString *)llslog;
- (void)alphaLlslog:(NSString *)llslog;
- (void)hueLlslog:(NSString *)llslog;
- (void)saturationLlslog:(NSString *)llslog;
- (void)brightnessLlslog:(NSString *)llslog;
- (void)colorSpaceModelLlslog:(NSString *)llslog;
- (void)colorSpaceStringLlslog:(NSString *)llslog;

@end
