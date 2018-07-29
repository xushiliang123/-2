#import "EMCDDeviceManager+MicrophoneLlslog.h"
@implementation EMCDDeviceManager (MicrophoneLlslog)
- (void)emCheckMicrophoneAvailabilityLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)emPeekRecorderVoiceMeterLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
