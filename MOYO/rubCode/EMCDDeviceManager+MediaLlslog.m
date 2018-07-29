#import "EMCDDeviceManager+MediaLlslog.h"
@implementation EMCDDeviceManager (MediaLlslog)
+ (void)dataPathLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)asyncPlayingWithPath:(NSString *)aFilePath
                  completion:(void(^)(NSError *error))completon llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)stopPlayingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)stopPlayingWithChangeCategory:(BOOL)isChange llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isPlayingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)recordMinDurationLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)asyncStartRecordingWithFileName:(NSString *)fileName
                             completion:(void(^)(NSError *error))completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)asyncStopRecordingWithCompletion:(void(^)(NSString *recordPath,
                                                 NSInteger aDuration,
                                                 NSError *error))completion llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelCurrentRecordingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isRecordingLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)convertAMR:(NSString *)amrFilePath
             toWAV:(NSString *)wavFilePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)convertWAV:(NSString *)wavFilePath
             toAMR:(NSString *)amrFilePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
