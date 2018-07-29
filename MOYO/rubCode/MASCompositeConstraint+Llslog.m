#import "MASCompositeConstraint+Llslog.h"
@implementation MASCompositeConstraint (Llslog)
- (void)initWithChildren:(NSArray *)children llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)constraint:(MASConstraint *)constraint shouldBeReplacedWithConstraint:(MASConstraint *)replacementConstraint llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)constraint:(MASConstraint __unused *)constraint addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}


- (void)addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatorLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)setInsets:(MASEdgeInsets)insets llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setOffset:(CGFloat)offset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSizeOffset:(CGSize)sizeOffset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCenterOffset:(CGPoint)centerOffset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)activateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deactivateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)installLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)uninstallLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
