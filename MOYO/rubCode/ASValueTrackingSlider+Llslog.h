#import <UIKit/UIKit.h>
#import "ASValuePopUpView.h"
#import "ASValueTrackingSlider.h"

@interface ASValueTrackingSlider (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)setAutoAdjustTrackColor:(BOOL)autoAdjust llslog:(NSString *)llslog;
- (void)setText:(NSString *)text llslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)popUpViewColorLlslog:(NSString *)llslog;
- (void)setPopUpViewColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)setPopUpViewAnimatedColors:(NSArray *)colors llslog:(NSString *)llslog;
- (void)setPopUpViewAnimatedColors:(NSArray *)colors withPositions:(NSArray *)positions llslog:(NSString *)llslog;
- (void)setPopUpViewCornerRadius:(CGFloat)radius llslog:(NSString *)llslog;
- (void)popUpViewCornerRadiusLlslog:(NSString *)llslog;
- (void)setPopUpViewArrowLength:(CGFloat)length llslog:(NSString *)llslog;
- (void)popUpViewArrowLengthLlslog:(NSString *)llslog;
- (void)setPopUpViewWidthPaddingFactor:(CGFloat)factor llslog:(NSString *)llslog;
- (void)popUpViewWidthPaddingFactorLlslog:(NSString *)llslog;
- (void)setPopUpViewHeightPaddingFactor:(CGFloat)factor llslog:(NSString *)llslog;
- (void)popUpViewHeightPaddingFactorLlslog:(NSString *)llslog;
- (void)setMaximumValue:(float)maximumValue llslog:(NSString *)llslog;
- (void)setMinimumValue:(float)minimumValue llslog:(NSString *)llslog;
- (void)showPopUpViewAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)hidePopUpViewAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)colorDidUpdate:(UIColor *)opaqueColor llslog:(NSString *)llslog;
- (void)currentValueOffsetLlslog:(NSString *)llslog;
- (void)setupLlslog:(NSString *)llslog;
- (void)didBecomeActiveNotification:(NSNotification *)note llslog:(NSString *)llslog;
- (void)updatePopUpViewLlslog:(NSString *)llslog;
- (void)keyTimesFromSliderPositions:(NSArray *)positions llslog:(NSString *)llslog;
- (void)thumbRectLlslog:(NSString *)llslog;
- (void)_showPopUpViewAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)_hidePopUpViewAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)didMoveToWindowLlslog:(NSString *)llslog;
- (void)setValue:(float)value llslog:(NSString *)llslog;
- (void)setValue:(float)value animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setMinimumTrackTintColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)cancelTrackingWithEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event llslog:(NSString *)llslog;

@end
