#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "UIView+CustomControlView.h"
#import <objc/runtime.h>

@interface UIView (CustomControlViewLlslog)
- (void)setDelegate:(id<ZFPlayerControlViewDelagate>)delegate llslog:(NSString *)llslog;
- (void)delegateLlslog:(NSString *)llslog;
- (void)zf_playerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog;
- (void)zf_playerShowOrHideControlViewLlslog:(NSString *)llslog;
- (void)zf_playerShowControlViewLlslog:(NSString *)llslog;
- (void)zf_playerHideControlViewLlslog:(NSString *)llslog;
- (void)zf_playerResetControlViewLlslog:(NSString *)llslog;
- (void)zf_playerResetControlViewForResolutionLlslog:(NSString *)llslog;
- (void)zf_playerCancelAutoFadeOutControlViewLlslog:(NSString *)llslog;
- (void)zf_playerItemPlayingLlslog:(NSString *)llslog;
- (void)zf_playerPlayEndLlslog:(NSString *)llslog;
- (void)zf_playerHasDownloadFunction:(BOOL)sender llslog:(NSString *)llslog;
- (void)zf_playerDownloadBtnState:(BOOL)state llslog:(NSString *)llslog;
- (void)zf_playerResolutionArray:(NSArray *)resolutionArray llslog:(NSString *)llslog;
- (void)zf_playerPlayBtnState:(BOOL)state llslog:(NSString *)llslog;
- (void)zf_playerLockBtnState:(BOOL)state llslog:(NSString *)llslog;
- (void)zf_playerActivity:(BOOL)animated llslog:(NSString *)llslog;
- (void)zf_playerDraggedTime:(NSInteger)draggedTime sliderImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)zf_playerDraggedTime:(NSInteger)draggedTime totalTime:(NSInteger)totalTime isForward:(BOOL)forawrd hasPreview:(BOOL)preview llslog:(NSString *)llslog;
- (void)zf_playerDraggedEndLlslog:(NSString *)llslog;
- (void)zf_playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime sliderValue:(CGFloat)value llslog:(NSString *)llslog;
- (void)zf_playerSetProgress:(CGFloat)progress llslog:(NSString *)llslog;
- (void)zf_playerItemStatusFailed:(NSError *)error llslog:(NSString *)llslog;
- (void)zf_playerBottomShrinkPlayLlslog:(NSString *)llslog;
- (void)zf_playerCellPlayLlslog:(NSString *)llslog;

@end
