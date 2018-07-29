#import <UIKit/UIKit.h>
#import "TZVideoPlayerController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZAssetModel.h"
#import "TZImagePickerController.h"
#import "TZPhotoPreviewController.h"

@interface TZVideoPlayerController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)configMoviePlayerLlslog:(NSString *)llslog;
- (void)addProgressObserverLlslog:(NSString *)llslog;
- (void)configPlayButtonLlslog:(NSString *)llslog;
- (void)configBottomToolBarLlslog:(NSString *)llslog;
- (void)playButtonClickLlslog:(NSString *)llslog;
- (void)doneButtonClickLlslog:(NSString *)llslog;
- (void)callDelegateMethodLlslog:(NSString *)llslog;
- (void)pausePlayerAndShowNaviBarLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;

@end
