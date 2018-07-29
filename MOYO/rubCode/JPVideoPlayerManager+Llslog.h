#import <UIKit/UIKit.h>
#import "JPVideoPlayerDownloader.h"
#import "JPVideoPlayerCache.h"
#import "JPVideoPlayerOperation.h"
#import "JPVideoPlayerManager.h"
#import "JPVideoPlayerCompat.h"
#import "JPVideoPlayerCachePathTool.h"
#import "JPVideoPlayerPlayVideoTool.h"
#import "JPVideoPlayerDownloaderOperation.h"
#import "UIView+WebVideoCacheOperation.h"
#import "UIView+PlayerStatusAndDownloadIndicator.h"
#import "UIView+WebVideoCache.h"

@interface JPVideoPlayerManager (Llslog)
+ (void)sharedManagerLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithCache:(nonnull JPVideoPlayerCache *)cache downloader:(nonnull JPVideoPlayerDownloader *)downloader llslog:(NSString *)llslog;
- (void)loadVideoWithURL:(nullable NSURL *)url showOnView:(nullable UIView *)showView options:(JPVideoPlayerOptions)options progress:(nullable JPVideoPlayerDownloaderProgressBlock)progressBlock completed:(nullable JPVideoPlayerCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)cancelAllDownloadsLlslog:(NSString *)llslog;
- (void)cacheKeyForURL:(nullable NSURL *)url llslog:(NSString *)llslog;
- (void)stopPlayLlslog:(NSString *)llslog;
- (void)pauseLlslog:(NSString *)llslog;
- (void)resumeLlslog:(NSString *)llslog;
- (void)setPlayerMute:(BOOL)mute llslog:(NSString *)llslog;
- (void)playerIsMuteLlslog:(NSString *)llslog;
- (void)playVideoTool:(JPVideoPlayerPlayVideoTool *)videoTool shouldAutoReplayVideoForURL:(NSURL *)videoURL llslog:(NSString *)llslog;
- (void)playVideoTool:(JPVideoPlayerPlayVideoTool *)videoTool playingStatuDidChanged:(JPVideoPlayerPlayingStatus)playingStatus llslog:(NSString *)llslog;
- (void)needDisplayDownloadingProgressViewWithDownloadingProgressValue:(CGFloat)downloadingProgress llslog:(NSString *)llslog;
- (void)needDisplayPlayingProgressViewWithPlayingProgressValue:(CGFloat)playingProgress llslog:(NSString *)llslog;
- (void)hideAllIndicatorAndProgressViewsWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog;
- (void)hideActivityViewWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog;
- (void)hideProgressViewWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog;
- (void)progressRefreshWithURL:(nullable NSURL *)url options:(JPVideoPlayerOptions)options receiveSize:(NSUInteger)receiveSize exceptSize:(NSUInteger)expectedSize llslog:(NSString *)llslog;
- (void)showProgressViewAndActivityIndicatorViewForView:(UIView *)view options:(JPVideoPlayerOptions)options llslog:(NSString *)llslog;

- (void)diskVideoExistsForURL:(nullable NSURL *)url completion:(nullable JPVideoPlayerCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog;

@end
