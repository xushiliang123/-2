#import "MASUtilities.h"
#import "MASConstraint.h"
#import "MASConstraint+Private.h"

@interface MASConstraint (Llslog)
- (void)initLlslog:(NSString *)llslog;

- (void)withLlslog:(NSString *)llslog;
- (void)andLlslog:(NSString *)llslog;
- (void)addConstraintWithLayoutAttribute:(NSLayoutAttribute __unused)layoutAttribute llslog:(NSString *)llslog;
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

- (void)setInsets:(MASEdgeInsets __unused)insets llslog:(NSString *)llslog;
- (void)setSizeOffset:(CGSize __unused)sizeOffset llslog:(NSString *)llslog;
- (void)setCenterOffset:(CGPoint __unused)centerOffset llslog:(NSString *)llslog;
- (void)setOffset:(CGFloat __unused)offset llslog:(NSString *)llslog;
- (void)animatorLlslog:(NSString *)llslog;
- (void)activateLlslog:(NSString *)llslog;
- (void)deactivateLlslog:(NSString *)llslog;
- (void)installLlslog:(NSString *)llslog;
- (void)uninstallLlslog:(NSString *)llslog;

@end
