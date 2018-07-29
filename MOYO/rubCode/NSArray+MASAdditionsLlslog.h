#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewAttribute.h"
#import "NSArray+MASAdditions.h"
#import "View+MASAdditions.h"

@interface NSArray (MASAdditionsLlslog)
- (void)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog;
- (void)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog;
- (void)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog;
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType withFixedSpacing:(CGFloat)fixedSpacing leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing llslog:(NSString *)llslog;
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType withFixedItemLength:(CGFloat)fixedItemLength leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing llslog:(NSString *)llslog;
- (void)mas_commonSuperviewOfViewsLlslog:(NSString *)llslog;

@end
