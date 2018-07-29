#import <UIKit/UIKit.h>
#import "YYAnimatedImageView.h"
#import "YYWeakProxy.h"
#import "UIDevice+YYAdd.h"
#import "YYImageCoder.h"
#import "YYKitMacro.h"

@interface YYAnimatedImageView (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage llslog:(NSString *)llslog;
- (void)resetAnimatedLlslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)setHighlightedImage:(UIImage *)highlightedImage llslog:(NSString *)llslog;
- (void)setAnimationImages:(NSArray *)animationImages llslog:(NSString *)llslog;
- (void)setHighlightedAnimationImages:(NSArray *)highlightedAnimationImages llslog:(NSString *)llslog;
- (void)setHighlighted:(BOOL)highlighted llslog:(NSString *)llslog;

- (void)imageChangedLlslog:(NSString *)llslog;
- (void)calcMaxBufferCountLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)isAnimatingLlslog:(NSString *)llslog;
- (void)stopAnimatingLlslog:(NSString *)llslog;
- (void)startAnimatingLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarning:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)didEnterBackground:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)step:(CADisplayLink *)link llslog:(NSString *)llslog;
- (void)displayLayer:(CALayer *)layer llslog:(NSString *)llslog;
- (void)setContentsRect:(CGRect)rect forImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)didMovedLlslog:(NSString *)llslog;
- (void)didMoveToWindowLlslog:(NSString *)llslog;
- (void)didMoveToSuperviewLlslog:(NSString *)llslog;
- (void)setCurrentAnimatedImageIndex:(NSUInteger)currentAnimatedImageIndex llslog:(NSString *)llslog;
- (void)currentAnimatedImageIndexLlslog:(NSString *)llslog;
- (void)setRunloopMode:(NSString *)runloopMode llslog:(NSString *)llslog;
+ (void)automaticallyNotifiesObserversForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;

@end
