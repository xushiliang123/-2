#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "MBProgressHUD.h"
#import <tgmath.h>

@interface MBProgressHUD (Llslog)
+ (void)showHUDAddedTo:(UIView *)view animated:(BOOL)animated llslog:(NSString *)llslog;
+ (void)hideHUDForView:(UIView *)view animated:(BOOL)animated llslog:(NSString *)llslog;
+ (void)hideAllHUDsForView:(UIView *)view animated:(BOOL)animated llslog:(NSString *)llslog;
+ (void)HUDForView:(UIView *)view llslog:(NSString *)llslog;
+ (void)allHUDsForView:(UIView *)view llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithView:(UIView *)view llslog:(NSString *)llslog;
- (void)initWithWindow:(UIWindow *)window llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)show:(BOOL)animated llslog:(NSString *)llslog;
- (void)hide:(BOOL)animated llslog:(NSString *)llslog;
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay llslog:(NSString *)llslog;
- (void)hideDelayed:(NSNumber *)animated llslog:(NSString *)llslog;
- (void)handleGraceTimer:(NSTimer *)theTimer llslog:(NSString *)llslog;
- (void)handleMinShowTimer:(NSTimer *)theTimer llslog:(NSString *)llslog;
- (void)didMoveToSuperviewLlslog:(NSString *)llslog;
- (void)showUsingAnimation:(BOOL)animated llslog:(NSString *)llslog;
- (void)hideUsingAnimation:(BOOL)animated llslog:(NSString *)llslog;
- (void)animationFinished:(NSString *)animationID finished:(BOOL)finished context:(void*)context llslog:(NSString *)llslog;
- (void)doneLlslog:(NSString *)llslog;
- (void)showWhileExecuting:(SEL)method onTarget:(id)target withObject:(id)object animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block llslog:(NSString *)llslog;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block completionBlock:(void (^)())completion llslog:(NSString *)llslog;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue llslog:(NSString *)llslog;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue
	 completionBlock:(MBProgressHUDCompletionBlock)completion llslog:(NSString *)llslog;
- (void)launchExecutionLlslog:(NSString *)llslog;
- (void)cleanUpLlslog:(NSString *)llslog;
- (void)setupLabelsLlslog:(NSString *)llslog;
- (void)updateIndicatorsLlslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)registerForKVOLlslog:(NSString *)llslog;
- (void)unregisterFromKVOLlslog:(NSString *)llslog;
- (void)observableKeypathsLlslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog;
- (void)updateUIForKeypath:(NSString *)keyPath llslog:(NSString *)llslog;
- (void)registerForNotificationsLlslog:(NSString *)llslog;
- (void)unregisterFromNotificationsLlslog:(NSString *)llslog;
- (void)statusBarOrientationDidChange:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)updateForCurrentOrientationAnimated:(BOOL)animated llslog:(NSString *)llslog;

@end
