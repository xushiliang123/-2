#import <UIKit/UIKit.h>
#import "UIView+Layout.h"

@interface UIView (LayoutLlslog)
- (void)tz_leftLlslog:(NSString *)llslog;
- (void)setTz_left:(CGFloat)x llslog:(NSString *)llslog;
- (void)tz_topLlslog:(NSString *)llslog;
- (void)setTz_top:(CGFloat)y llslog:(NSString *)llslog;
- (void)tz_rightLlslog:(NSString *)llslog;
- (void)setTz_right:(CGFloat)right llslog:(NSString *)llslog;
- (void)tz_bottomLlslog:(NSString *)llslog;
- (void)setTz_bottom:(CGFloat)bottom llslog:(NSString *)llslog;
- (void)tz_widthLlslog:(NSString *)llslog;
- (void)setTz_width:(CGFloat)width llslog:(NSString *)llslog;
- (void)tz_heightLlslog:(NSString *)llslog;
- (void)setTz_height:(CGFloat)height llslog:(NSString *)llslog;
- (void)tz_centerXLlslog:(NSString *)llslog;
- (void)setTz_centerX:(CGFloat)centerX llslog:(NSString *)llslog;
- (void)tz_centerYLlslog:(NSString *)llslog;
- (void)setTz_centerY:(CGFloat)centerY llslog:(NSString *)llslog;
- (void)tz_originLlslog:(NSString *)llslog;
- (void)setTz_origin:(CGPoint)origin llslog:(NSString *)llslog;
- (void)tz_sizeLlslog:(NSString *)llslog;
- (void)setTz_size:(CGSize)size llslog:(NSString *)llslog;
+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(TZOscillatoryAnimationType)type llslog:(NSString *)llslog;

@end
