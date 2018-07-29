#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <YYKit/YYTextDebugOption.h>
#import <YYKit/YYTextLine.h>
#import <YYKit/YYTextInput.h>
#import "YYTextDebugOption.h"
#import "YYTextLine.h"
#import "YYTextInput.h"
#import "YYTextLayout.h"
#import "YYKitMacro.h"
#import "YYCGUtilities.h"
#import "YYTextUtilities.h"
#import "YYTextAttribute.h"
#import "YYTextArchiver.h"
#import "NSAttributedString+YYText.h"
#import "UIFont+YYAdd.h"

@interface YYTextLayout (Llslog)
- (void)_initLlslog:(NSString *)llslog;
+ (void)layoutWithContainerSize:(CGSize)size text:(NSAttributedString *)text llslog:(NSString *)llslog;
+ (void)layoutWithContainer:(YYTextContainer *)container text:(NSAttributedString *)text llslog:(NSString *)llslog;
+ (void)layoutWithContainer:(YYTextContainer *)container text:(NSAttributedString *)text range:(NSRange)range llslog:(NSString *)llslog;
+ (void)layoutWithContainers:(NSArray *)containers text:(NSAttributedString *)text llslog:(NSString *)llslog;
+ (void)layoutWithContainers:(NSArray *)containers text:(NSAttributedString *)text range:(NSRange)range llslog:(NSString *)llslog;
- (void)setFrameSetter:(CTFramesetterRef)frameSetter llslog:(NSString *)llslog;
- (void)setFrame:(CTFrameRef)frame llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)_rowIndexForEdge:(CGFloat)edge llslog:(NSString *)llslog;
- (void)_closestRowIndexForEdge:(CGFloat)edge llslog:(NSString *)llslog;
- (void)_runForLine:(YYTextLine *)line position:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)_insideComposedCharacterSequences:(YYTextLine *)line position:(NSUInteger)position block:(void (^)(CGFloat left, CGFloat right, NSUInteger prev, NSUInteger next))block llslog:(NSString *)llslog;
- (void)_insideEmoji:(YYTextLine *)line position:(NSUInteger)position block:(void (^)(CGFloat left, CGFloat right, NSUInteger prev, NSUInteger next))block llslog:(NSString *)llslog;
- (void)_isRightToLeftInLine:(YYTextLine *)line atPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)_correctedRangeWithEdge:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)lineIndexForRow:(NSUInteger)row llslog:(NSString *)llslog;
- (void)lineCountForRow:(NSUInteger)row llslog:(NSString *)llslog;
- (void)rowIndexForLine:(NSUInteger)line llslog:(NSString *)llslog;
- (void)lineIndexForPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)closestLineIndexForPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)offsetForTextPosition:(NSUInteger)position lineIndex:(NSUInteger)lineIndex llslog:(NSString *)llslog;
- (void)textPositionForPoint:(CGPoint)point lineIndex:(NSUInteger)lineIndex llslog:(NSString *)llslog;
- (void)closestPositionToPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)positionForPoint:(CGPoint)point
                         oldPosition:(YYTextPosition *)oldPosition
                       otherPosition:(YYTextPosition *)otherPosition llslog:(NSString *)llslog;
- (void)textRangeAtPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)closestTextRangeAtPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)textRangeByExtendingPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)textRangeByExtendingPosition:(YYTextPosition *)position
                                  inDirection:(UITextLayoutDirection)direction
                                       offset:(NSInteger)offset llslog:(NSString *)llslog;
- (void)lineIndexForPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)linePositionForPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)caretRectForPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)firstRectForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)rectForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)selectionRectsForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)selectionRectsWithoutStartAndEndForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)selectionRectsWithOnlyStartAndEndForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)drawInContext:(CGContextRef)context
                 size:(CGSize)size
                point:(CGPoint)point
                 view:(UIView *)view
                layer:(CALayer *)layer
                debug:(YYTextDebugOption *)debug
                cancel:(BOOL (^)(void))cancel llslog:(NSString *)llslog;
- (void)drawInContext:(CGContextRef)context
                 size:(CGSize)size
                debug:(YYTextDebugOption *)debug llslog:(NSString *)llslog;
- (void)addAttachmentToView:(UIView *)view layer:(CALayer *)layer llslog:(NSString *)llslog;
- (void)removeAttachmentFromViewAndLayerLlslog:(NSString *)llslog;

@end
