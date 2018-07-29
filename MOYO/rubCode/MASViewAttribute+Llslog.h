#import "MASUtilities.h"
#import "MASViewAttribute.h"

@interface MASViewAttribute (Llslog)
- (void)initWithView:(MAS_VIEW *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog;
- (void)initWithView:(MAS_VIEW *)view item:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog;
- (void)isSizeAttributeLlslog:(NSString *)llslog;
- (void)isEqual:(MASViewAttribute *)viewAttribute llslog:(NSString *)llslog;
- (void)hashLlslog:(NSString *)llslog;

@end
