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

@interface YYTextView (Llslog)
- (void)_commitUpdateLlslog:(NSString *)llslog;
- (void)_updateIfNeededLlslog:(NSString *)llslog;
- (void)_updateLlslog:(NSString *)llslog;
- (void)_updateLayoutLlslog:(NSString *)llslog;
- (void)_updateSelectionViewLlslog:(NSString *)llslog;
- (void)_updateInnerContainerSizeLlslog:(NSString *)llslog;
- (void)_commitPlaceholderUpdateLlslog:(NSString *)llslog;
- (void)_updatePlaceholderIfNeededLlslog:(NSString *)llslog;
- (void)_updatePlaceholderLlslog:(NSString *)llslog;
- (void)_updateTextRangeByTrackingCaretLlslog:(NSString *)llslog;
- (void)_updateTextRangeByTrackingGrabberLlslog:(NSString *)llslog;
- (void)_updateTextRangeByTrackingPreSelectLlslog:(NSString *)llslog;
- (void)_showMagnifierCaretLlslog:(NSString *)llslog;
- (void)_showMagnifierRangedLlslog:(NSString *)llslog;
- (void)_updateMagnifierLlslog:(NSString *)llslog;
- (void)_hideMagnifierLlslog:(NSString *)llslog;
- (void)_showMenuLlslog:(NSString *)llslog;
- (void)_hideMenuLlslog:(NSString *)llslog;
- (void)_showHighlightAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_hideHighlightAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_removeHighlightAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_scrollSelectedRangeToVisibleLlslog:(NSString *)llslog;
- (void)_scrollRangeToVisible:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)_restoreInsetsAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_keyboardChangedLlslog:(NSString *)llslog;
- (void)_startLongPressTimerLlslog:(NSString *)llslog;
- (void)_endLongPressTimerLlslog:(NSString *)llslog;
- (void)_trackDidLongPressLlslog:(NSString *)llslog;
- (void)_startAutoScrollTimerLlslog:(NSString *)llslog;
- (void)_endAutoScrollTimerLlslog:(NSString *)llslog;
- (void)_trackDidTickAutoScrollLlslog:(NSString *)llslog;
- (void)_endTouchTrackingLlslog:(NSString *)llslog;
- (void)_startSelectionDotFixTimerLlslog:(NSString *)llslog;
- (void)_endSelectionDotFixTimerLlslog:(NSString *)llslog;
- (void)_fixSelectionDotLlslog:(NSString *)llslog;
- (void)_getClosestTokenRangeAtPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)_getClosestTokenRangeAtPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)_getHighlightAtPoint:(CGPoint)point range:(NSRangePointer)range llslog:(NSString *)llslog;
- (void)_getMagnifierRangedOffsetLlslog:(NSString *)llslog;
- (void)_getMoveDirectionLlslog:(NSString *)llslog;
- (void)_getAutoscrollOffsetLlslog:(NSString *)llslog;
- (void)_getVisibleSizeLlslog:(NSString *)llslog;
- (void)_isPasteboardContainsValidValueLlslog:(NSString *)llslog;
- (void)_copySelectedTextToPasteboardLlslog:(NSString *)llslog;
- (void)_pasteboardChangedLlslog:(NSString *)llslog;
- (void)_isTextPositionValid:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)_isTextRangeValid:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)_correctedTextPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)_correctedTextRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)_convertPointToLayout:(CGPoint)point llslog:(NSString *)llslog;
- (void)_convertPointFromLayout:(CGPoint)point llslog:(NSString *)llslog;
- (void)_convertRectToLayout:(CGRect)rect llslog:(NSString *)llslog;
- (void)_convertRectFromLayout:(CGRect)rect llslog:(NSString *)llslog;
- (void)_replaceRange:(YYTextRange *)range withText:(NSString *)text notifyToDelegate:(BOOL)notify llslog:(NSString *)llslog;
- (void)_updateAttributesHolderLlslog:(NSString *)llslog;
- (void)_updateOuterPropertiesLlslog:(NSString *)llslog;
- (void)_parseTextLlslog:(NSString *)llslog;
- (void)_shouldDetectTextLlslog:(NSString *)llslog;
- (void)_detectText:(NSMutableAttributedString *)text llslog:(NSString *)llslog;
- (void)_getRootViewControllerLlslog:(NSString *)llslog;
- (void)_resetUndoAndRedoStackLlslog:(NSString *)llslog;
- (void)_resetRedoStackLlslog:(NSString *)llslog;
- (void)_saveToUndoStackLlslog:(NSString *)llslog;
- (void)_saveToRedoStackLlslog:(NSString *)llslog;
- (void)_canUndoLlslog:(NSString *)llslog;
- (void)_canRedoLlslog:(NSString *)llslog;
- (void)_undoLlslog:(NSString *)llslog;
- (void)_redoLlslog:(NSString *)llslog;
- (void)_restoreFirstResponderAfterUndoAlertLlslog:(NSString *)llslog;
- (void)_localizedUndoStringsLlslog:(NSString *)llslog;
- (void)_defaultFontLlslog:(NSString *)llslog;
- (void)_defaultTintColorLlslog:(NSString *)llslog;
- (void)_defaultPlaceholderColorLlslog:(NSString *)llslog;
- (void)_setText:(NSString *)text llslog:(NSString *)llslog;
- (void)_setFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)_setTextColor:(UIColor *)textColor llslog:(NSString *)llslog;
- (void)_setTextAlignment:(NSTextAlignment)textAlignment llslog:(NSString *)llslog;
- (void)_setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes llslog:(NSString *)llslog;
- (void)_setLinkTextAttributes:(NSDictionary *)linkTextAttributes llslog:(NSString *)llslog;
- (void)_setHighlightTextAttributes:(NSDictionary *)highlightTextAttributes llslog:(NSString *)llslog;
- (void)_setTextParser:(id<YYTextParser>)textParser llslog:(NSString *)llslog;
- (void)_setAttributedText:(NSAttributedString *)attributedText llslog:(NSString *)llslog;
- (void)_setTextContainerInset:(UIEdgeInsets)textContainerInset llslog:(NSString *)llslog;
- (void)_setExclusionPaths:(NSArray *)exclusionPaths llslog:(NSString *)llslog;
- (void)_setVerticalForm:(BOOL)verticalForm llslog:(NSString *)llslog;
- (void)_setLinePositionModifier:(id<YYTextLinePositionModifier>)linePositionModifier llslog:(NSString *)llslog;
- (void)_setSelectedRange:(NSRange)selectedRange llslog:(NSString *)llslog;
- (void)_setTypingAttributes:(NSDictionary *)typingAttributes llslog:(NSString *)llslog;
- (void)_initTextViewLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)scrollRangeToVisible:(NSRange)range llslog:(NSString *)llslog;
- (void)setText:(NSString *)text llslog:(NSString *)llslog;
- (void)setFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)setTextColor:(UIColor *)textColor llslog:(NSString *)llslog;
- (void)setTextAlignment:(NSTextAlignment)textAlignment llslog:(NSString *)llslog;
- (void)setDataDetectorTypes:(UIDataDetectorTypes)dataDetectorTypes llslog:(NSString *)llslog;
- (void)setLinkTextAttributes:(NSDictionary *)linkTextAttributes llslog:(NSString *)llslog;
- (void)setHighlightTextAttributes:(NSDictionary *)highlightTextAttributes llslog:(NSString *)llslog;
- (void)setTextParser:(id<YYTextParser>)textParser llslog:(NSString *)llslog;
- (void)setTypingAttributes:(NSDictionary *)typingAttributes llslog:(NSString *)llslog;
- (void)setAttributedText:(NSAttributedString *)attributedText llslog:(NSString *)llslog;
- (void)setTextVerticalAlignment:(YYTextVerticalAlignment)textVerticalAlignment llslog:(NSString *)llslog;
- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset llslog:(NSString *)llslog;
- (void)setExclusionPaths:(NSArray *)exclusionPaths llslog:(NSString *)llslog;
- (void)setVerticalForm:(BOOL)verticalForm llslog:(NSString *)llslog;
- (void)setLinePositionModifier:(id<YYTextLinePositionModifier>)linePositionModifier llslog:(NSString *)llslog;
- (void)setSelectedRange:(NSRange)selectedRange llslog:(NSString *)llslog;
- (void)setHighlightable:(BOOL)highlightable llslog:(NSString *)llslog;
- (void)setEditable:(BOOL)editable llslog:(NSString *)llslog;
- (void)setSelectable:(BOOL)selectable llslog:(NSString *)llslog;
- (void)setClearsOnInsertion:(BOOL)clearsOnInsertion llslog:(NSString *)llslog;
- (void)setDebugOption:(YYTextDebugOption *)debugOption llslog:(NSString *)llslog;
- (void)debugOptionLlslog:(NSString *)llslog;
- (void)textLayoutLlslog:(NSString *)llslog;
- (void)setPlaceholderText:(NSString *)placeholderText llslog:(NSString *)llslog;
- (void)setPlaceholderFont:(UIFont *)placeholderFont llslog:(NSString *)llslog;
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor llslog:(NSString *)llslog;
- (void)setPlaceholderAttributedText:(NSAttributedString *)placeholderAttributedText llslog:(NSString *)llslog;
- (void)setMultipleTouchEnabled:(BOOL)multipleTouchEnabled llslog:(NSString *)llslog;
- (void)setContentInset:(UIEdgeInsets)contentInset llslog:(NSString *)llslog;
- (void)setScrollIndicatorInsets:(UIEdgeInsets)scrollIndicatorInsets llslog:(NSString *)llslog;
- (void)setFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setBounds:(CGRect)bounds llslog:(NSString *)llslog;
- (void)tintColorDidChangeLlslog:(NSString *)llslog;
- (void)sizeThatFits:(CGSize)size llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)canBecomeFirstResponderLlslog:(NSString *)llslog;
- (void)becomeFirstResponderLlslog:(NSString *)llslog;
- (void)canResignFirstResponderLlslog:(NSString *)llslog;
- (void)resignFirstResponderLlslog:(NSString *)llslog;
- (void)canPerformAction:(SEL)action withSender:(id)sender llslog:(NSString *)llslog;
- (void)Llslog:(NSString *)llslog;
- (void)reloadInputViewsLlslog:(NSString *)llslog;
- (void)cut:(id)sender llslog:(NSString *)llslog;
- (void)copy:(id)sender llslog:(NSString *)llslog;
- (void)paste:(id)sender llslog:(NSString *)llslog;
- (void)select:(id)sender llslog:(NSString *)llslog;
- (void)selectAll:(id)sender llslog:(NSString *)llslog;
- (void)_define:(id)sender llslog:(NSString *)llslog;
+ (void)automaticallyNotifiesObserversForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)delegateLlslog:(NSString *)llslog;
- (void)setDelegate:(id<YYTextViewDelegate>)delegate llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidZoom:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset llslog:(NSString *)llslog;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)viewForZoomingInScrollView:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view llslog:(NSString *)llslog;
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)scrollViewShouldScrollToTop:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)keyboardChangedWithTransition:(YYTextKeyboardTransition)transition llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)hasTextLlslog:(NSString *)llslog;
- (void)insertText:(NSString *)text llslog:(NSString *)llslog;
- (void)deleteBackwardLlslog:(NSString *)llslog;
- (void)setInputDelegate:(id<UITextInputDelegate>)inputDelegate llslog:(NSString *)llslog;
- (void)setSelectedTextRange:(YYTextRange *)selectedTextRange llslog:(NSString *)llslog;
- (void)setMarkedTextStyle:(NSDictionary *)markedTextStyle llslog:(NSString *)llslog;
- (void)setMarkedText:(NSString *)markedText selectedRange:(NSRange)selectedRange llslog:(NSString *)llslog;
- (void)unmarkTextLlslog:(NSString *)llslog;
- (void)replaceRange:(YYTextRange *)range withText:(NSString *)text llslog:(NSString *)llslog;
- (void)setBaseWritingDirection:(UITextWritingDirection)writingDirection forRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)textInRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)baseWritingDirectionForPosition:(YYTextPosition *)position inDirection:(UITextStorageDirection)direction llslog:(NSString *)llslog;
- (void)beginningOfDocumentLlslog:(NSString *)llslog;
- (void)endOfDocumentLlslog:(NSString *)llslog;
- (void)positionFromPosition:(YYTextPosition *)position offset:(NSInteger)offset llslog:(NSString *)llslog;
- (void)positionFromPosition:(YYTextPosition *)position inDirection:(UITextLayoutDirection)direction offset:(NSInteger)offset llslog:(NSString *)llslog;
- (void)textRangeFromPosition:(YYTextPosition *)fromPosition toPosition:(YYTextPosition *)toPosition llslog:(NSString *)llslog;
- (void)comparePosition:(YYTextPosition *)position toPosition:(YYTextPosition *)other llslog:(NSString *)llslog;
- (void)offsetFromPosition:(YYTextPosition *)from toPosition:(YYTextPosition *)toPosition llslog:(NSString *)llslog;
- (void)positionWithinRange:(YYTextRange *)range farthestInDirection:(UITextLayoutDirection)direction llslog:(NSString *)llslog;
- (void)characterRangeByExtendingPosition:(YYTextPosition *)position inDirection:(UITextLayoutDirection)direction llslog:(NSString *)llslog;
- (void)closestPositionToPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)closestPositionToPoint:(CGPoint)point withinRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)characterRangeAtPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)firstRectForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)caretRectForPosition:(YYTextPosition *)position llslog:(NSString *)llslog;
- (void)selectionRectsForRange:(YYTextRange *)range llslog:(NSString *)llslog;
- (void)selectionAffinityLlslog:(NSString *)llslog;
- (void)setSelectionAffinity:(UITextStorageDirection)selectionAffinity llslog:(NSString *)llslog;
- (void)textStylingAtPosition:(YYTextPosition *)position inDirection:(UITextStorageDirection)direction llslog:(NSString *)llslog;
- (void)positionWithinRange:(YYTextRange *)range atCharacterOffset:(NSInteger)offset llslog:(NSString *)llslog;
- (void)characterOffsetOfPosition:(YYTextPosition *)position withinRange:(YYTextRange *)range llslog:(NSString *)llslog;

@end
