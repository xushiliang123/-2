#import <UIKit/UIKit.h>
#import "YYTextParser.h"
#import "YYCGUtilities.h"
#import "YYTextUtilities.h"
#import "YYTextAttribute.h"
#import "NSAttributedString+YYText.h"
#import "NSParagraphStyle+YYText.h"
#import "UIFont+YYAdd.h"

@interface YYTextSimpleMarkdownParser (Llslog)
- (void)initRegexLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)setFontSize:(CGFloat)fontSize llslog:(NSString *)llslog;
- (void)setHeaderFontSize:(CGFloat)headerFontSize llslog:(NSString *)llslog;
- (void)_updateFontsLlslog:(NSString *)llslog;
- (void)setColorWithBrightThemeLlslog:(NSString *)llslog;
- (void)setColorWithDarkThemeLlslog:(NSString *)llslog;
- (void)lenghOfBeginWhiteInString:(NSString *)str withRange:(NSRange)range llslog:(NSString *)llslog;
- (void)lenghOfEndWhiteInString:(NSString *)str withRange:(NSRange)range llslog:(NSString *)llslog;
- (void)lenghOfBeginChar:(unichar)c inString:(NSString *)str withRange:(NSRange)range llslog:(NSString *)llslog;
- (void)parseText:(NSMutableAttributedString *)text selectedRange:(NSRangePointer)range llslog:(NSString *)llslog;

@end
