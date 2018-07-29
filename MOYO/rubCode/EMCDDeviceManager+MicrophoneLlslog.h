#import "EMCDDeviceManager.h"
#import "EMCDDeviceManager+Microphone.h"
#import "EMAudioRecorderUtil.h"

@interface EMCDDeviceManager (MicrophoneLlslog)
- (void)emCheckMicrophoneAvailabilityLlslog:(NSString *)llslog;
- (void)emPeekRecorderVoiceMeterLlslog:(NSString *)llslog;

@end
