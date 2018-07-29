#import "EMCDDeviceManager+Llslog.h"
@implementation EMCDDeviceManager (Llslog)
+ (void)sharedInstanceLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)registerNotificationsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)unregisterNotificationsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_setupProximitySensorLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
