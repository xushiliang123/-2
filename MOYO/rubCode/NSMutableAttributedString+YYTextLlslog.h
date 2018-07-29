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

@interface NSMutableAttributedString (YYTextLlslog)
- (void)setAttributes:(NSDictionary *)attributes llslog:(NSString *)llslog;
- (void)setAttribute:(NSString *)name value:(id)value llslog:(NSString *)llslog;
- (void)setAttribute:(NSString *)name value:(id)value range:(NSRange)range llslog:(NSString *)llslog;
- (void)removeAttributesInRange:(NSRange)range llslog:(NSString *)llslog;
- (void)setFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)setKern:(NSNumber *)kern llslog:(NSString *)llslog;
- (void)setColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)setBackgroundColor:(UIColor *)backgroundColor llslog:(NSString *)llslog;
- (void)setStrokeWidth:(NSNumber *)strokeWidth llslog:(NSString *)llslog;
- (void)setStrokeColor:(UIColor *)strokeColor llslog:(NSString *)llslog;
- (void)setShadow:(NSShadow *)shadow llslog:(NSString *)llslog;
- (void)setStrikethroughStyle:(NSUnderlineStyle)strikethroughStyle llslog:(NSString *)llslog;
- (void)setStrikethroughColor:(UIColor *)strikethroughColor llslog:(NSString *)llslog;
- (void)setUnderlineStyle:(NSUnderlineStyle)underlineStyle llslog:(NSString *)llslog;
- (void)setUnderlineColor:(UIColor *)underlineColor llslog:(NSString *)llslog;
- (void)setLigature:(NSNumber *)ligature llslog:(NSString *)llslog;
- (void)setTextEffect:(NSString *)textEffect llslog:(NSString *)llslog;
- (void)setObliqueness:(NSNumber *)obliqueness llslog:(NSString *)llslog;
- (void)setExpansion:(NSNumber *)expansion llslog:(NSString *)llslog;
- (void)setBaselineOffset:(NSNumber *)baselineOffset llslog:(NSString *)llslog;
- (void)setVerticalGlyphForm:(BOOL)verticalGlyphForm llslog:(NSString *)llslog;
- (void)setLanguage:(NSString *)language llslog:(NSString *)llslog;
- (void)setWritingDirection:(NSArray *)writingDirection llslog:(NSString *)llslog;
- (void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle llslog:(NSString *)llslog;
- (void)setAlignment:(NSTextAlignment)alignment llslog:(NSString *)llslog;
- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection llslog:(NSString *)llslog;
- (void)setLineSpacing:(CGFloat)lineSpacing llslog:(NSString *)llslog;
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing llslog:(NSString *)llslog;
- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore llslog:(NSString *)llslog;
- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent llslog:(NSString *)llslog;
- (void)setHeadIndent:(CGFloat)headIndent llslog:(NSString *)llslog;
- (void)setTailIndent:(CGFloat)tailIndent llslog:(NSString *)llslog;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode llslog:(NSString *)llslog;
- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight llslog:(NSString *)llslog;
- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight llslog:(NSString *)llslog;
- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple llslog:(NSString *)llslog;
- (void)setHyphenationFactor:(float)hyphenationFactor llslog:(NSString *)llslog;
- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval llslog:(NSString *)llslog;
- (void)setTabStops:(NSArray *)tabStops llslog:(NSString *)llslog;
- (void)setTextShadow:(YYTextShadow *)textShadow llslog:(NSString *)llslog;
- (void)setTextInnerShadow:(YYTextShadow *)textInnerShadow llslog:(NSString *)llslog;
- (void)setTextUnderline:(YYTextDecoration *)textUnderline llslog:(NSString *)llslog;
- (void)setTextStrikethrough:(YYTextDecoration *)textStrikethrough llslog:(NSString *)llslog;
- (void)setTextBorder:(YYTextBorder *)textBorder llslog:(NSString *)llslog;
- (void)setTextBackgroundBorder:(YYTextBorder *)textBackgroundBorder llslog:(NSString *)llslog;
- (void)setTextGlyphTransform:(CGAffineTransform)textGlyphTransform llslog:(NSString *)llslog;
- (void)setFont:(UIFont *)font range:(NSRange)range llslog:(NSString *)llslog;
- (void)setKern:(NSNumber *)kern range:(NSRange)range llslog:(NSString *)llslog;
- (void)setColor:(UIColor *)color range:(NSRange)range llslog:(NSString *)llslog;
- (void)setBackgroundColor:(UIColor *)backgroundColor range:(NSRange)range llslog:(NSString *)llslog;
- (void)setStrokeWidth:(NSNumber *)strokeWidth range:(NSRange)range llslog:(NSString *)llslog;
- (void)setStrokeColor:(UIColor *)strokeColor range:(NSRange)range llslog:(NSString *)llslog;
- (void)setShadow:(NSShadow *)shadow range:(NSRange)range llslog:(NSString *)llslog;
- (void)setStrikethroughStyle:(NSUnderlineStyle)strikethroughStyle range:(NSRange)range llslog:(NSString *)llslog;
- (void)setStrikethroughColor:(UIColor *)strikethroughColor range:(NSRange)range llslog:(NSString *)llslog;
- (void)setUnderlineStyle:(NSUnderlineStyle)underlineStyle range:(NSRange)range llslog:(NSString *)llslog;
- (void)setUnderlineColor:(UIColor *)underlineColor range:(NSRange)range llslog:(NSString *)llslog;
- (void)setLigature:(NSNumber *)ligature range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextEffect:(NSString *)textEffect range:(NSRange)range llslog:(NSString *)llslog;
- (void)setObliqueness:(NSNumber *)obliqueness range:(NSRange)range llslog:(NSString *)llslog;
- (void)setExpansion:(NSNumber *)expansion range:(NSRange)range llslog:(NSString *)llslog;
- (void)setBaselineOffset:(NSNumber *)baselineOffset range:(NSRange)range llslog:(NSString *)llslog;
- (void)setVerticalGlyphForm:(BOOL)verticalGlyphForm range:(NSRange)range llslog:(NSString *)llslog;
- (void)setLanguage:(NSString *)language range:(NSRange)range llslog:(NSString *)llslog;
- (void)setWritingDirection:(NSArray *)writingDirection range:(NSRange)range llslog:(NSString *)llslog;
- (void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range llslog:(NSString *)llslog;
- (void)setAlignment:(NSTextAlignment)alignment range:(NSRange)range llslog:(NSString *)llslog;
- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection range:(NSRange)range llslog:(NSString *)llslog;
- (void)setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range llslog:(NSString *)llslog;
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing range:(NSRange)range llslog:(NSString *)llslog;
- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore range:(NSRange)range llslog:(NSString *)llslog;
- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent range:(NSRange)range llslog:(NSString *)llslog;
- (void)setHeadIndent:(CGFloat)headIndent range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTailIndent:(CGFloat)tailIndent range:(NSRange)range llslog:(NSString *)llslog;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode range:(NSRange)range llslog:(NSString *)llslog;
- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight range:(NSRange)range llslog:(NSString *)llslog;
- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight range:(NSRange)range llslog:(NSString *)llslog;
- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple range:(NSRange)range llslog:(NSString *)llslog;
- (void)setHyphenationFactor:(float)hyphenationFactor range:(NSRange)range llslog:(NSString *)llslog;
- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTabStops:(NSArray *)tabStops range:(NSRange)range llslog:(NSString *)llslog;
- (void)setSuperscript:(NSNumber *)superscript range:(NSRange)range llslog:(NSString *)llslog;
- (void)setGlyphInfo:(CTGlyphInfoRef)glyphInfo range:(NSRange)range llslog:(NSString *)llslog;
- (void)setCharacterShape:(NSNumber *)characterShape range:(NSRange)range llslog:(NSString *)llslog;
- (void)setRunDelegate:(CTRunDelegateRef)runDelegate range:(NSRange)range llslog:(NSString *)llslog;
- (void)setBaselineClass:(CFStringRef)baselineClass range:(NSRange)range llslog:(NSString *)llslog;
- (void)setBaselineInfo:(CFDictionaryRef)baselineInfo range:(NSRange)range llslog:(NSString *)llslog;
- (void)setBaselineReferenceInfo:(CFDictionaryRef)referenceInfo range:(NSRange)range llslog:(NSString *)llslog;
- (void)setRubyAnnotation:(CTRubyAnnotationRef)ruby range:(NSRange)range llslog:(NSString *)llslog;
- (void)setAttachment:(NSTextAttachment *)attachment range:(NSRange)range llslog:(NSString *)llslog;
- (void)setLink:(id)link range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextBackedString:(YYTextBackedString *)textBackedString range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextBinding:(YYTextBinding *)textBinding range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextShadow:(YYTextShadow *)textShadow range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextInnerShadow:(YYTextShadow *)textInnerShadow range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextUnderline:(YYTextDecoration *)textUnderline range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextStrikethrough:(YYTextDecoration *)textStrikethrough range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextBorder:(YYTextBorder *)textBorder range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextBackgroundBorder:(YYTextBorder *)textBackgroundBorder range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextAttachment:(YYTextAttachment *)textAttachment range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextHighlight:(YYTextHighlight *)textHighlight range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextBlockBorder:(YYTextBorder *)textBlockBorder range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextRubyAnnotation:(YYTextRubyAnnotation *)ruby range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextGlyphTransform:(CGAffineTransform)textGlyphTransform range:(NSRange)range llslog:(NSString *)llslog;
- (void)setTextHighlightRange:(NSRange)range
                        color:(UIColor *)color
              backgroundColor:(UIColor *)backgroundColor
                     userInfo:(NSDictionary *)userInfo
                    tapAction:(YYTextAction)tapAction
              longPressAction:(YYTextAction)longPressAction llslog:(NSString *)llslog;
- (void)setTextHighlightRange:(NSRange)range
                        color:(UIColor *)color
              backgroundColor:(UIColor *)backgroundColor
                    tapAction:(YYTextAction)tapAction llslog:(NSString *)llslog;
- (void)setTextHighlightRange:(NSRange)range
                        color:(UIColor *)color
              backgroundColor:(UIColor *)backgroundColor
                     userInfo:(NSDictionary *)userInfo llslog:(NSString *)llslog;
- (void)insertString:(NSString *)string atIndex:(NSUInteger)location llslog:(NSString *)llslog;
- (void)appendString:(NSString *)string llslog:(NSString *)llslog;
- (void)setClearColorToJoinedEmojiLlslog:(NSString *)llslog;
- (void)removeDiscontinuousAttributesInRange:(NSRange)range llslog:(NSString *)llslog;
+ (void)allDiscontinuousAttributeKeysLlslog:(NSString *)llslog;

@end
