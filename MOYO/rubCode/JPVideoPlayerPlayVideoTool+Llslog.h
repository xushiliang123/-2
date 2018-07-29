#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JPVideoPlayerManager.h"
#import "JPVideoPlayerPlayVideoTool.h"
#import "JPVideoPlayerResourceLoader.h"
#import "UIView+PlayerStatusAndDownloadIndicator.h"
#import "JPVideoPlayerDownloaderOperation.h"
#import "JPVideoPlayerCompat.h"
#import "UIView+WebVideoCache.h"

@interface JPVideoPlayerPlayVideoTool (Llslog)
+ (void)sharedToolLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)playExistedVideoWithURL:(NSURL * _Nullable)url fullVideoCachePath:(NSString * _Nullable)fullVideoCachePath options:(JPVideoPlayerOptions)options showOnView:(UIView * _Nullable)showView playingProgress:(JPVideoPlayerPlayVideoToolPlayingProgressBlock _Nullable )progress error:(nullable JPVideoPlayerPlayVideoToolErrorBlock)error llslog:(NSString *)llslog;
- (void)playVideoWithURL:(NSURL * _Nullable)url tempVideoCachePath:(NSString * _Nullable)tempVideoCachePath options:(JPVideoPlayerOptions)options videoFileExceptSize:(NSUInteger)exceptSize videoFileReceivedSize:(NSUInteger)receivedSize showOnView:(UIView * _Nullable)showView playingProgress:(JPVideoPlayerPlayVideoToolPlayingProgressBlock _Nullable )progress error:(nullable JPVideoPlayerPlayVideoToolErrorBlock)error llslog:(NSString *)llslog;
- (void)didReceivedDataCacheInDiskByTempPath:(NSString * _Nonnull)tempCacheVideoPath videoFileExceptSize:(NSUInteger)expectedSize videoFileReceivedSize:(NSUInteger)receivedSize llslog:(NSString *)llslog;
- (void)didCachedVideoDataFinishedFromWebFullVideoCachePath:(NSString * _Nullable)fullVideoCachePath llslog:(NSString *)llslog;
- (void)setMute:(BOOL)mute llslog:(NSString *)llslog;
- (void)stopPlayLlslog:(NSString *)llslog;
- (void)pauseLlslog:(NSString *)llslog;
- (void)resumeLlslog:(NSString *)llslog;
- (void)addObserverOnceLlslog:(NSString *)llslog;
- (void)appReceivedMemoryWarningLlslog:(NSString *)llslog;
- (void)appDidEnterBackgroundLlslog:(NSString *)llslog;
- (void)appDidEnterPlayGroundLlslog:(NSString *)llslog;
- (void)playerItemDidPlayToEnd:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context llslog:(NSString *)llslog;
- (void)startDownloadLlslog:(NSString *)llslog;
- (void)finishedDownloadLlslog:(NSString *)llslog;
- (void)showActivaityIndicatorViewLlslog:(NSString *)llslog;
- (void)hideActivaityIndicatorViewLlslog:(NSString *)llslog;
- (void)setCurrentPlayVideoItem:(JPVideoPlayerPlayVideoToolItem *)currentPlayVideoItem llslog:(NSString *)llslog;
- (void)handleVideoURLLlslog:(NSString *)llslog;
- (void)displayVideoPicturesOnShowLayerLlslog:(NSString *)llslog;

@end
