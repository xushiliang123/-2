#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CALayer+YYAdd.h"
#import "YYKitMacro.h"
#import "YYCGUtilities.h"

@interface CALayer (YYAddLlslog)
- (void)snapshotImageLlslog:(NSString *)llslog;
- (void)snapshotPDFLlslog:(NSString *)llslog;
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius llslog:(NSString *)llslog;
- (void)removeAllSublayersLlslog:(NSString *)llslog;
- (void)leftLlslog:(NSString *)llslog;
- (void)setLeft:(CGFloat)x llslog:(NSString *)llslog;
- (void)topLlslog:(NSString *)llslog;
- (void)setTop:(CGFloat)y llslog:(NSString *)llslog;
- (void)rightLlslog:(NSString *)llslog;
- (void)setRight:(CGFloat)right llslog:(NSString *)llslog;
- (void)bottomLlslog:(NSString *)llslog;
- (void)setBottom:(CGFloat)bottom llslog:(NSString *)llslog;
- (void)widthLlslog:(NSString *)llslog;
- (void)setWidth:(CGFloat)width llslog:(NSString *)llslog;
- (void)heightLlslog:(NSString *)llslog;
- (void)setHeight:(CGFloat)height llslog:(NSString *)llslog;
- (void)centerLlslog:(NSString *)llslog;
- (void)setCenter:(CGPoint)center llslog:(NSString *)llslog;
- (void)centerXLlslog:(NSString *)llslog;
- (void)setCenterX:(CGFloat)centerX llslog:(NSString *)llslog;
- (void)centerYLlslog:(NSString *)llslog;
- (void)setCenterY:(CGFloat)centerY llslog:(NSString *)llslog;
- (void)originLlslog:(NSString *)llslog;
- (void)setOrigin:(CGPoint)origin llslog:(NSString *)llslog;
- (void)frameSizeLlslog:(NSString *)llslog;
- (void)setFrameSize:(CGSize)size llslog:(NSString *)llslog;
- (void)transformRotationLlslog:(NSString *)llslog;
- (void)setTransformRotation:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformRotationXLlslog:(NSString *)llslog;
- (void)setTransformRotationX:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformRotationYLlslog:(NSString *)llslog;
- (void)setTransformRotationY:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformRotationZLlslog:(NSString *)llslog;
- (void)setTransformRotationZ:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformScaleXLlslog:(NSString *)llslog;
- (void)setTransformScaleX:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformScaleYLlslog:(NSString *)llslog;
- (void)setTransformScaleY:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformScaleZLlslog:(NSString *)llslog;
- (void)setTransformScaleZ:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformScaleLlslog:(NSString *)llslog;
- (void)setTransformScale:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformTranslationXLlslog:(NSString *)llslog;
- (void)setTransformTranslationX:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformTranslationYLlslog:(NSString *)llslog;
- (void)setTransformTranslationY:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformTranslationZLlslog:(NSString *)llslog;
- (void)setTransformTranslationZ:(CGFloat)v llslog:(NSString *)llslog;
- (void)transformDepthLlslog:(NSString *)llslog;
- (void)setTransformDepth:(CGFloat)v llslog:(NSString *)llslog;
- (void)contentModeLlslog:(NSString *)llslog;
- (void)setContentMode:(UIViewContentMode)contentMode llslog:(NSString *)llslog;
- (void)addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve llslog:(NSString *)llslog;
- (void)removePreviousFadeAnimationLlslog:(NSString *)llslog;

@end
