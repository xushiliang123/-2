#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <YYKit/YYTextAttribute.h>
#import "YYTextAttribute.h"
#import "YYTextLine.h"
#import "YYTextUtilities.h"
#import "YYKitMacro.h"

@interface YYTextRunGlyphRange (Llslog)
+ (void)rangeWithRange:(NSRange)range drawMode:(YYTextRunGlyphDrawMode)mode llslog:(NSString *)llslog;

@end
