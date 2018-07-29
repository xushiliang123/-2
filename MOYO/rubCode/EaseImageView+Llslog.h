#import <UIKit/UIKit.h>
#import "EaseImageView.h"

@interface EaseImageView (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)_setupSubviewsLlslog:(NSString *)llslog;
- (void)_setupImageViewConstraintLlslog:(NSString *)llslog;
- (void)_setupAddVImgConstraintLlslog:(NSString *)llslog;
- (void)_setupBadgeViewConstraintLlslog:(NSString *)llslog;
- (void)_updateBadgeViewWidthConstraintLlslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)setBadge:(NSInteger)badge llslog:(NSString *)llslog;
- (void)setShowBadge:(BOOL)showBadge llslog:(NSString *)llslog;
- (void)setBadgeSize:(CGFloat)badgeSize llslog:(NSString *)llslog;
- (void)setImageCornerRadius:(CGFloat)imageCornerRadius llslog:(NSString *)llslog;
- (void)setBadgeFont:(UIFont *)badgeFont llslog:(NSString *)llslog;
- (void)setBadgeTextColor:(UIColor *)badgeTextColor llslog:(NSString *)llslog;
- (void)setBadgeBackgroudColor:(UIColor *)badgeBackgroudColor llslog:(NSString *)llslog;

@end
