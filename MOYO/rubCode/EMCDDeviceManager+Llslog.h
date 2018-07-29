#import <Foundation/Foundation.h>
#import "EMCDDeviceManagerDelegate.h"
#import <UIKit/UIKit.h>
#import "EMCDDeviceManagerBase.h"
#import "EMCDDeviceManager+ProximitySensor.h"

@interface EMCDDeviceManager (Llslog)
+ (void)sharedInstanceLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)registerNotificationsLlslog:(NSString *)llslog;
- (void)unregisterNotificationsLlslog:(NSString *)llslog;
- (void)_setupProximitySensorLlslog:(NSString *)llslog;

@end
