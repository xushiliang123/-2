#import "EMCDDeviceManagerBase.h"
#import <UIKit/UIKit.h>
#import "EMCDDeviceManager+ProximitySensor.h"

@interface EMCDDeviceManager (ProximitySensorLlslog)
- (void)isProximitySensorEnabledLlslog:(NSString *)llslog;
- (void)enableProximitySensorLlslog:(NSString *)llslog;
- (void)disableProximitySensorLlslog:(NSString *)llslog;
- (void)sensorStateChanged:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)isCloseToUserLlslog:(NSString *)llslog;
- (void)isSupportProximitySensorLlslog:(NSString *)llslog;

@end
