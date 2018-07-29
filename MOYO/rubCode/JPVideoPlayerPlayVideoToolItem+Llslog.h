#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JPVideoPlayerManager.h"
#import "JPVideoPlayerPlayVideoTool.h"
#import "JPVideoPlayerResourceLoader.h"
#import "UIView+PlayerStatusAndDownloadIndicator.h"
#import "JPVideoPlayerDownloaderOperation.h"
#import "JPVideoPlayerCompat.h"
#import "UIView+WebVideoCache.h"

@interface JPVideoPlayerPlayVideoToolItem (Llslog)
- (void)stopPlayVideoLlslog:(NSString *)llslog;
- (void)pausePlayVideoLlslog:(NSString *)llslog;
- (void)resumePlayVideoLlslog:(NSString *)llslog;
- (void)resetLlslog:(NSString *)llslog;

@end
