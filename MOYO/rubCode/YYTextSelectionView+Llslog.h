#import <UIKit/UIKit.h>
#import <YYKit/YYTextAttribute.h>
#import <YYKit/YYTextInput.h>
#import "YYTextAttribute.h"
#import "YYTextInput.h"
#import "YYTextSelectionView.h"
#import "YYCGUtilities.h"
#import "YYWeakProxy.h"

@interface YYTextSelectionView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)setCaretBlinks:(BOOL)caretBlinks llslog:(NSString *)llslog;
- (void)_startBlinksLlslog:(NSString *)llslog;
- (void)_doBlinkLlslog:(NSString *)llslog;
- (void)setCaretVisible:(BOOL)caretVisible llslog:(NSString *)llslog;
- (void)setVerticalForm:(BOOL)verticalForm llslog:(NSString *)llslog;
- (void)_standardCaretRect:(CGRect)caretRect llslog:(NSString *)llslog;
- (void)setCaretRect:(CGRect)caretRect llslog:(NSString *)llslog;
- (void)setSelectionRects:(NSArray *)selectionRects llslog:(NSString *)llslog;
- (void)isGrabberContainsPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)isStartGrabberContainsPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)isEndGrabberContainsPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)isCaretContainsPoint:(CGPoint)point llslog:(NSString *)llslog;
- (void)isSelectionRectsContainsPoint:(CGPoint)point llslog:(NSString *)llslog;

@end
