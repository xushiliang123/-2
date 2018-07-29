#import "MASConstraint.h"
#import "MASUtilities.h"
#import "MASCompositeConstraint.h"
#import "MASConstraint+Private.h"

@interface MASCompositeConstraint (Llslog)
- (void)initWithChildren:(NSArray *)children llslog:(NSString *)llslog;
- (void)constraint:(MASConstraint *)constraint shouldBeReplacedWithConstraint:(MASConstraint *)replacementConstraint llslog:(NSString *)llslog;
- (void)constraint:(MASConstraint __unused *)constraint addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog;

- (void)setInsets:(MASEdgeInsets)insets llslog:(NSString *)llslog;
- (void)setOffset:(CGFloat)offset llslog:(NSString *)llslog;
- (void)setSizeOffset:(CGSize)sizeOffset llslog:(NSString *)llslog;
- (void)setCenterOffset:(CGPoint)centerOffset llslog:(NSString *)llslog;
- (void)activateLlslog:(NSString *)llslog;
- (void)deactivateLlslog:(NSString *)llslog;
- (void)installLlslog:(NSString *)llslog;
- (void)uninstallLlslog:(NSString *)llslog;

@end
