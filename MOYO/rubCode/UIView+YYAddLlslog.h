#import <UIKit/UIKit.h>
#import "UIView+YYAdd.h"
#import <QuartzCore/QuartzCore.h>
#import "YYKitMacro.h"

@interface UIView (YYAddLlslog)
- (void)snapshotImageLlslog:(NSString *)llslog;
- (void)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates llslog:(NSString *)llslog;
- (void)snapshotPDFLlslog:(NSString *)llslog;
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius llslog:(NSString *)llslog;
- (void)removeAllSubviewsLlslog:(NSString *)llslog;
- (void)viewControllerLlslog:(NSString *)llslog;
- (void)visibleAlphaLlslog:(NSString *)llslog;
- (void)convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view llslog:(NSString *)llslog;
- (void)convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view llslog:(NSString *)llslog;
- (void)convertRect:(CGRect)rect toViewOrWindow:(UIView *)view llslog:(NSString *)llslog;
- (void)convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view llslog:(NSString *)llslog;
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
- (void)centerXLlslog:(NSString *)llslog;
- (void)setCenterX:(CGFloat)centerX llslog:(NSString *)llslog;
- (void)centerYLlslog:(NSString *)llslog;
- (void)setCenterY:(CGFloat)centerY llslog:(NSString *)llslog;
- (void)originLlslog:(NSString *)llslog;
- (void)setOrigin:(CGPoint)origin llslog:(NSString *)llslog;
- (void)sizeLlslog:(NSString *)llslog;
- (void)setSize:(CGSize)size llslog:(NSString *)llslog;

@end
