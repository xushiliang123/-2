#import "JPVideoPlayerManager+Llslog.h"
@implementation JPVideoPlayerManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCache:(nonnull JPVideoPlayerCache *)cache downloader:(nonnull JPVideoPlayerDownloader *)downloader llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadVideoWithURL:(nullable NSURL *)url showOnView:(nullable UIView *)showView options:(JPVideoPlayerOptions)options progress:(nullable JPVideoPlayerDownloaderProgressBlock)progressBlock completed:(nullable JPVideoPlayerCompletionBlock)completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cancelAllDownloadsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cacheKeyForURL:(nullable NSURL *)url llslog:(NSString *)llslog {
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
- (void)setPlayerMute:(BOOL)mute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playerIsMuteLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playVideoTool:(JPVideoPlayerPlayVideoTool *)videoTool shouldAutoReplayVideoForURL:(NSURL *)videoURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playVideoTool:(JPVideoPlayerPlayVideoTool *)videoTool playingStatuDidChanged:(JPVideoPlayerPlayingStatus)playingStatus llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)needDisplayDownloadingProgressViewWithDownloadingProgressValue:(CGFloat)downloadingProgress llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)needDisplayPlayingProgressViewWithPlayingProgressValue:(CGFloat)playingProgress llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideAllIndicatorAndProgressViewsWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideActivityViewWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideProgressViewWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)progressRefreshWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options receiveSize:(NSUInteger)receiveSize exceptSize:(NSUInteger)expectedSize llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showProgressViewAndActivityIndicatorViewForView:(UIView *)view options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)diskVideoExistsForURL:(nullable NSURL *)url completion:(nullable JPVideoPlayerCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
