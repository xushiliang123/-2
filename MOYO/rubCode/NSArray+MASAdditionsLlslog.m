#import "NSArray+MASAdditionsLlslog.h"
@implementation NSArray (MASAdditionsLlslog)
- (void)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType withFixedSpacing:(CGFloat)fixedSpacing leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType withFixedItemLength:(CGFloat)fixedItemLength leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)mas_commonSuperviewOfViewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
