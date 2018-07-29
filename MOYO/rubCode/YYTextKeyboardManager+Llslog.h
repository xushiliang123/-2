#import <UIKit/UIKit.h>
#import "YYTextKeyboardManager.h"
#import "UIApplication+YYAdd.h"
#import <objc/runtime.h>

@interface YYTextKeyboardManager (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)_initLlslog:(NSString *)llslog;
- (void)_initFrameObserverLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
+ (void)defaultManagerLlslog:(NSString *)llslog;
+ (void)loadLlslog:(NSString *)llslog;
- (void)addObserver:(id<YYTextKeyboardObserver>)observer llslog:(NSString *)llslog;
- (void)removeObserver:(id<YYTextKeyboardObserver>)observer llslog:(NSString *)llslog;
- (void)keyboardWindowLlslog:(NSString *)llslog;
- (void)keyboardViewLlslog:(NSString *)llslog;
- (void)isKeyboardVisibleLlslog:(NSString *)llslog;
- (void)keyboardFrameLlslog:(NSString *)llslog;
- (void)_systemVersionLlslog:(NSString *)llslog;
- (void)_getKeyboardViewFromWindow:(UIWindow *)window llslog:(NSString *)llslog;
- (void)_keyboardFrameWillChangeNotification:(NSNotification *)notif llslog:(NSString *)llslog;
- (void)_keyboardFrameDidChangeNotification:(NSNotification *)notif llslog:(NSString *)llslog;
- (void)_keyboardFrameChanged:(UIView *)keyboard llslog:(NSString *)llslog;
- (void)_notifyAllObserversLlslog:(NSString *)llslog;
- (void)convertRect:(CGRect)rect toView:(UIView *)view llslog:(NSString *)llslog;

@end
