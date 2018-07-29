#import "YYTextLayout+Llslog.h"
@implementation YYTextLayout (Llslog)
- (void)_initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutWithContainerSize:(CGSize)size text:(NSAttributedString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutWithContainer:(YYTextContainer *)container text:(NSAttributedString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutWithContainer:(YYTextContainer *)container text:(NSAttributedString *)text range:(NSRange)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutWithContainers:(NSArray *)containers text:(NSAttributedString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutWithContainers:(NSArray *)containers text:(NSAttributedString *)text range:(NSRange)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setFrameSetter:(CTFramesetterRef)frameSetter llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setFrame:(CTFrameRef)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_rowIndexForEdge:(CGFloat)edge llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_closestRowIndexForEdge:(CGFloat)edge llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_runForLine:(YYTextLine *)line position:(YYTextPosition *)position llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_insideComposedCharacterSequences:(YYTextLine *)line position:(NSUInteger)position block:(void (^)(CGFloat left, CGFloat right, NSUInteger prev, NSUInteger next))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_insideEmoji:(YYTextLine *)line position:(NSUInteger)position block:(void (^)(CGFloat left, CGFloat right, NSUInteger prev, NSUInteger next))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_isRightToLeftInLine:(YYTextLine *)line atPoint:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_correctedRangeWithEdge:(YYTextRange *)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)lineIndexForRow:(NSUInteger)row llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)lineCountForRow:(NSUInteger)row llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rowIndexForLine:(NSUInteger)line llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)lineIndexForPoint:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)closestLineIndexForPoint:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)offsetForTextPosition:(NSUInteger)position lineIndex:(NSUInteger)lineIndex llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textPositionForPoint:(CGPoint)point lineIndex:(NSUInteger)lineIndex llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)closestPositionToPoint:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)positionForPoint:(CGPoint)point
                         oldPosition:(YYTextPosition *)oldPosition
                       otherPosition:(YYTextPosition *)otherPosition llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textRangeAtPoint:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)closestTextRangeAtPoint:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textRangeByExtendingPosition:(YYTextPosition *)position llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textRangeByExtendingPosition:(YYTextPosition *)position
                                  inDirection:(UITextLayoutDirection)direction
                                       offset:(NSInteger)offset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)lineIndexForPosition:(YYTextPosition *)position llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)linePositionForPosition:(YYTextPosition *)position llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)caretRectForPosition:(YYTextPosition *)position llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)firstRectForRange:(YYTextRange *)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rectForRange:(YYTextRange *)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectionRectsForRange:(YYTextRange *)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectionRectsWithoutStartAndEndForRange:(YYTextRange *)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)selectionRectsWithOnlyStartAndEndForRange:(YYTextRange *)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawInContext:(CGContextRef)context
                 size:(CGSize)size
                point:(CGPoint)point
                 view:(UIView *)view
                layer:(CALayer *)layer
                debug:(YYTextDebugOption *)debug
                cancel:(BOOL (^)(void))cancel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawInContext:(CGContextRef)context
                 size:(CGSize)size
                debug:(YYTextDebugOption *)debug llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addAttachmentToView:(UIView *)view layer:(CALayer *)layer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAttachmentFromViewAndLayerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
