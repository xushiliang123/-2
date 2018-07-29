#import "EARestrictedScrollView+Llslog.h"
@implementation EARestrictedScrollView (Llslog)
- (void)addSubview:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)bringSubviewToFront:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sendSubviewToBack:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)viewWithTag:(NSInteger)tag llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)containedSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)checkIfScrollIndicator:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)containerViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)alignedContentOffsetLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAlignedContentOffset:(CGPoint)contentOffset llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setContentSize:(CGSize)contentSize llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setRestrictionArea:(CGRect)restrictionArea llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
