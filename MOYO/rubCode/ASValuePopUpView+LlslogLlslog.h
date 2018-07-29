#import <UIKit/UIKit.h>
#import "ASValuePopUpView.h"
#import "ASValuePopUpView+Llslog.h"

@interface ASValuePopUpView (LlslogLlslog)
+ (void)layerClassLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)actionForLayer:(CALayer *)layer forKey:(NSString *)key llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setCornerRadius:(CGFloat)radius llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)colorLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setColor:(UIColor *)color llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)opaqueColorLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setText:(NSString *)string llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setAnimatedColors:(NSArray *)animatedColors withKeyTimes:(NSArray *)keyTimes llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setAnimationOffset:(CGFloat)animOffset returnColor:(void (^)(UIColor *opaqueReturnColor))block llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setFrame:(CGRect)frame arrowOffset:(CGFloat)arrowOffset llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)animateBlock:(void (^)(CFTimeInterval duration))block llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)showAnimated:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hideAnimated:(BOOL)animated completionBlock:(void (^)())block llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)animationDidStart:(CAAnimation *)animation llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pathForRect:(CGRect)rect withArrowOffset:(CGFloat)arrowOffset llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
