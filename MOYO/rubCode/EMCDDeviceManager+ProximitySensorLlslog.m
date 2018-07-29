#import "EMCDDeviceManager+ProximitySensorLlslog.h"
@implementation EMCDDeviceManager (ProximitySensorLlslog)
- (void)isProximitySensorEnabledLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)enableProximitySensorLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)disableProximitySensorLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sensorStateChanged:(NSNotification *)notification llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isCloseToUserLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isSupportProximitySensorLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
