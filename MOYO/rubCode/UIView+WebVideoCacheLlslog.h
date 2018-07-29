#import <UIKit/UIKit.h>
#import "JPVideoPlayerManager.h"
#import "UIView+PlayerStatusAndDownloadIndicator.h"
#import "UIView+WebVideoCache.h"
#import "UIView+WebVideoCacheOperation.h"
#import <objc/runtime.h>
#import "JPVideoPlayerPlayVideoTool.h"

@interface UIView (WebVideoCacheLlslog)
- (void)jp_playVideoWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)jp_playVideoHiddenStatusViewWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)jp_playVideoMutedDisplayStatusViewWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)jp_playVideoMutedHiddenStatusViewWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)jp_playVideoWithURL:(NSURL *)url options:(JPVideoPlayerOptions)options progress:(JPVideoPlayerDownloaderProgressBlock)progressBlock completed:(JPVideoPlayerCompletionBlock)completedBlock llslog:(NSString *)llslog;
- (void)jp_stopPlayLlslog:(NSString *)llslog;
- (void)jp_pauseLlslog:(NSString *)llslog;
- (void)jp_resumeLlslog:(NSString *)llslog;
- (void)jp_setPlayerMute:(BOOL)mute llslog:(NSString *)llslog;
- (void)jp_playerIsMuteLlslog:(NSString *)llslog;
- (void)jp_gotoLandscapeLlslog:(NSString *)llslog;
- (void)jp_gotoLandscapeAnimated:(BOOL)animated completion:(JPVideoPlayerScreenAnimationCompletion)completion llslog:(NSString *)llslog;
- (void)jp_gotoPortraitLlslog:(NSString *)llslog;
- (void)jp_gotoPortraitAnimated:(BOOL)animated completion:(JPVideoPlayerScreenAnimationCompletion)completion llslog:(NSString *)llslog;
- (void)finishPortraitLlslog:(NSString *)llslog;
- (void)executePortraitLlslog:(NSString *)llslog;
- (void)executeLandscapeLlslog:(NSString *)llslog;
- (void)refreshStatusBarOrientation:(UIInterfaceOrientation)interfaceOrientation llslog:(NSString *)llslog;
- (void)setParentView_beforeFullScreen:(UIView *)parentView_beforeFullScreen llslog:(NSString *)llslog;
- (void)setPlayingStatus:(JPVideoPlayerPlayingStatus)playingStatus llslog:(NSString *)llslog;
- (void)playingStatusLlslog:(NSString *)llslog;
- (void)parentView_beforeFullScreenLlslog:(NSString *)llslog;
- (void)setFrame_beforeFullScreen:(NSValue *)frame_beforeFullScreen llslog:(NSString *)llslog;
- (void)frame_beforeFullScreenLlslog:(NSString *)llslog;
- (void)setViewStatus:(JPVideoPlayerVideoViewStatus)viewStatus llslog:(NSString *)llslog;
- (void)viewStatusLlslog:(NSString *)llslog;
- (void)jp_videoPlayerDelegateLlslog:(NSString *)llslog;
- (void)setJp_videoPlayerDelegate:(id<JPVideoPlayerDelegate>)jp_videoPlayerDelegate llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldDownloadVideoForURL:(NSURL *)videoURL llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldAutoReplayForURL:(NSURL *)videoURL llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager playingStatusDidChanged:(JPVideoPlayerPlayingStatus)playingStatus llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager downloadingProgressDidChanged:(CGFloat)downloadingProgress llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager playingProgressDidChanged:(CGFloat)playingProgress llslog:(NSString *)llslog;

@end
