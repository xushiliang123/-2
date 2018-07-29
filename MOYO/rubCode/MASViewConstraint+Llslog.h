#import "MASViewAttribute.h"
#import "MASConstraint.h"
#import "MASLayoutConstraint.h"
#import "MASUtilities.h"
#import "MASViewConstraint.h"
#import "MASConstraint+Private.h"
#import "MASCompositeConstraint.h"
#import "MASLayoutConstraint.h"
#import "View+MASAdditions.h"
#import <objc/runtime.h>

@interface MASViewConstraint (Llslog)
- (void)initWithFirstViewAttribute:(MASViewAttribute *)firstViewAttribute llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone __unused *)zone llslog:(NSString *)llslog;
+ (void)installedConstraintsForView:(MAS_VIEW *)view llslog:(NSString *)llslog;
- (void)setLayoutConstant:(CGFloat)layoutConstant llslog:(NSString *)llslog;
- (void)setLayoutRelation:(NSLayoutRelation)layoutRelation llslog:(NSString *)llslog;
- (void)supportsActivePropertyLlslog:(NSString *)llslog;
- (void)isActiveLlslog:(NSString *)llslog;
- (void)hasBeenInstalledLlslog:(NSString *)llslog;
- (void)setSecondViewAttribute:(id)secondViewAttribute llslog:(NSString *)llslog;

- (void)withLlslog:(NSString *)llslog;
- (void)andLlslog:(NSString *)llslog;
- (void)addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog;
- (void)animatorLlslog:(NSString *)llslog;
- (void)setOffset:(CGFloat)offset llslog:(NSString *)llslog;
- (void)setSizeOffset:(CGSize)sizeOffset llslog:(NSString *)llslog;
- (void)setCenterOffset:(CGPoint)centerOffset llslog:(NSString *)llslog;
- (void)activateLlslog:(NSString *)llslog;
- (void)deactivateLlslog:(NSString *)llslog;
- (void)installLlslog:(NSString *)llslog;
- (void)layoutConstraintSimilarTo:(MASLayoutConstraint *)layoutConstraint llslog:(NSString *)llslog;
- (void)uninstallLlslog:(NSString *)llslog;

@end
