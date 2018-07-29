#import "MASConstraint.h"
#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewConstraint.h"
#import "MASCompositeConstraint.h"
#import "MASConstraint+Private.h"
#import "MASViewAttribute.h"
#import "View+MASAdditions.h"

@interface MASConstraintMaker (Llslog)
- (void)initWithView:(MAS_VIEW *)view llslog:(NSString *)llslog;
- (void)installLlslog:(NSString *)llslog;
- (void)constraint:(MASConstraint *)constraint shouldBeReplacedWithConstraint:(MASConstraint *)replacementConstraint llslog:(NSString *)llslog;
- (void)constraint:(MASConstraint *)constraint addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog;
- (void)addConstraintWithAttributes:(MASAttribute)attrs llslog:(NSString *)llslog;
- (void)addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog;
- (void)leftLlslog:(NSString *)llslog;
- (void)topLlslog:(NSString *)llslog;
- (void)rightLlslog:(NSString *)llslog;
- (void)bottomLlslog:(NSString *)llslog;
- (void)leadingLlslog:(NSString *)llslog;
- (void)trailingLlslog:(NSString *)llslog;
- (void)widthLlslog:(NSString *)llslog;
- (void)heightLlslog:(NSString *)llslog;
- (void)centerXLlslog:(NSString *)llslog;
- (void)centerYLlslog:(NSString *)llslog;
- (void)baselineLlslog:(NSString *)llslog;
- (void)firstBaselineLlslog:(NSString *)llslog;
- (void)lastBaselineLlslog:(NSString *)llslog;
- (void)leftMarginLlslog:(NSString *)llslog;
- (void)rightMarginLlslog:(NSString *)llslog;
- (void)topMarginLlslog:(NSString *)llslog;
- (void)bottomMarginLlslog:(NSString *)llslog;
- (void)leadingMarginLlslog:(NSString *)llslog;
- (void)trailingMarginLlslog:(NSString *)llslog;
- (void)centerXWithinMarginsLlslog:(NSString *)llslog;
- (void)centerYWithinMarginsLlslog:(NSString *)llslog;
- (void)edgesLlslog:(NSString *)llslog;
- (void)sizeLlslog:(NSString *)llslog;
- (void)centerLlslog:(NSString *)llslog;

@end
