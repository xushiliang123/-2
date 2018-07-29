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

@interface YYLabel (Llslog)
- (void)_updateIfNeededLlslog:(NSString *)llslog;
- (void)_updateLayoutLlslog:(NSString *)llslog;
- (void)_setLayoutNeedUpdateLlslog:(NSString *)llslog;
- (void)_setLayoutNeedRedrawLlslog:(NSString *)llslog;
- (void)_clearInnerLayoutLlslog:(NSString *)llslog;
- (void)_innerLayoutLlslog:(NSString *)llslog;
- (void)_highlightLayoutLlslog:(NSString *)llslog;
+ (void)_shrinkLayoutWithLayout:(YYTextLayout *)layout llslog:(NSString *)llslog;
- (void)_startLongPressTimerLlslog:(NSString *)llslog;
- (void)_endLongPressTimerLlslog:(NSString *)llslog;
- (void)_trackDidLongPressLlslog:(NSString *)llslog;
- (void)_getHighlightAtPoint:(CGPoint)point range:(NSRangePointer)range llslog:(NSString *)llslog;
- (void)_showHighlightAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_hideHighlightAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_removeHighlightAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_endTouchLlslog:(NSString *)llslog;
- (void)_convertPointToLayout:(CGPoint)point llslog:(NSString *)llslog;
- (void)_convertPointFromLayout:(CGPoint)point llslog:(NSString *)llslog;
- (void)_convertRectToLayout:(CGRect)rect llslog:(NSString *)llslog;
- (void)_convertRectFromLayout:(CGRect)rect llslog:(NSString *)llslog;
- (void)_defaultFontLlslog:(NSString *)llslog;
- (void)_shadowFromPropertiesLlslog:(NSString *)llslog;
- (void)_updateOuterLineBreakModeLlslog:(NSString *)llslog;
- (void)_updateOuterTextPropertiesLlslog:(NSString *)llslog;
- (void)_updateOuterContainerPropertiesLlslog:(NSString *)llslog;
- (void)_clearContentsLlslog:(NSString *)llslog;
- (void)_initLabelLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
+ (void)layerClassLlslog:(NSString *)llslog;
- (void)setFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setBounds:(CGRect)bounds llslog:(NSString *)llslog;
- (void)sizeThatFits:(CGSize)size llslog:(NSString *)llslog;
- (void)accessibilityLabelLlslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)setText:(NSString *)text llslog:(NSString *)llslog;
- (void)setFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)setTextColor:(UIColor *)textColor llslog:(NSString *)llslog;
- (void)setShadowColor:(UIColor *)shadowColor llslog:(NSString *)llslog;
- (void)setShadowOffset:(CGSize)shadowOffset llslog:(NSString *)llslog;

- (void)setShadowBlurRadius:(CGFloat)shadowBlurRadius llslog:(NSString *)llslog;
- (void)setTextAlignment:(NSTextAlignment)textAlignment llslog:(NSString *)llslog;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode llslog:(NSString *)llslog;
- (void)setTextVerticalAlignment:(YYTextVerticalAlignment)textVerticalAlignment llslog:(NSString *)llslog;
- (void)setTruncationToken:(NSAttributedString *)truncationToken llslog:(NSString *)llslog;
- (void)setNumberOfLines:(NSUInteger)numberOfLines llslog:(NSString *)llslog;
- (void)setAttributedText:(NSAttributedString *)attributedText llslog:(NSString *)llslog;
- (void)setTextContainerPath:(UIBezierPath *)textContainerPath llslog:(NSString *)llslog;
- (void)setExclusionPaths:(NSArray *)exclusionPaths llslog:(NSString *)llslog;
- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset llslog:(NSString *)llslog;
- (void)setVerticalForm:(BOOL)verticalForm llslog:(NSString *)llslog;
- (void)setLinePositionModifier:(id<YYTextLinePositionModifier>)linePositionModifier llslog:(NSString *)llslog;
- (void)setTextParser:(id<YYTextParser>)textParser llslog:(NSString *)llslog;
- (void)setTextLayout:(YYTextLayout *)textLayout llslog:(NSString *)llslog;
- (void)textLayoutLlslog:(NSString *)llslog;
- (void)setDisplaysAsynchronously:(BOOL)displaysAsynchronously llslog:(NSString *)llslog;
- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth llslog:(NSString *)llslog;
- (void)intrinsicContentSizeLlslog:(NSString *)llslog;
- (void)setDebugOption:(YYTextDebugOption *)debugOption llslog:(NSString *)llslog;
- (void)newAsyncDisplayTaskLlslog:(NSString *)llslog;

@end
