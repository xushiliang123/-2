#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>
#import "UIFont+YYAdd.h"
#import "YYKitMacro.h"

@interface UIFont (YYAddLlslog)
- (void)isBoldLlslog:(NSString *)llslog;
- (void)isItalicLlslog:(NSString *)llslog;
- (void)isMonoSpaceLlslog:(NSString *)llslog;
- (void)isColorGlyphsLlslog:(NSString *)llslog;
- (void)fontWeightLlslog:(NSString *)llslog;
- (void)fontWithBoldLlslog:(NSString *)llslog;
- (void)fontWithItalicLlslog:(NSString *)llslog;
- (void)fontWithBoldItalicLlslog:(NSString *)llslog;
- (void)fontWithNormalLlslog:(NSString *)llslog;
+ (void)fontWithCTFont:(CTFontRef)CTFont llslog:(NSString *)llslog;
+ (void)fontWithCGFont:(CGFontRef)CGFont size:(CGFloat)size llslog:(NSString *)llslog;

+ (void)loadFontFromPath:(NSString *)path llslog:(NSString *)llslog;
+ (void)unloadFontFromPath:(NSString *)path llslog:(NSString *)llslog;
+ (void)loadFontFromData:(NSData *)data llslog:(NSString *)llslog;
+ (void)unloadFontFromData:(UIFont *)font llslog:(NSString *)llslog;
+ (void)dataFromFont:(UIFont *)font llslog:(NSString *)llslog;
+ (void)dataFromCGFont:(CGFontRef)cgFont llslog:(NSString *)llslog;

@end
