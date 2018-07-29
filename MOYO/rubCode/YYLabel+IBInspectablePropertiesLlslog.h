#import <UIKit/UIKit.h>
#import <YYKit/YYTextParser.h>
#import <YYKit/YYTextLayout.h>
#import <YYKit/YYTextAttribute.h>
#import "YYTextParser.h"
#import "YYTextLayout.h"
#import "YYTextAttribute.h"
#import "YYLabel.h"
#import "YYAsyncLayer.h"
#import "YYWeakProxy.h"
#import "YYCGUtilities.h"
#import "NSAttributedString+YYText.h"
#import "YYDispatchQueuePool.h"

@interface YYLabel (IBInspectablePropertiesLlslog)
- (void)fontIsBold_:(UIFont *)font llslog:(NSString *)llslog;
- (void)boldFont_:(UIFont *)font llslog:(NSString *)llslog;
- (void)normalFont_:(UIFont *)font llslog:(NSString *)llslog;
- (void)setFontName_:(NSString *)fontName llslog:(NSString *)llslog;
- (void)setFontSize_:(CGFloat)fontSize llslog:(NSString *)llslog;
- (void)setFontIsBold_:(BOOL)fontBold llslog:(NSString *)llslog;
- (void)setInsetTop_:(CGFloat)textInsetTop llslog:(NSString *)llslog;
- (void)setInsetBottom_:(CGFloat)textInsetBottom llslog:(NSString *)llslog;
- (void)setInsetLeft_:(CGFloat)textInsetLeft llslog:(NSString *)llslog;
- (void)setInsetRight_:(CGFloat)textInsetRight llslog:(NSString *)llslog;
- (void)setDebugEnabled_:(BOOL)enabled llslog:(NSString *)llslog;

@end
