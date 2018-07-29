#import "EMCDDeviceManagerBase.h"
#import "EMCDDeviceManager+Media.h"
#import "EMAudioPlayerUtil.h"
#import "EMAudioRecorderUtil.h"
#import "EMVoiceConverter.h"
#import "DemoErrorCode.h"
#import "EaseLocalDefine.h"

@interface EMCDDeviceManager (MediaLlslog)
+ (void)dataPathLlslog:(NSString *)llslog;
- (void)asyncPlayingWithPath:(NSString *)aFilePath
                  completion:(void(^)(NSError *error))completon llslog:(NSString *)llslog;
- (void)stopPlayingLlslog:(NSString *)llslog;
- (void)stopPlayingWithChangeCategory:(BOOL)isChange llslog:(NSString *)llslog;
- (void)isPlayingLlslog:(NSString *)llslog;
+ (void)recordMinDurationLlslog:(NSString *)llslog;
- (void)asyncStartRecordingWithFileName:(NSString *)fileName
                             completion:(void(^)(NSError *error))completion llslog:(NSString *)llslog;
- (void)asyncStopRecordingWithCompletion:(void(^)(NSString *recordPath,
                                                 NSInteger aDuration,
                                                 NSError *error))completion llslog:(NSString *)llslog;
- (void)cancelCurrentRecordingLlslog:(NSString *)llslog;
- (void)isRecordingLlslog:(NSString *)llslog;

- (void)convertAMR:(NSString *)amrFilePath
             toWAV:(NSString *)wavFilePath llslog:(NSString *)llslog;
- (void)convertWAV:(NSString *)wavFilePath
             toAMR:(NSString *)amrFilePath llslog:(NSString *)llslog;

@end
