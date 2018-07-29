#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <YYKit/YYTextAttribute.h>
#import <YYKit/YYTextRubyAnnotation.h>
#import "YYTextAttribute.h"
#import "YYTextRubyAnnotation.h"
#import "NSAttributedString+YYText.h"
#import "YYKitMacro.h"
#import "UIDevice+YYAdd.h"
#import "UIFont+YYAdd.h"
#import "NSParagraphStyle+YYText.h"
#import "YYTextArchiver.h"
#import "YYTextRunDelegate.h"
#import "YYAnimatedImageView.h"
#import "YYTextUtilities.h"
#import <CoreFoundation/CoreFoundation.h>

@interface NSAttributedString (YYTextLlslog)
- (void)archiveToDataLlslog:(NSString *)llslog;
+ (void)unarchiveFromData:(NSData *)data llslog:(NSString *)llslog;
- (void)attributesAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)attribute:(NSString *)attributeName atIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)attributesLlslog:(NSString *)llslog;
- (void)fontLlslog:(NSString *)llslog;
- (void)fontAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)kernLlslog:(NSString *)llslog;
- (void)kernAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)colorLlslog:(NSString *)llslog;
- (void)colorAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)backgroundColorLlslog:(NSString *)llslog;
- (void)backgroundColorAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)strokeWidthLlslog:(NSString *)llslog;
- (void)strokeWidthAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)strokeColorLlslog:(NSString *)llslog;
- (void)strokeColorAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)shadowLlslog:(NSString *)llslog;
- (void)shadowAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)strikethroughStyleLlslog:(NSString *)llslog;
- (void)strikethroughStyleAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)strikethroughColorLlslog:(NSString *)llslog;
- (void)strikethroughColorAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)underlineStyleLlslog:(NSString *)llslog;
- (void)underlineStyleAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)underlineColorLlslog:(NSString *)llslog;
- (void)underlineColorAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)ligatureLlslog:(NSString *)llslog;
- (void)ligatureAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textEffectLlslog:(NSString *)llslog;
- (void)textEffectAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)obliquenessLlslog:(NSString *)llslog;
- (void)obliquenessAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)expansionLlslog:(NSString *)llslog;
- (void)expansionAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)baselineOffsetLlslog:(NSString *)llslog;
- (void)baselineOffsetAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)verticalGlyphFormLlslog:(NSString *)llslog;
- (void)verticalGlyphFormAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)languageLlslog:(NSString *)llslog;
- (void)languageAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)writingDirectionLlslog:(NSString *)llslog;
- (void)writingDirectionAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)paragraphStyleLlslog:(NSString *)llslog;
- (void)paragraphStyleAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)alignmentLlslog:(NSString *)llslog;
- (void)lineBreakModeLlslog:(NSString *)llslog;
- (void)lineSpacingLlslog:(NSString *)llslog;
- (void)paragraphSpacingLlslog:(NSString *)llslog;
- (void)paragraphSpacingBeforeLlslog:(NSString *)llslog;
- (void)firstLineHeadIndentLlslog:(NSString *)llslog;
- (void)headIndentLlslog:(NSString *)llslog;
- (void)tailIndentLlslog:(NSString *)llslog;
- (void)minimumLineHeightLlslog:(NSString *)llslog;
- (void)maximumLineHeightLlslog:(NSString *)llslog;
- (void)lineHeightMultipleLlslog:(NSString *)llslog;
- (void)baseWritingDirectionLlslog:(NSString *)llslog;
- (void)hyphenationFactorLlslog:(NSString *)llslog;
- (void)defaultTabIntervalLlslog:(NSString *)llslog;
- (void)tabStopsLlslog:(NSString *)llslog;
- (void)alignmentAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)lineBreakModeAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)lineSpacingAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)paragraphSpacingAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)paragraphSpacingBeforeAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)firstLineHeadIndentAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)headIndentAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)tailIndentAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)minimumLineHeightAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)maximumLineHeightAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)lineHeightMultipleAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)baseWritingDirectionAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)hyphenationFactorAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)defaultTabIntervalAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)tabStopsAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textShadowLlslog:(NSString *)llslog;
- (void)textShadowAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textInnerShadowLlslog:(NSString *)llslog;
- (void)textInnerShadowAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textUnderlineLlslog:(NSString *)llslog;
- (void)textUnderlineAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textStrikethroughLlslog:(NSString *)llslog;
- (void)textStrikethroughAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textBorderLlslog:(NSString *)llslog;
- (void)textBorderAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textBackgroundBorderLlslog:(NSString *)llslog;
- (void)textBackgroundBorderAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)textGlyphTransformLlslog:(NSString *)llslog;
- (void)textGlyphTransformAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)plainTextForRange:(NSRange)range llslog:(NSString *)llslog;
+ (void)attachmentStringWithContent:(id)content
                                               contentMode:(UIViewContentMode)contentMode
                                                     width:(CGFloat)width
                                                    ascent:(CGFloat)ascent
                                                   descent:(CGFloat)descent llslog:(NSString *)llslog;
+ (void)attachmentStringWithContent:(id)content
                                               contentMode:(UIViewContentMode)contentMode
                                            attachmentSize:(CGSize)attachmentSize
                                               alignToFont:(UIFont *)font
                                                 alignment:(YYTextVerticalAlignment)alignment llslog:(NSString *)llslog;
+ (void)attachmentStringWithEmojiImage:(UIImage *)image
                                                     fontSize:(CGFloat)fontSize llslog:(NSString *)llslog;
- (void)rangeOfAllLlslog:(NSString *)llslog;
- (void)isSharedAttributesInAllRangeLlslog:(NSString *)llslog;
- (void)canDrawWithUIKitLlslog:(NSString *)llslog;

@end
