#import <UIKit/UIKit.h>
#import <YYKit/YYTextParser.h>
#import <YYKit/YYTextLayout.h>
#import <YYKit/YYTextAttribute.h>
#import "YYTextParser.h"
#import "YYTextLayout.h"
#import "YYTextAttribute.h"
#import "YYTextView.h"
#import "YYKitMacro.h"
#import "YYTextInput.h"
#import "YYTextContainerView.h"
#import "YYTextSelectionView.h"
#import "YYTextMagnifier.h"
#import "YYTextEffectWindow.h"
#import "YYTextKeyboardManager.h"
#import "YYTextUtilities.h"
#import "YYCGUtilities.h"
#import "YYTransaction.h"
#import "YYWeakProxy.h"
#import "UIView+YYAdd.h"
#import "NSAttributedString+YYText.h"
#import "UIPasteboard+YYText.h"
#import "UIDevice+YYAdd.h"
#import "UIApplication+YYAdd.h"
#import "YYImage.h"

@interface YYTextView (IBInspectablePropertiesLlslog)
- (void)fontIsBold_:(UIFont *)font llslog:(NSString *)llslog;
- (void)boldFont_:(UIFont *)font llslog:(NSString *)llslog;
- (void)normalFont_:(UIFont *)font llslog:(NSString *)llslog;
- (void)setFontName_:(NSString *)fontName llslog:(NSString *)llslog;
- (void)setFontSize_:(CGFloat)fontSize llslog:(NSString *)llslog;
- (void)setFontIsBold_:(BOOL)fontBold llslog:(NSString *)llslog;
- (void)setPlaceholderFontName_:(NSString *)fontName llslog:(NSString *)llslog;
- (void)setPlaceholderFontSize_:(CGFloat)fontSize llslog:(NSString *)llslog;
- (void)setPlaceholderFontIsBold_:(BOOL)fontBold llslog:(NSString *)llslog;
- (void)setInsetTop_:(CGFloat)textInsetTop llslog:(NSString *)llslog;
- (void)setInsetBottom_:(CGFloat)textInsetBottom llslog:(NSString *)llslog;
- (void)setInsetLeft_:(CGFloat)textInsetLeft llslog:(NSString *)llslog;
- (void)setInsetRight_:(CGFloat)textInsetRight llslog:(NSString *)llslog;
- (void)setDebugEnabled_:(BOOL)enabled llslog:(NSString *)llslog;

@end
