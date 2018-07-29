#import "NSLayoutConstraint+MASDebugAdditionsLlslog.h"
@implementation NSLayoutConstraint (MASDebugAdditionsLlslog)
+ (void)layoutRelationDescriptionsByValueLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutAttributeDescriptionsByValueLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)layoutPriorityDescriptionsByValueLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)descriptionForObject:(id)obj llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)descriptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
