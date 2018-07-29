#import "JPVideoPlayerPlayVideoTool+Llslog.h"
@implementation JPVideoPlayerPlayVideoTool (Llslog)
+ (void)sharedToolLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playExistedVideoWithURL:(NSURL * _Nullable)url fullVideoCachePath:(NSString * _Nullable)fullVideoCachePath options:(JPVideoPlayerOptions)options showOnView:(UIView * _Nullable)showView playingProgress:(JPVideoPlayerPlayVideoToolPlayingProgressBlock _Nullable )progress error:(nullable JPVideoPlayerPlayVideoToolErrorBlock)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playVideoWithURL:(NSURL * _Nullable)url tempVideoCachePath:(NSString * _Nullable)tempVideoCachePath options:(JPVideoPlayerOptions)options videoFileExceptSize:(NSUInteger)exceptSize videoFileReceivedSize:(NSUInteger)receivedSize showOnView:(UIView * _Nullable)showView playingProgress:(JPVideoPlayerPlayVideoToolPlayingProgressBlock _Nullable )progress error:(nullable JPVideoPlayerPlayVideoToolErrorBlock)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceivedDataCacheInDiskByTempPath:(NSString * _Nonnull)tempCacheVideoPath videoFileExceptSize:(NSUInteger)expectedSize videoFileReceivedSize:(NSUInteger)receivedSize llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didCachedVideoDataFinishedFromWebFullVideoCachePath:(NSString * _Nullable)fullVideoCachePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setMute:(BOOL)mute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)stopPlayLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pauseLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)resumeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addObserverOnceLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)appReceivedMemoryWarningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)appDidEnterBackgroundLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)appDidEnterPlayGroundLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playerItemDidPlayToEnd:(NSNotification *)notification llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)startDownloadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)finishedDownloadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showActivaityIndicatorViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideActivaityIndicatorViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCurrentPlayVideoItem:(JPVideoPlayerPlayVideoToolItem *)currentPlayVideoItem llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleVideoURLLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)displayVideoPicturesOnShowLayerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
