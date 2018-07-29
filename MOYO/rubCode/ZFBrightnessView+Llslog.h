#import <UIKit/UIKit.h>
#import "ZFBrightnessView.h"
#import "ZFPlayer.h"

@interface ZFBrightnessView (Llslog)
+ (void)sharedBrightnessViewLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)createTipsLlslog:(NSString *)llslog;
- (void)addNotificationLlslog:(NSString *)llslog;
- (void)addObserverLlslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context llslog:(NSString *)llslog;
- (void)updateLayer:(NSNotification *)notify llslog:(NSString *)llslog;
- (void)appearSoundViewLlslog:(NSString *)llslog;
- (void)disAppearSoundViewLlslog:(NSString *)llslog;
- (void)updateLongView:(CGFloat)sound llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)setIsStatusBarHidden:(BOOL)isStatusBarHidden llslog:(NSString *)llslog;
- (void)setIsLandscape:(BOOL)isLandscape llslog:(NSString *)llslog;

@end
