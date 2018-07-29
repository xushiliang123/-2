#import "MASUtilities.h"
#import "NSLayoutConstraint+MASDebugAdditions.h"
#import "MASConstraint.h"
#import "MASLayoutConstraint.h"

@interface NSLayoutConstraint (MASDebugAdditionsLlslog)
+ (void)layoutRelationDescriptionsByValueLlslog:(NSString *)llslog;
+ (void)layoutAttributeDescriptionsByValueLlslog:(NSString *)llslog;
+ (void)layoutPriorityDescriptionsByValueLlslog:(NSString *)llslog;
+ (void)descriptionForObject:(id)obj llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
