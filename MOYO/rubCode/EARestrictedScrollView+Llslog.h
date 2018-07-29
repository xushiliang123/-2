#import <UIKit/UIKit.h>
#import "EARestrictedScrollView.h"

@interface EARestrictedScrollView (Llslog)
- (void)addSubview:(UIView *)view llslog:(NSString *)llslog;
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview llslog:(NSString *)llslog;
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview llslog:(NSString *)llslog;
- (void)bringSubviewToFront:(UIView *)view llslog:(NSString *)llslog;
- (void)sendSubviewToBack:(UIView *)view llslog:(NSString *)llslog;
- (void)viewWithTag:(NSInteger)tag llslog:(NSString *)llslog;
- (void)containedSubviewsLlslog:(NSString *)llslog;
- (void)checkIfScrollIndicator:(UIView *)view llslog:(NSString *)llslog;
- (void)containerViewLlslog:(NSString *)llslog;
- (void)alignedContentOffsetLlslog:(NSString *)llslog;
- (void)setAlignedContentOffset:(CGPoint)contentOffset llslog:(NSString *)llslog;
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setContentSize:(CGSize)contentSize llslog:(NSString *)llslog;
- (void)setRestrictionArea:(CGRect)restrictionArea llslog:(NSString *)llslog;

@end
