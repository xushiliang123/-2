#import "EMCDDeviceManager.h"
#import <AudioToolbox/AudioToolbox.h>
#import "EMCDDeviceManager+Remind.h"

@interface EMCDDeviceManager (RemindLlslog)
- (void)playNewMessageSoundLlslog:(NSString *)llslog;
- (void)playVibrationLlslog:(NSString *)llslog;

@end
