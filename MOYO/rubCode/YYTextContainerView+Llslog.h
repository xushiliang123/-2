#import <UIKit/UIKit.h>
#import <YYKit/YYTextLayout.h>
#import "YYTextLayout.h"
#import "YYTextContainerView.h"

@interface YYTextContainerView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setDebugOption:(YYTextDebugOption *)debugOption llslog:(NSString *)llslog;
- (void)setTextVerticalAlignment:(YYTextVerticalAlignment)textVerticalAlignment llslog:(NSString *)llslog;
- (void)setContentsFadeDuration:(NSTimeInterval)contentsFadeDuration llslog:(NSString *)llslog;
- (void)setLayout:(YYTextLayout *)layout llslog:(NSString *)llslog;
- (void)setLayout:(YYTextLayout *)layout withFadeDuration:(NSTimeInterval)fadeDuration llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)setFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setBounds:(CGRect)bounds llslog:(NSString *)llslog;
- (void)canBecomeFirstResponderLlslog:(NSString *)llslog;
- (void)canPerformAction:(SEL)action withSender:(id)sender llslog:(NSString *)llslog;
- (void)forwardingTargetForSelector:(SEL)aSelector llslog:(NSString *)llslog;

@end
